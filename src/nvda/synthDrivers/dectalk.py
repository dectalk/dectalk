# Future Modules:
from __future__ import annotations

# Built-in Modules:
from collections import OrderedDict
from ctypes import (
	byref,
	c_char,
	c_void_p,
	cast,
	cdll,
	create_string_buffer,
	POINTER,
	pointer,
	sizeof,
	string_at,
	Structure,
	windll,
)
from ctypes.wintypes import DWORD
from io import BytesIO
import logging
import os
from queue import SimpleQueue, Empty as QueueEmptyError
import threading

# NVDA Modules:
import config
from logHandler import log
from nvwave import WavePlayer
import speech
from speech.commands import IndexCommand, CharacterModeCommand, PitchCommand, SpeechCommand
import synthDriverHandler
from winUser import WNDCLASSEXW, WNDPROC


DECTALK_PATH = os.path.abspath(os.path.join(os.path.dirname(__file__), "dectalk.dll"))
OWN_AUDIO_DEVICE = 1
DO_NOT_USE_AUDIO_DEVICE = 0x80000000
FORMAT = 0x00000004  # 11025KHZ mono.
INDEX_ARRAY_SIZE = 1
SAMPLES = 2048


dectalk = cdll.LoadLibrary(DECTALK_PATH)


def errcheck(res, func, args):
	if res != 0:
		raise RuntimeError("%s: code %d" % (func.__name__, res))
	return res


dectalk.TextToSpeechStartup.errcheck = errcheck
dectalk.TextToSpeechSpeak.errcheck = errcheck
dectalk.TextToSpeechAddBuffer.errcheck = errcheck
dectalk.TextToSpeechOpenInMemory.errcheck = errcheck
dectalk.TextToSpeechGetCaps.errcheck = errcheck


def clear_queue(q):
	while not q.empty():
		try:
			q.get_nowait()
		except QueueEmptyError:
			continue


def _bgExec(q, func, *args, **kwargs):
	q.put((func, args, kwargs))


class BgThread(threading.Thread):
	def __init__(self, q):
		threading.Thread.__init__(self)
		self.setDaemon(True)
		self.finished = threading.Event()
		self.q = q

	def close(self):
		self.finished.set()

	def run(self):
		while not self.finished.is_set():
			try:
				func, args, kwargs = self.q.get()
				if func is None:
					self.close()
				else:
					func(*args, **kwargs)
			except Exception:
				logging.error("bgThread.run", exc_info=True)


class TTS_CAPS_T(Structure):
	_fields_ = [
		("dwNumberOfLanguages", DWORD),
		("lpLanguageParamsArray", c_void_p),  # Don't care.
		("dwSampleRate", DWORD),
		("dwMinimumSpeakingRate", DWORD),
		("dwMaximumSpeakingRate", DWORD),
		("dwNumberOfPredefinedSpeakers", DWORD),
		("dwCharacterSet", DWORD),
		("version", DWORD),
	]


class TTS_INDEX_T(Structure):
	_fields_ = [
		("dwIndexValue", DWORD),
		("dwIndexSampleNumber", DWORD),
		("dwReserved", DWORD),
	]


class TTS_BUFFER_T(Structure):
	_fields_ = [
		("lpData", POINTER(c_char * (SAMPLES * 2))),
		("lpPhonemeArray", c_void_p),
		("lpIndexArray", POINTER(INDEX_ARRAY_SIZE * TTS_INDEX_T)),
		("dwMaximumBufferLength", DWORD),
		("dwMaximumNumberOfPhonemeChanges", DWORD),
		("dwMaximumNumberOfIndexMarks", DWORD),
		("dwBufferLength", DWORD),
		("dwNumberOfPhonemeChanges", DWORD),
		("dwNumberOfIndexMarks", DWORD),
		("dwReserved", DWORD),
	]


