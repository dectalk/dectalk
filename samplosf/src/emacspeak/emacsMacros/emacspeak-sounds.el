;;; $Id: emacspeak-sounds.el,v 1.15 1995/09/02 18:43:23 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Module for adding sound cues to emacspeak
;;; Keywords:emacspeak, audio interface to emacs, auditory icons 
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
(require 'cl)
(eval-when (compile)
(require 'dtk-speak))
;;{{{  Introduction: 

;;; This module provides the interface for generating auditory icons in emacspeak.
;;; Design goal: 
;;; 1) Auditory icons should be used to provide additional feedback,
;;; not as a gimmick. 
;;; 2) The interface should be usable at all times without the icons:
;;; e.g. when on a machine without a sound card.
;;; 3) General principle for when to use an icon:
;;; Convey information about events taking place in parallel.
;;; For instance, if making a selection automatically moves the current focus 
;;; to the next choice, 
;;; We speak the next choice, while indicating the fact that something was selected with a sound cue.
;;;  This interface will assume the availability of a shell command "play" 
;;; that can take one or more sound files and play them. 
;;; A sample shell script that I use under Linux is provided here . 
;;; This module will also provide a mapping between names in the elisp world and actual sound files. 
;;; Modules that wish to use auditory icons should use these names, instead of actual file names. 

;;}}}
;;{{{  state of auditory icons 

(defvar emacspeak-use-auditory-icons nil 
"Tells if emacspeak should use auditory icons.
Do not set this variable by hand, 
use emacspeak-toggle-auditory-icons bound to  \\[emacspeak-toggle-auditory-icons].")

;;}}}
;;{{{  Map names to sounds 

(defvar emacspeak-sounds-table  nil
  "Association between symbols and names of sound files. 
When producing auditory icons, other modules should use names defined here. ")

(defvar emacspeak-default-sound nil 
"Default sound to play if requested icon not found. ")

(defun emacspeak-define-sound (sound-name file-name)
  "Define an auditory icon named sound-name.
file-name is the name of the sound file that produces this icon."
  (declare (special emacspeak-sounds-table ))
  (setq emacspeak-sounds-table
        (cons (list sound-name file-name )
              emacspeak-sounds-table )))

(defsubst emacspeak-get-sound-filename (sound-name)
  "Retrieve name of sound file that produces this auditory icon."
  (declare (special emacspeak-sounds-table
 emacspeak-default-sound))
  (or  (cadr  (assoc sound-name emacspeak-sounds-table ))
        emacspeak-default-sound))
(defun emacspeak-list-auditory-icons ()
  "Returns the  list of auditory icons that are currently defined."
  (declare (special emacspeak-sounds-table))
  (mapcar 'car emacspeak-sounds-table))

;;}}}
;;{{{  Names of auditory icons 

(emacspeak-define-sound 'close-object "click1.au")
(emacspeak-define-sound 'open-object "beep_17.au")
(emacspeak-define-sound 'delete-object "beep_5.au")
(emacspeak-define-sound 'save-object "multi_beep.au")
(emacspeak-define-sound 'mark-object "beep_8.au")
(emacspeak-define-sound 'fill-object "spring_beep.au")
(emacspeak-define-sound 'select-object "pure_saw_beep.au")
(emacspeak-define-sound 'button "button.au")
(emacspeak-define-sound 'deselect-object "robotic_beep.au")
(emacspeak-define-sound 'quit "goodbye.au")
(emacspeak-define-sound 'task-done "train.au")
(emacspeak-define-sound 'scroll "return.au")
(emacspeak-define-sound 'help "cowbell.au")
(emacspeak-define-sound   'ask-question "arcade_beep.au")
 (emacspeak-define-sound 'yes-answer "double_sine_beep.au")
(emacspeak-define-sound 'no-answer"casio_beep.au" )
(emacspeak-define-sound 'ask-short-question "kind_warning_beep.au")
(emacspeak-define-sound 'n-answer "jazz_piano_beep.au")
(emacspeak-define-sound 'y-answer  "clink.au")
(emacspeak-define-sound 'large-movement "better_boing.au")
(emacspeak-define-sound 'yank-object "drip.au")
(emacspeak-define-sound 'search-hit "fm_beep.au")
(emacspeak-define-sound 'search-miss "beep_13.au")
(emacspeak-define-sound 'warn-user "error.au")
(emacspeak-define-sound 'alarm "rooster.au")
(emacspeak-define-sound 'alert-user  "boing1.au")

;;}}}
;;{{{  Play an icon 

(defvar emacspeak-play-program
  (or (getenv "PLAY_PROGRAM")
(concat emacspeak-dir "/play"))
"Name of executable that plays sound files. ")

(defsubst emacspeak-auditory-icon (sound-name)
  "Produce auditory icon sound-name.
Sound is produced only if emacspeak-use-auditory-icons is true.
See command emacspeak-toggle-auditory-icons bound to \\[emacspeak-toggle-auditory-icons ]."
  (declare (special  emacspeak-use-auditory-icons
 emacspeak-play-program))
  (and emacspeak-use-auditory-icons
       (start-process 
"play" nil emacspeak-play-program 
                (emacspeak-get-sound-filename sound-name ))))

;;}}}
;;{{{  toggle auditory icons

;;; This is the main entry point to this module:
(defun emacspeak-toggle-auditory-icons ()
"Toggle use of auditory icons."
(interactive)
(declare (special emacspeak-use-auditory-icons))
(setq emacspeak-use-auditory-icons 
(not emacspeak-use-auditory-icons))
(message "Turned %s auditory icons"
(if emacspeak-use-auditory-icons  "on" "off" )))

;;}}}

;;{{{ Show all icons 

(defun emacspeak-play-all-icons ()
  "Plays all defined icons and speaks their names. "
  (interactive)
  (mapcar 
   '(lambda (f)
      (emacspeak-auditory-icon f)
      (dtk-speak (format "%s" f))
      (sleep-for 2))
   (emacspeak-list-auditory-icons)))

;;}}}



(provide  'emacspeak-sounds)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
