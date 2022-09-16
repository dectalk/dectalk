;;; $Id: emacspeak-speak.el,v 3.141 1995/09/14 17:08:04 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Contains the functions for speaking various chunks of text
;;; Keywords: Emacspeak, Speak, Spoken Output
;;{{{  LCD Archive entry: 
;;; LCD Archive Entry:
;;; emacspeak| T. V. Raman |raman@crl.dec.com 
;;; A speech interface to Emacs |
;;; $date: $ |
;;;  $Revision: 12$ | 
;;; Location undetermined
;;;

;;}}}
;;{{{  Copyright:

;;; Copyright (c) 1994, 1995 by Digital Equipment Corporation.
;;; All Rights Reserved. 
;;;
;;; This file is not part of GNU Emacs, but the same permissions apply.
;;;
;;; GNU Emacs is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; GNU Emacs is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Emacs; see the file COPYING.  If not, write to
;;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;}}}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)
(require 'dtk-speak)
(eval-when (compile) (require 'voice-lock)
           (require 'emacspeak-sounds))
;;{{{  Introduction:
;;; This module defines the core output functions used by emacspeak.
;;; It depends on the dtk-speak module.
;;; It protects other parts of emacspeak
;;; from becoming dependent on the dtk module.

;;}}}
;;{{{  line, Word and Character echo 

(defvar emacspeak-line-echo nil 
  "If t, then emacspeak echoes lines as you type.
Do not set this variable by hand;
Use \\[emacspeak-toggle-line-echo]")

(defun emacspeak-toggle-line-echo (&optional prefix)
  "Toggle state of  Emacspeak  line echo. 
Interactive prefix arg means toggle  the global default value, and then set the
current local  value to the result. "
  (interactive  "P")
  (declare  (special  emacspeak-line-echo ))
  (cond
   (prefix
    (setq-default  emacspeak-line-echo
                   (not  (default-value 'emacspeak-line-echo )))
    (setq emacspeak-line-echo (default-value 'emacspeak-line-echo )))
   (t (make-local-variable 'emacspeak-line-echo)
      (setq emacspeak-line-echo 
	    (not emacspeak-line-echo ))))
  (message "Turned %s line echo%s. "
           (if emacspeak-line-echo "on" "off" )
	   (if prefix "" " locally")))

(defvar emacspeak-word-echo t
  "If t, then emacspeak echoes words as you type.
Do not set this variable by hand;
Use \\[emacspeak-toggle-word-echo]")

(defun emacspeak-toggle-word-echo (&optional prefix)
  "Toggle state of  Emacspeak  word echo. 
Interactive prefix arg means toggle  the global default value, and then set the
current local  value to the result. "
  (interactive  "P")
  (declare  (special  emacspeak-word-echo ))
  (cond
   (prefix
    (setq-default  emacspeak-word-echo
                   (not  (default-value 'emacspeak-word-echo )))
    (setq emacspeak-word-echo (default-value 'emacspeak-word-echo )))
   (t (make-local-variable 'emacspeak-word-echo )
      (setq emacspeak-word-echo 
	    (not emacspeak-word-echo ))))
  (message "Turned %s word echo%s. "
           (if emacspeak-word-echo "on" "off" )
	   (if prefix "" " locally")))

(defvar emacspeak-character-echo t
  "If t, then emacspeak echoes characters  as you type.
Do not set this variable by hand;
Use \\[emacspeak-toggle-character-echo]")

(defun emacspeak-toggle-character-echo (&optional prefix)
  "Toggle state of  Emacspeak  character echo. 
Interactive prefix arg means toggle  the global default value, and then set the
current local  value to the result. "
  (interactive  "P")
  (declare  (special  emacspeak-character-echo ))
  (cond
   (prefix
    (setq-default  emacspeak-character-echo
                   (not  (default-value 'emacspeak-character-echo )))
    (setq emacspeak-character-echo (default-value 'emacspeak-character-echo )))
   (t (make-local-variable 'emacspeak-character-echo)
      (setq emacspeak-character-echo 
	    (not emacspeak-character-echo ))))
  (message "Turned %s character echo%s. "
           (if emacspeak-character-echo "on" "off" )
	   (if prefix "" " locally")))

;;}}}
;;{{{  indentation:

(defvar emacspeak-audio-indentation nil
  "If non-nil , then speaking a line indicates its indentation.
 Do not set this by hand, use command
emacspeak-toggle-audio-indentation bound to
\\[emacspeak-toggle-audio-indentation]. ")

;;; Indicate indentation.
 ;;; Argument indent   indicates number of columns to indent. 
(defsubst emacspeak-indent (indent)
  (when (> indent 1 )
    (let ((duration (+ 50 (* 20  indent ))))
      (dtk-tone  250 duration)
      (dtk-force))))
    

(defvar emacspeak-audio-indentation-methods
  '(("speak" . "speak")
    ("tone" . "tone"))
  "Possible methods of indicating indentation. ")


(defun emacspeak-toggle-audio-indentation (&optional prefix)
  "Toggle state of  Emacspeak  audio indentation.
Interactive prefix arg means toggle  the global default value, and then set the
current local  value to the result.
 Specifying the method of indentation as `tones'
results in the Dectalk producing a tone whose length is a function of the
line's indentation. Specifying `speak'
results in the number of initial spaces being spoken."
  (interactive  "P")
  (declare  (special  emacspeak-audio-indentation
                      emacspeak-audio-indentation-methods ))
  (cond
   (prefix
    (setq-default  emacspeak-audio-indentation
                   (not  (default-value 'emacspeak-audio-indentation )))
    (setq emacspeak-audio-indentation (default-value 'emacspeak-audio-indentation )))
   (t (make-local-variable'emacspeak-audio-indentation)
      (setq emacspeak-audio-indentation 
	    (not emacspeak-audio-indentation ))))
  (when emacspeak-audio-indentation
    (setq emacspeak-audio-indentation
          (completing-read  "What kind of audio indentation would you like? "
                            emacspeak-audio-indentation-methods  nil t
                            "speak" ))
    (and prefix
         (setq-default emacspeak-audio-indentation
                       emacspeak-audio-indentation )))
  (message "Turned %s audio indentation %s "
           (if emacspeak-audio-indentation "on" "off" )
	   (if prefix "" "locally")))

;;}}}
;;{{{  sync emacspeak and dtk:

(defsubst   emacspeak-dtk-sync ()
  "Bring emacspeak and dtk in sync. "
  (declare (special dtk-speaker-process
                    dtk-punctuation-mode dtk-speech-rate dtk-character-scale
                    dtk-capitalize dtk-split-caps ))
  (let ((command (concat 
                  (format "dectalk_set_punctuations %s  \n "
                          dtk-punctuation-mode )
                  (format "dectalk_capitalize %s \n "
                          (if dtk-capitalize 1  0 ))
                  (format "dectalk_split_caps  %s \n "
                          (if dtk-split-caps 1 0 ))
                  (format "dectalk_set_speech_rate %s \n" dtk-speech-rate)
                  (format "dectalk_set_character_scale %s \n "
                          dtk-character-scale)
                  )))
    (process-send-string dtk-speaker-process command )
    command
    )
  )

;;}}}
;;{{{ functions: 

(defsubst emacspeak-speak-region (start end )
  "Speak region. "
  (interactive "r" )
  (dtk-speak (buffer-substring start end )))

(defun emacspeak-speak-line (&optional arg)
  "Speak current line.
  With prefix arg, speaks the rest of the line  from point.
Negative prefix optional arg speaks from start of line  to point.
Voicifies if voice-lock-mode is on.
 Indicates indentation with a tone if audio indentation is in use. "
  (interactive "P")
  (declare (special voice-lock-mode
                    emacspeak-audio-indentation))
  (when (listp arg) (setq arg (car arg )))
  (save-excursion 
    (let ((start  nil)
          (end nil )
          (orig (point)) 
          (indent nil)
          (dtk-stop-immediately t)
          (fold nil))
      (beginning-of-line)
      (setq start (point))
      (when (and emacspeak-audio-indentation
                 (null arg ))
        (save-excursion
          (back-to-indentation )
          (setq indent  (current-column ))
          (and (> indent 1)
               (string= "tone" emacspeak-audio-indentation)
               (setq dtk-stop-immediately nil))))
      (end-of-line)
      (setq end (point))
      (goto-char orig) 
      (cond
       ((null arg))
       ((> arg 0) (setq start orig))
       (t (setq end orig)))
                                        ;Necessary to avoid speaking hidden text when in outline modes
      (unless(and arg  (< arg 0) )
        (save-match-data
          (setq fold(search-forward (char-to-string 13)
                                    (+ (point) 80) t)))
        (setq end (if (and fold  (< fold  end))
                      fold 
                    end)))
      (when (and emacspeak-audio-indentation
                 (string= emacspeak-audio-indentation "tone")
                 (null arg ))
        (emacspeak-indent indent ))
      (cond
       ((string= ""  (buffer-substring start end))
        (if dtk-stop-immediately (dtk-stop))
        (dtk-tone 350))
       (t
        (if (and (string= "speak" emacspeak-audio-indentation )
                 indent 
                 (> indent 0))
            (progn 
              (setq indent (format "indent %d" indent))
              (put-text-property   0 (length indent)
                                   'personality 'indent-voice  indent )
              (dtk-speak 
               (concat
                indent (buffer-substring start end ))))
          (dtk-speak (buffer-substring  start end ))))))))

(defun emacspeak-speak-word (&optional arg) 
  "Speak current word.
  With prefix arg, speaks the rest of the word from point.
Negative prefix arg speaks from start of word to point."
  (interactive "P")
  (declare (special voice-lock-mode))
  (when (listp arg) (setq arg (car arg )))
  (cond
   ((looking-at  "[ \t\r]+" ) (dtk-say " space "))
   (t (save-excursion
        (let ((orig (point))
              (start nil)
              (end nil))
          (forward-word 1)
          (setq end (point))
          (backward-word 1)
          (setq start (point))
          (cond
           ((null arg ))
           ((> arg 0) (setq start orig))
           ((< arg 0) (setq end orig )))
          (if   (and (boundp 'voice-lock-mode)
                     voice-lock-mode
                     (get-text-property start 'personality))
              (dtk-with-voice  (get-text-property start 'personality)
                               (dtk-say  (buffer-substring  start end )))
            (dtk-say  (buffer-substring  start end ))))))))

(defsubst emacspeak-is-alpha-p (c) (= 119 (char-syntax c)))

;;{{{  phonemic table

(defvar emacspeak-char-to-phonetic-table
  '(("a" . "alpha" )
    ("b" . "bravo")
    ("c" .  "charlie")
    ("d" . "delta")
    ("e" . "echo")
    ("f" . "foxtrot")
    ("g" . "golf")
    ("h" . "hotel")
    ("i" . "india")
    ("j" . "juliet")
    ("k" . "kilo")
    ("l" . "lima")
    ("m" . "mike")
    ("n" . "november")
    ("o" . "oscar")
    ("p" . "poppa")
    ("q" . "quebec")
    ("r" . "romeo")
    ("s" . "sierra")
    ("t" . "tango")
    ("u" . "unicorn")
    ("v" . "victor")
    ("w" . "whisky")
    ("x" . "xray")
    ("y" . "yankee")
    ("z" . "zulu")
    ("A" . "cap alpha" )
    ("B" . "cap bravo")
    ("C" .  "cap charlie")
    ("D" . "cap delta")
    ("E" . "cap echo")
    ("F" . "cap foxtrot")
    ("G" . "cap golf")
    ("H" . "cap hotel")
    ("I" . "cap india")
    ("J" . "cap juliet")
    ("K" . "cap kilo")
    ("L" . "cap lima")
    ("M" . "cap mike")
    ("N" . "cap november")
    ("O" . "cap oscar")
    ("P" . "cap poppa")
    ("Q" . "cap quebec")
    ("R" . "cap romeo")
    ("S" . "cap sierra")
    ("T" . "cap tango")
    ("U" . "cap unicorn")
    ("V" . "cap victor")
    ("W" . "cap whisky")
    ("X" . "cap xray")
    ("Y" . "cap yankee")
    ("Z" . "cap zulu"))
  "Association list holding the mapping from characters to their phonemic
equivalents. ")


(defun emacspeak-get-phonetic-string (char)
  "Extract and return the phonetic string for this char or its upper case
equivalent.
char is assumed to be one of a--z. "
  (declare (special emacspeak-char-to-phonetic-table))
  (let ((char-string   (char-to-string char )))
    (or   (cdr
           (assoc char-string emacspeak-char-to-phonetic-table ))
          " ")))

;;}}}
(defun emacspeak-speak-char (&optional prefix)
  "Speak char under point
Pronounces character phonetically unless  called with a prefix arg."
  (interactive "P")
  (let ((dtk-stop-immediately t )
        (char  (following-char )))
    (when char
      (cond
       ((and (not prefix)
             (emacspeak-is-alpha-p char))
        (dtk-speak (emacspeak-get-phonetic-string char )))
       ((emacspeak-is-alpha-p char) (dtk-letter (char-to-string char )))
       (t (dtk-dispatch
           (dtk-char-to-speech char )))))))

(defun emacspeak-speak-this-char (char)
  "Speak this char. "
  (let ((dtk-stop-immediately t ))
    (when char
      (cond
       ((emacspeak-is-alpha-p char) (dtk-letter (char-to-string char )))
       (t (dtk-dispatch
           (dtk-char-to-speech char )))))))

(defun emacspeak-speak-buffer (&optional arg) 
  "Speak current buffer  contents.
 With prefix arg, speaks the rest of the buffer from point.
Negative prefix arg speaks from start of buffer to point. "
  (interactive "P" )
  (when (listp arg) (setq arg (car arg )))
  (let ((start nil )
        (end nil))
    (cond
     ((null arg)
      (setq start (point-min)
            end (point-max)))
     ((> arg 0)
      (setq start (point)
            end (point-max)))
     (t (setq start (point-min)
              end (point))))
    (dtk-speak (buffer-substring start end ))))

(defun emacspeak-speak-help(&optional arg)
  "Speak help buffer if one present.
With prefix arg, speaks the rest of the buffer from point.
Negative prefix arg speaks from start of buffer to point."
  (interactive "P")
  (let ((help-buffer (get-buffer "*Help*")))
    (cond
     (help-buffer
      (save-excursion
	(set-buffer help-buffer)
	(emacspeak-speak-buffer arg )))
     (t (dtk-speak "First ask for help" )))))

(defun emacspeak-speak-completions()
  "Speak completions  buffer if one present."
  (interactive )
  (let ((completions-buffer (get-buffer "*Completions*"))
        (start nil)
        (end nil )
        (continue t)
        (dtk-stop-immediately nil))
    (cond
     ((and completions-buffer
           (window-live-p (get-buffer-window completions-buffer )))
      (save-window-excursion
        (save-match-data 
          (select-window  (get-buffer-window completions-buffer ))
          (goto-char (point-min))
          (forward-line 3)
          (while continue
            (setq start (point) 
                  end (or  (re-search-forward "\\( +\\)\\|\n"  (point-max) t)
                           (point-max )))
            (dtk-speak (buffer-substring start end ) t) ;wait 
            (setq continue  (sit-for 1))
            (if (eobp) (setq continue nil )))) ;end while
        (discard-input)
        (goto-char start )
        (choose-completion )))
     (t (dtk-speak "No completions" )))))

(defun emacspeak-speak-minibuffer(&optional arg) 
  "Speak the minibuffer contents
 With prefix arg, speaks the rest of the buffer from point.
Negative prefix arg speaks from start of buffer to point."
  (interactive "P" )
  (let ((minibuff (window-buffer (minibuffer-window ))))
    (save-excursion
      (set-buffer minibuff)
      (emacspeak-speak-buffer arg))))

(defun emacspeak-speak-sentence (&optional arg)
  "Speak current sentence.
 With prefix arg, speaks the rest of the sentence  from point.
Negative prefix arg speaks from start of sentence to point."
  (interactive "P" )
  (when (listp arg) (setq arg (car arg )))
  (save-excursion 
    (let ((orig (point))
          (start nil)
          (end nil))
      (forward-sentence 1) 
      (setq end (point))
      (backward-sentence 1)
      (setq start (point))
      (cond
       ((null arg ))
       ((> arg 0) (setq start orig))
       ((< arg 0) (setq end orig )))
      (dtk-speak (buffer-substring start end )))))


(defun emacspeak-speak-sexp (&optional arg)
  "Speak current sexp.
 With prefix arg, speaks the rest of the sexp  from point.
Negative prefix arg speaks from start of sexp to point.
If voice-lock-mode is on, then uses the personality. "
  (interactive "P" )
  (when (listp arg) (setq arg (car arg )))
  (save-excursion 
    (let ((orig (point))
          (start nil)
          (end nil))
      (condition-case nil
          (forward-sexp 1)
        (error nil ))
      (setq end (point))
      (condition-case nil 
          (backward-sexp 1)
        (error nil ))
      (setq start (point))
      (cond
       ((null arg ))
       ((> arg 0) (setq start orig))
       ((< arg 0) (setq end orig )))
      (dtk-speak (buffer-substring  start end )))))

(defun emacspeak-speak-paragraph(&optional arg)
  "Speak paragraph.
With prefix arg, speaks rest of current paragraph.
Negative prefix arg will read from start of current paragraph to point.
If voice-lock-mode is on, then it will use any defined personality. "
  (interactive "P")
  (when (listp arg) (setq arg (car arg )))
  (save-excursion 
    (let ((orig (point))
          (start nil)
          (end nil))
      (forward-paragraph 1) 
      (setq end (point))
      (backward-paragraph 1)
      (setq start (point))
      (cond
       ((null arg ))
       ((> arg 0) (setq start orig))
       ((< arg 0) (setq end orig )))
      (dtk-speak (buffer-substring  start end )))))

(defun emacspeak-speak-mode-line ()
  "Speak the mode-line. "
  (interactive)
  (declare (special  mode-name major-mode))
  (emacspeak-dtk-sync)
  (force-mode-line-update)
  (let ((dtk-stop-immediately nil )) 
    (when (buffer-modified-p )
      (dtk-tone 700 70) )
    (when buffer-read-only
      (dtk-tone 250 50))
    (dtk-speak
     (format  "%s  %s"
              (if  (buffer-file-name ) 
                  (file-name-nondirectory  (buffer-file-name ))
                (buffer-name ))
              (if  major-mode major-mode "")
              )))
  )
(defun emacspeak-speak-minor-mode-line ()
  "Speak the minor mode-information. "
  (interactive)
  (declare (special minor-mode-alist))
  (force-mode-line-update)
  (let ((dtk-stop-immediately nil ))
    (dtk-speak
     (format "Active minor modes:  %s" 
             (mapconcat
              (function (lambda(item)
                          (let ((var (car item))
                                (value (cadr item )))
                            (cond
                             ((and (boundp var) (eval var ))
                              (if (symbolp value)
                                  (eval value)
                                value))
                             (t "")))))
              minor-mode-alist " ")))
    )
  )
  


;;; Functions to browse without moving:
(defun emacspeak-read-line-internal(arg)
  "Read a line without moving.
Line to read is specified relative to the current line, prefix args gives the
offset. Default  is to speak the previous line. "
  (save-excursion
    (cond
     ((zerop arg) (emacspeak-speak-line ))
     ((zerop (forward-line arg))
      (emacspeak-speak-line ))
     (t (dtk-speak "Not that many lines in buffer. ")))))

(defun emacspeak-read-previous-line(&optional arg)
  "Read previous line, specified by an offset, without moving.
Default is to read the previous line. "
  (interactive "p")
  (emacspeak-read-line-internal (- (or arg 1 ))))

(defun emacspeak-read-next-line(&optional arg)
  "Read next line, specified by an offset, without moving.
Default is to read the next line. "
  (interactive "p")
  (emacspeak-read-line-internal (or arg 1 )))
  
(defun emacspeak-read-word-internal(arg)
  "Read a word without moving.
word  to read is specified relative to the current word, prefix args gives the
offset. Default  is to speak the previous word. "
  (save-excursion
    (cond
     ((= arg 0) (emacspeak-speak-word ))
     ((forward-word arg)
      (skip-syntax-forward " ")
      (emacspeak-speak-word 1 ))
     (t (dtk-speak "Not that many words. ")))))

(defun emacspeak-read-previous-word(&optional arg)
  "Read previous word, specified as a prefix arg, without moving.
Default is to read the previous word. "
  (interactive "p")
  (emacspeak-read-word-internal (- (or arg 1 ))))

(defun emacspeak-read-next-word(&optional arg)
  "Read next word, specified as a numeric  arg, without moving.
Default is to read the next word. "
  (interactive "p")
  (emacspeak-read-word-internal  (or arg 1 )))


(defun emacspeak-zap-dtk () 
  "Send this command to the Dectalk directly. "
  (interactive) 
  (dtk-dispatch 
   (read-from-minibuffer"Enter Dectalk command string: ")))

(defun emacspeak-speak-time ()
  "Speak the time. "
  (interactive)
  (dtk-speak (current-time-string )))

(defun emacspeak-speak-version ()
  "Announce version information for running emacspeak. "
  (interactive)
  (declare (special emacspeak-version))
  (dtk-speak
   (format "You are using emacspeak %s. "
           emacspeak-version )))
(defun emacspeak-speak-page (&optional arg)
  "Speak a page. 
  With prefix arg, speaks rest of current page. 
Negative prefix arg will read from start of current page to point.
If voice-lock-mode is on, then it will use any defined personality. "
  (interactive "P")
  (when (listp arg) (setq arg (car arg )))
  (save-excursion 
    (let ((orig (point))
          (start nil)
          (end nil))
      (mark-page)
      (setq start  (point))
      (setq end  (mark))
      (cond
       ((null arg ))
       ((> arg 0) (setq start orig))
       ((< arg 0) (setq end orig )))
      (dtk-speak (buffer-substring start end )))))

  
      
(defun emacspeak-execute-repeatedly (command)
  "Execute command repeatedly. "
  (interactive "CCommand to execute repeatedly:")
  (let ((key "")
        (position (point ))
        (continue t )
        (message (format "Press any key to execute %s again" command)))
    (while continue
      (call-interactively command )
      (cond
       ((= (point) position ) (setq continue nil))
       (t (setq position (point))
          (setq key
                (let ((dtk-stop-immediately nil ))
                  (sit-for 2)
                  (read-key-sequence message )))
          (when   (=  7  (string-to-char key ))
            (dtk-stop)
            (setq continue nil )))))
    (dtk-speak "Exited continuous mode. ")))

(defun emacspeak-speak-continuously ()
  "Speak a buffer continuously.
First prompts using the minibuffer for the kind of action to perform after
speaking each chunk.
E.G. speak a line at a time etc.
Speaking commences at current buffer position.
Pressing  C-g breaks out, leaving point on last chunk that was spoken.
 Any other key continues to speak the buffer. "
  (interactive)
  (let ((command (key-binding
                  (read-key-sequence "Press key sequence to repeat: "))))
    (unless command
      (error "You specified an invalid key sequence. " ))
    (emacspeak-execute-repeatedly command)))


(defun emacspeak-learn-mode ()
  "Helps you learn the keys. You can press keys and hear what they do.
To leave, press \\[keyboard-quit]. "
  (interactive)
  (let ((continue t )) 
    (while continue 
      (call-interactively 'describe-key-briefly)
      (if (= last-input-event 7) 
          (setq continue nil )))
      (message "Leaving learn mode. ")))


(defun emacspeak-speak-current-kill (count)
  "Speak the current kill entry.
This is the text that will be yanked in by the next \\[yank].
Prefix numeric arg, count, specifies that the text that will be yanked as a
result of a
\\[yank]  followed by count-1 \\[yank-pop]
be spoken. "
  (interactive "p")
  (dtk-speak
   (current-kill (if current-prefix-arg count 0)t))
  )

;;}}}

;;{{{  Moving across fields:

;;; For the present, we define a field
;;; as a contiguous series of non-blank characters
;;; helper function: speak a field
(defsubst  emacspeak-speak-field (start end )
  (let ((header (or (get-text-property start  'field-name) "")))
  (dtk-speak
       (concat
             (progn (put-text-property 0 (length header )
                                       'personality 'annotation-voice
                                       header )
                    header )
        " "
        (buffer-substring  start end)))))


(defun emacspeak-speak-current-field ()
  "Speak current field.  A field is
  defined currently as a sequence of non-white space characters.  may be made
  mode specific later. "
  (interactive)
  (let ((start nil ))
    (save-excursion
      (skip-syntax-backward "^ ")
      (setq start (point ))
      (skip-syntax-forward "^ ")
      (emacspeak-speak-field start (point )))))

(defun emacspeak-speak-next-field ()
  "Skip across the next contiguous sequence of non-blank characters,
and speak it.
Useful in moving across fields.
Will be improved if it proves useful."
  (interactive)
  (let ((start nil ))
    (skip-syntax-forward "^ ")
    (skip-syntax-forward " ")
    (setq start (point ))
    (save-excursion
      (skip-syntax-forward "^ ")
      (emacspeak-speak-field start (point)))))

(defun emacspeak-speak-previous-field ()
  "Skip backwards across the next contiguous sequence of non-blank characters,
and speak it.
Useful in moving across fields.
Will be improved if it proves useful."
  (interactive)
  (let ((start nil ))
    (skip-syntax-backward " ")
    (setq start (point ))
    (skip-syntax-backward "^ ")
    (emacspeak-speak-field (point ) start)))

(defun emacspeak-speak-current-column ()
  "Speak the current column"
  (interactive)
  (message "Point at column %d" (current-column )))

(defun emacspeak-speak-current-percentage ()
  "Announce the percentage into the current buffer."
  (interactive)
  (let* ((pos (point))
	 (total (buffer-size))
	 (percent (if (> total 50000)
		      ;; Avoid overflow from multiplying by 100!
		      (/ (+ (/ total 200) (1- pos)) (max (/ total 100) 1))
		    (/ (+ (/ total 2) (* 100 (1- pos))) (max total 1)))))
    (message "Point is  %d%% into  the current buffer" percent )))

;;}}}
;;{{{  Speak the last message again:

(defun emacspeak-speak-message-again ()
  "Speak the last message from Emacs once again. "
  (interactive)
  (declare (special emacspeak-last-message ))
  (dtk-speak emacspeak-last-message ))

(defun emacspeak-announce (announcement)
  "Speak the announcement, if possible.
Otherwise just display a message. "
  (declare (special dtk-speaker-process ))
  (if (and (featurep 'dtk-speak)
           dtk-speaker-process 
           (eq 'run  (process-status dtk-speaker-process )))
      (dtk-speak announcement )
    (message announcement)))

;;}}}
;;{{{  Using emacs's windows usefully:

(defun emacspeak-speak-window-information ()
  "Speaks information about current windows."
  (interactive)
  (message "Current window has %s lines and %s columns"
           (window-height) (window-width)))

(defun emacspeak-speak-current-window ()
  "Speak contents of current window.
 Speaks entire window irrespective of point."
  (interactive)
    (emacspeak-speak-region (window-start) (window-end )))

(defun emacspeak-speak-other-window (&optional arg)
  "Speak contents of `other' window.
 Speaks entire window irrespective of point.
Semantics  of `other' is the same as for the builtin emacs command
`other-window'. "
  (interactive "nSpeak window")
  (save-window-excursion
    (other-window arg )
    (emacspeak-speak-region (window-start) (window-end ))))

(defun emacspeak-speak-next-window ()
  "Speak the next window"
  (interactive)
  (emacspeak-speak-other-window 1 ))

(defun emacspeak-speak-previous-window ()
  "Speak the previous window"
  (interactive)
  (emacspeak-speak-other-window -1 ))


(defun  emacspeak-owindow-scroll-up ()
  "Scroll up the window that command other-window would move to.
Speak the window contents after scrolling. "
  (interactive)
  (let ((error nil)
        (start
         (save-window-excursion
           (other-window 1)
           (window-start  ))))
    (condition-case nil
        (scroll-other-window  nil)
      (error (setq error t)))
    (if error
        (message "There is no other window. ")
      (save-window-excursion
          (other-window 1)
          (cond
           ((= start (window-start) )
            (message "At bottom of other window. "))
           (t (emacspeak-auditory-icon 'scroll)
              (emacspeak-speak-region (window-start ) (window-end ))))))))
          

(defun  emacspeak-owindow-scroll-down ()
  "Scroll down  the window that command other-window would move to.
Speak the window contents after scrolling. "
  (interactive)
  (let ((error nil)
        (start
         (save-window-excursion
           (other-window 1)
           (window-start )))
        (height (save-window-excursion
                  (other-window 1)
                  (window-height))))
    (condition-case nil
        (scroll-other-window  (- height ))
      (error (setq error t )))
      (if error
          (message "There is no other window. ")
        (save-window-excursion
          (other-window 1)
          (cond
           ((= start (window-start) )
            (message "At top of other window. "))
           (t (emacspeak-auditory-icon 'scroll)
              (emacspeak-speak-region (window-start) (window-end ))))))))

(defun emacspeak-owindow-next-line (count)
  "Move to the next line in the other window and speak it.
Numeric prefix arg can specify number of lines to move. "
  (interactive "p")
  (setq count (or count 1 ))
  (let  ((residue nil )
         (old-buffer (current-buffer )))
    (unwind-protect
        (progn 
          (set-buffer (window-buffer (next-window )))
          (end-of-line)
          (setq residue (forward-line count))
          (cond
           ((> residue 0) (message "At bottom of other window. "))
           (t (set-window-point (get-buffer-window (current-buffer ))
                                (point))
            (emacspeak-speak-line ))))
      (set-buffer old-buffer ))))

(defun emacspeak-owindow-previous-line (count)
  "Move to the next line in the other window and speak it.
Numeric prefix arg can specify number of lines to move. "
  (interactive "p")
  (setq count (or count 1 ))
  (let  ((residue nil )
         (old-buffer (current-buffer )))
    (unwind-protect
        (progn 
          (set-buffer (window-buffer (next-window )))
          (end-of-line)
          (setq residue (forward-line (- count)))
          (cond
           ((> 0 residue) (message "At top of other window. "))
           (t (set-window-point (get-buffer-window (current-buffer ))
                                (point))
            (emacspeak-speak-line ))))
      (set-buffer old-buffer ))))

(defun emacspeak-owindow-speak-line ()
  "Speak the current line in the other window.
"
  (interactive)
(let  ((old-buffer (current-buffer )))
    (unwind-protect
        (progn 
          (set-buffer (window-buffer (next-window )))
          (goto-char (window-point ))
          (emacspeak-speak-line))
      (set-buffer old-buffer ))))  

;;}}}
;;{{{  Intelligent interactive commands for reading:

;;; Prompt the user if asked to prompt.
;;; Prompt is:
;;; press 'b' for beginning of unit,
;;; 'r' for rest of unit,
;;; any other key for entire unit
;;; returns 1, -1, or nil accordingly.
;;; If prompt is nil, does not prompt: just gets the input

(defun emacspeak-ask-how-to-speak (unit-name prompt)
  (if prompt
      (message 
       (format "Press s to speak start of %s, r for rest of  %s. \
 Any  key for entire %s. "
               unit-name unit-name unit-name )))
  (let ((char (read-char )))
    (cond
     ((= char ?s) -1)
     ((= char ?r) 1)
     (t nil )))
  )

(defun emacspeak-speak-buffer-interactively ()
  "Speak the start of, rest of, or the entire buffer.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire buffer. "
  (interactive) 
  (emacspeak-speak-buffer
   (emacspeak-ask-how-to-speak "buffer" (sit-for 1 0 nil ))))



(defun emacspeak-speak-help-interactively ()
  "Speak the start of, rest of, or the entire help.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire help. "
  (interactive) 
  (emacspeak-speak-help
   (emacspeak-ask-how-to-speak "help" (sit-for 1 0 nil ))))


(defun emacspeak-speak-line-interactively ()
  "Speak the start of, rest of, or the entire line.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire line. "
  (interactive) 
  (emacspeak-speak-line
   (emacspeak-ask-how-to-speak "line" (sit-for 1 0 nil ))))

(defun emacspeak-speak-paragraph-interactively ()
  "Speak the start of, rest of, or the entire paragraph.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire paragraph. "
  (interactive) 
  (emacspeak-speak-paragraph
   (emacspeak-ask-how-to-speak "paragraph" (sit-for 1 0 nil ))))

(defun emacspeak-speak-page-interactively ()
  "Speak the start of, rest of, or the entire page.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire page. "
  (interactive) 
  (emacspeak-speak-page
   (emacspeak-ask-how-to-speak "page" (sit-for 1 0 nil ))))

(defun emacspeak-speak-word-interactively ()
  "Speak the start of, rest of, or the entire word.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire word. "
  (interactive) 
  (emacspeak-speak-word
   (emacspeak-ask-how-to-speak "word" (sit-for 1 0 nil ))))

(defun emacspeak-speak-sexp-interactively ()
  "Speak the start of, rest of, or the entire sexp.
's' to speak the start.
'r' to speak the rest.
any other key to speak entire sexp. "
  (interactive) 
  (emacspeak-speak-sexp
   (emacspeak-ask-how-to-speak "sexp" (sit-for 1 0 nil ))))

;;}}}
;;{{{  emacs' register related commands

;;; Things like view-register are useful.

(defun emacspeak-view-register ()
  "Display the contents of a register, and then speak it. "
  (interactive)
  (call-interactively 'view-register)
  (save-excursion (set-buffer "*Output*")
                  (dtk-speak (buffer-string ))))

;;}}}
;;{{{  emacs rectangles and regions: 

(eval-when (compile) (require 'rect))
;;; These help you listen to columns of text. Useful for tabulated data
(defun emacspeak-speak-rectangle ( start end )
  "Speak a rectangle of text.
Rectangle is delimited by point and mark.
When call from a program,
arguments specify the start and end of the rectangle."
  (interactive  "r")
  (require 'rect) 
  (dtk-speak-list (extract-rectangle start end )))
    

;;; helper function: emacspeak-put-personality
;;; sets property 'personality to personality 
(defsubst emacspeak-put-personality (start end personality )
  (put-text-property start end 'personality personality ))

;;; Compute table of possible voices to use in completing-read 
(defsubst  emacspeak-possible-voices ()
  (declare (special dtk-voice-table ))
  (mapcar
   (function (lambda (entry)
               (let ((entry-name
                      (format "%s"   (car entry ))))
                 (cons entry-name entry-name ))))
   dtk-voice-table ))


(defun emacspeak-voicify-rectangle (start end &optional personality )
  "Voicify the current rectangle.
Prompts for personality  with completion when called interactively.
 When calling from a program,arguments are
start end personality"
  (interactive "r")
  (require 'rect)
  (require 'voice-lock )
  (or voice-lock-mode (setq voice-lock-mode t ))
  (let ((personality-table (emacspeak-possible-voices )))
    (when (interactive-p) 
      (setq personality
            (read
             (completing-read "Use personality: "
                              personality-table nil t ))))
    (operate-on-rectangle
     (function (lambda ( start-seg begextra endextra )
                 (emacspeak-put-personality start-seg  (point) personality )))
     start end  nil)))

(defun emacspeak-voicify-region (start end &optional personality )
  "Voicify the current region.
Prompts for personality  with completion when called interactively.
 When calling from a program,arguments are
start end personality"
  (interactive "r")
  (require 'voice-lock )
  (or voice-lock-mode (setq voice-lock-mode t ))
  (let ((personality-table (emacspeak-possible-voices )))
    (when (interactive-p) 
      (setq personality
            (read
             (completing-read "Use personality: "
                              personality-table nil t ))))
    (put-text-property start end 'personality personality )))

(defun emacspeak-put-text-property-on-rectangle   (start end prop value )
  "Set property to value for each line in the rectangle."
  (require 'rect)
  (operate-on-rectangle
   (function (lambda ( start-seg begextra endextra )
               (put-text-property  start-seg (point)    prop value  )))
   start end  nil ))

;;}}}

;;{{{  Matching delimiters:

;;; A modified blink-matching-open that always displays the matching line
;;; in the minibuffer so emacspeak can speak it.

(defun emacspeak-blink-matching-open ()
  "Display matching delimiter in the minibuffer"
  (interactive)
  (declare (special blink-matching-paren-distance))
  (and (> (point) (1+ (point-min)))
       (not (memq (char-syntax (char-after (- (point) 2))) '(?/ ?\\ )))
       blink-matching-paren
       (let* ((oldpos (point))
              (emacspeak-blink-delay 5)
	      (blinkpos)
	      (mismatch))
	 (save-excursion
	   (save-restriction
	     (if blink-matching-paren-distance
		 (narrow-to-region (max (point-min)
					(- (point) blink-matching-paren-distance))
				   oldpos))
	     (condition-case ()
		 (setq blinkpos (scan-sexps oldpos -1))
	       (error nil)))
	   (and blinkpos (/= (char-syntax (char-after blinkpos))
			     ?\$)
		(setq mismatch
		      (/= (char-after (1- oldpos))
			  (matching-paren (char-after blinkpos)))))
	   (if mismatch (setq blinkpos nil))
	   (if blinkpos
	       (progn
                 (goto-char blinkpos)
                  (message   
                             "Matches %s"
                             ;; Show what precedes the open in its line, if anything.
                             (if (save-excursion
                                   (skip-chars-backward " \t")
                                   (not (bolp)))
                                 (buffer-substring (progn (beginning-of-line) (point))
                                                   (1+ blinkpos))
                               ;; Show what follows the open in its line, if anything.
                               (if (save-excursion
                                     (forward-char 1)
                                     (skip-chars-forward " \t")
                                     (not (eolp)))
                                   (buffer-substring blinkpos
                                                     (progn (end-of-line) (point)))
                                 ;; Otherwise show the previous nonblank line.
                                 (concat
                                  (buffer-substring (progn
                                                      (backward-char 1)
                                                      (skip-chars-backward "\n \t")
                                                      (beginning-of-line)
                                                      (point))
                                                    (progn (end-of-line)
                                                           (skip-chars-backward " \t")
                                                           (point)))
                                  ;; Replace the newline and other whitespace with `...'.
                                  "..."
                                  (buffer-substring blinkpos (1+
                                                              blinkpos)))))))
	     (cond (mismatch
		    (message "Mismatched parentheses"))
		   ((not blink-matching-paren-distance)
		    (message "Unmatched parenthesis")))))
       (sit-for emacspeak-blink-delay))))

(defun  emacspeak-use-customized-blink-paren ()
  "Ask Emacs to use a customized blink-paren function
that speaks the line containing the matching opening paren.
We need to call this in case Emacs
is anal and loads its own builtin blink-paren function
which does not talk. "
  (interactive)
  (fset 'blink-matching-open (symbol-function 'emacspeak-blink-matching-open))
  (and (interactive-p)
  (message "Using customized blink-paren function provided by Emacspeak.")))

(emacspeak-use-customized-blink-paren)

;;}}}

;;{{{  Auxillary functions:
(defsubst emacspeak-kill-buffer-carefully (buffer)
  "Kill buffer BUF if it exists."
  (and buffer
       (get-buffer buffer)
       (buffer-name (get-buffer buffer ))
       (kill-buffer buffer)))

(defsubst emacspeak-overlay-get-text (o)
(save-excursion
(set-buffer (overlay-buffer o ))
(buffer-substring
(overlay-start o)
(overlay-end o ))))


;;}}}

(provide 'emacspeak-speak )
;;{{{ end of file 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