class SynthDriver(synthDriverHandler.SynthDriver):
	name = "dectalk"
	description = _("DECtalk")  # NOQA: F821
	language = None
	supportedSettings = (
		synthDriverHandler.SynthDriver.VoiceSetting(),
		synthDriverHandler.SynthDriver.RateSetting(),
		synthDriverHandler.SynthDriver.PitchSetting(),
		synthDriverHandler.SynthDriver.InflectionSetting(),
	)
	supportedCommands = {
		IndexCommand,
		CharacterModeCommand,
		PitchCommand,
	}
	supportedNotifications = {
		synthDriverHandler.synthIndexReached,
		synthDriverHandler.synthDoneSpeaking,
	}
	_voices = OrderedDict()
	_voices["Paul"] = {"name": "Perfect Paul", "pitch": 122, "inflection": 100}
	_voices["Betty"] = {"name": "Beautiful Betty", "pitch": 208, "inflection": 240}
	_voices["Harry"] = {"name": "Huge Harry", "pitch": 89, "inflection": 80}
	_voices["Frank"] = {"name": "Frail Frank", "pitch": 155, "inflection": 90}
	_voices["Dennis"] = {"name": "Doctor Dennis", "pitch": 110, "inflection": 135}
	_voices["Kit"] = {"name": "Kit The Kid", "pitch": 296, "inflection": 180}
	_voices["Ursula"] = {"name": "Uppity Ursula", "pitch": 240, "inflection": 135}
	_voices["Rita"] = {"name": "Rough Rita", "pitch": 106, "inflection": 80}
	_voices["Wendy"] = {"name": "Whispering Wendy", "pitch": 200, "inflection": 175}
	minInflection = 0
	maxInflection = 250
	minPitch = 50
	maxPitch = 350
	minRate = 75
	maxRate = 650
	wmIndex = 0
	wmBuffer = 0
	appInstance = windll.kernel32.GetModuleHandleW(None)
	nvdaDtSoftWndCls = WNDCLASSEXW()
	nvdaDtSoftWndCls.cbSize = sizeof(nvdaDtSoftWndCls)
	nvdaDtSoftWndCls.hInstance = appInstance
	nvdaDtSoftWndCls.lpszClassName = "nvdaDtSoftWndCls"

	@classmethod
	def check(cls):
		return True

	def __init__(self):
		global g_stream
		self.mapping = windll.kernel32.CreateFileMappingA(0xFFFFFFFF, 0, 4, 0, 512, b"a32DECtalkDllFileMap")
		buf = windll.kernel32.MapViewOfFile(self.mapping, 2, 0, 0, 0)
		array = (c_char * 512).from_address(buf)
		array.value = b"\0\0\0\0r250hRm2no9fmP75YwvRhnRB81Uv6vZOTb7SdKWKae8k3BXL8U6r??3B0P91"
		self._voice = "Paul"
		self.dt_inflection = self._voices[self._voice]["inflection"]
		self.dt_pitch = self._voices[self._voice]["pitch"]
		self.dt_rate = 180
		self.audioData = BytesIO()
		self.setup_wndproc()
		self._messageWindowClassAtom = windll.user32.RegisterClassExW(byref(self.nvdaDtSoftWndCls))
		self._messageWindow = windll.user32.CreateWindowExW(
			0,
			self._messageWindowClassAtom,
			"nvdaDtSoftWndCls window",
			0,
			0,
			0,
			0,
			0,
			None,
			None,
			self.appInstance,
			None,
		)
		self.handle = c_void_p()
		cwd = os.getcwd()
		os.chdir(os.path.dirname(__file__))
		dectalk.TextToSpeechStartup(self._messageWindow, byref(self.handle), -1, DO_NOT_USE_AUDIO_DEVICE)
		caps = TTS_CAPS_T()
		dectalk.TextToSpeechGetCaps(byref(caps))
		self.maxRate = caps.dwMaximumSpeakingRate
		self.minRate = caps.dwMinimumSpeakingRate
		self.dt_version = caps.version
		log.info("DECTalk Version %s.", self.dt_version)
		os.chdir(cwd)
		self.wmIndex = windll.user32.RegisterWindowMessageW("DECtalkIndexMessage")
		self.wmBuffer = windll.user32.RegisterWindowMessageW("DECtalkBufferMessage")
		self.mem_buffer = TTS_BUFFER_T()
		self.index_array = (TTS_INDEX_T * INDEX_ARRAY_SIZE)()
		buffer = create_string_buffer(SAMPLES * 2)
		self.mem_buffer.lpData = pointer(buffer)
		self.mem_buffer.lpIndexArray = pointer(self.index_array)
		self.mem_buffer.dwMaximumBufferLength = SAMPLES * 2
		self.mem_buffer.dwMaximumNumberOfIndexMarks = INDEX_ARRAY_SIZE
		dectalk.TextToSpeechOpenInMemory(self.handle, FORMAT)
		dectalk.TextToSpeechAddBuffer(self.handle, byref(self.mem_buffer))
		self.player = WavePlayer(1, 11025, 16, outputDevice=config.conf["speech"]["outputDevice"])
		self.audioQueue = SimpleQueue()  # For audio and indexes.
		self.audio_thread = BgThread(self.audioQueue)
		self.audio_thread.start()

	def setup_wndproc(self):
		@WNDPROC
		def nvdaDtSoftWndProc(hwnd, msg, wParam, lParam):
			if msg == self.wmIndex:
				self._onIndexReached(lParam)
			elif msg == self.wmBuffer:
				lpBuffer = cast(lParam, POINTER(TTS_BUFFER_T))
				self.handle_buffer(lpBuffer)
			return windll.user32.DefWindowProcW(hwnd, msg, wParam, lParam)

		self.nvdaDtSoftWndCls.lpfnWndProc = nvdaDtSoftWndProc

	def handle_buffer(self, lpBuffer):
		lastmark = None
		indexes = None
		end = False
		data = string_at(lpBuffer.contents.lpData, lpBuffer.contents.dwBufferLength)
		self.audioData.write(data)
		if lpBuffer.contents.dwBufferLength == 0:
			end = True
		lpBuffer.contents.dwBufferLength = 0
		if lpBuffer.contents.dwNumberOfIndexMarks:
			indexes = lpBuffer.contents.lpIndexArray.contents
			marks = lpBuffer.contents.dwNumberOfIndexMarks
			if indexes[marks - 1].dwIndexValue == 32000:
				end = True
				if marks > 1:
					lastmark = indexes[marks - 2].dwIndexValue
				else:
					lastmark = 32000
			else:  # Index below 32K.
				lastmark = indexes[marks - 1].dwIndexValue
		if self.audioData.tell() >= SAMPLES or end:
			_bgExec(self.audioQueue, self.player.feed, self.audioData.getvalue())
			self.audioData.seek(0)
			self.audioData.truncate()
		if lastmark is not None and lastmark != 32000:
			_bgExec(self.audioQueue, self._onIndexReached, lastmark)
		if end:
			_bgExec(self.audioQueue, self._onDoneSpeaking)
		dectalk.TextToSpeechAddBuffer(self.handle, lpBuffer)

	def speak(self, speechSequence):
		textList = [
			"[:skip none",  # Kills some abbrevs.
			":mode spell off",
			":punctuation some",  # NVDA will handle punctuation.
			f":dv ap {self.dt_pitch}",
			f":dv pr {self.dt_inflection}]",
		]
		for item in speechSequence:
			if isinstance(item, str):
				# Prevent control strings from going into our text from input.
#				item = item.replace("[:", " ")
				textList.append(item)
			elif isinstance(item, IndexCommand):
				textList.append(f"[:index mark {item.index}]")
			elif isinstance(item, CharacterModeCommand):
				textList.append(f"[:mode spell {'on' if item.state else 'off'}]")
			elif isinstance(item, PitchCommand):
				try:
					multiplier = item.multiplier
				except ZeroDivisionError:
					multiplier = (self.maxPitch - self.minPitch) // 30
				if multiplier == 1:
					# Returning to normal.
					textList.append(f"[:dv ap {self.dt_pitch}]")
				else:
					percent = self._paramToPercent(self.dt_pitch, self.minPitch, self.maxPitch) or 3
					value = (
						self._percentToParam(percent * multiplier, self.minPitch, self.maxPitch)
						% self.maxPitch
					)
					textList.append(f"[:dv ap {value}]")
			elif isinstance(item, SpeechCommand):
				log.debugWarning("Unsupported speech command: %s" % item)
			else:
				log.error("Unknown speech: %s" % item)
		textList.append("[:index reply 32000]")
		dectalk.TextToSpeechSpeak(self.handle, " ".join(textList).encode("iso8859-1", "ignore"), 1)

	def cancel(self):
		# TextToSpeechReset CAN SOMETIMES cause an NVDA core freeze.
		# dectalk.TextToSpeechReset(self.handle, 0)
		clear_queue(self.audioQueue)
		self.audioData.seek(0)
		self.audioData.truncate()
		self.player.stop()

	def terminate(self):
		self.cancel()
		dectalk.TextToSpeechShutdown(self.handle)
		windll.user32.DestroyWindow(self._messageWindow)
		windll.user32.UnregisterClassW(self._messageWindowClassAtom, self.appInstance)
		self.audioData.seek(0)
		self.audioData.truncate()
		self.audioQueue.put((None, None, None))

	def pause(self, switch):
		self.player.pause(switch)

	def _get_inflection(self):
		return self._paramToPercent(self.dt_inflection, self.minInflection, self.maxInflection)

	def _set_inflection(self, inflection):
		val = self._percentToParam(inflection, self.minInflection, self.maxInflection)
		self.dt_inflection = val

	def _get_pitch(self):
		return self._paramToPercent(self.dt_pitch, self.minPitch, self.maxPitch)

	def _set_pitch(self, pitch):
		val = self._percentToParam(pitch, self.minPitch, self.maxPitch)
		self.dt_pitch = val

	def _get_rate(self):
		return self._paramToPercent(self.dt_rate, self.minRate, self.maxRate)

	def _set_rate(self, rate):
		val = self._percentToParam(rate, self.minRate, self.maxRate)
		self.dt_rate = val
		dectalk.TextToSpeechSpeak(self.handle, b"[:rate %d]" % val, 1)

	def _get_voice(self):
		return self._voice

	def _set_voice(self, val):
		self.dt_pitch = self._voices[val]["pitch"]
		self.dt_inflection = self._voices[val]["inflection"]
		self._voice = val
		dectalk.TextToSpeechSpeak(self.handle, f"[:name {val[0].lower()}]".encode("latin-1"), 1)

	def _get_availableVoices(self):
		voices = OrderedDict()
		for i, voice in self._voices.items():
			voices[i] = synthDriverHandler.VoiceInfo(i, voice["name"])
		return voices

	def _onIndexReached(self, index):
		synthDriverHandler.synthIndexReached.notify(synth=self, index=index)

	def _onDoneSpeaking(self):
		synthDriverHandler.synthDoneSpeaking.notify(synth=self)
