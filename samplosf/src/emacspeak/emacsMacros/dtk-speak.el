;;; $Id: dtk-speak.el,v 3.38 1995/09/08 13:21:04 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacs interface to the dectalk
;;; Keywords: Dectalk Emacs Elisp
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
(require 'dtk-macros)
(require 'dtk-sh)
(eval-when (compile) (require 'emacspeak-keymap))

;;{{{  Introduction:

;;; This module defines the interface to the speech device.
;;; It relies on the module dtk-sh to communicate with the speech driver.
;;; The code in this module is Dectalk specific. 

;;}}}
;;{{{  user customizations: 

(defvar dtk-startup-hook nil
  "List of hooks to be run after starting up the Dectalk. .
Set things like speech rate, punctuation mode etc in this hook. ")

(defvar dtk-sh (or (getenv "DTK_SH" )
                    "dtk-mme")
  "Shell used to run the Dectalk driver.
dtk-mme for the software Dectalk. ")

(defvar dtk-program
  (or  (getenv "DTK_PROGRAM" ) "dtk-soft")
  "The program to use to talk to the Dectalk.
dtk-soft for the software Dectalk.
dtk-face for the DECface interface to Dectalk.
 The default is dtk-soft. ")

;;}}}
;;{{{  Internal variables:  

(defvar dtk-stop-immediately t
  "If t, speech stopped immediately when new speech received.
 Emacspeak sets this to nil if the current message being spoken is too
important to be interrupted.  ")

(defvar dtk-speaker-process nil "speaker process handle")

(defvar dtk-punctuation-mode  "some" 
  "Current setting of punctuation state.
 Possible values are some, all or none.
You should not modify this variable;
Use command  dtk-set-punctuations bound to \\[dtk-set-punctuations]. . ")

(defconst dtk-drivers-alist
  '(("dtk-face" . "dtk-face")
    ("dtk-soft" . "dtk-soft")
    )
  "Used by completing-read when prompting for the dtk driver to use. ")

(defconst dtk-driver-prefix "dtk-"
  "Used by completing-read when prompting for the driver name. ")

;;}}}
;;{{{  Mapping characters to speech:

(defvar dtk-character-to-speech-table
  (make-vector 128 "")
  "Holds the mapping of characters to the string that should be spoken for
pronouncing that character.")


(declaim (special dtk-character-to-speech-table ))
;;;  Assign entries in the table:
  (aset  dtk-character-to-speech-table 0 "control at")
  (aset  dtk-character-to-speech-table 1 "control a")
  (aset  dtk-character-to-speech-table 2 "control b")
  (aset  dtk-character-to-speech-table 3 "control c")
  (aset  dtk-character-to-speech-table 4 "control d")
  (aset  dtk-character-to-speech-table 5 "control e")
  (aset  dtk-character-to-speech-table 6 "control f")
  (aset  dtk-character-to-speech-table 7 "control g")
  (aset  dtk-character-to-speech-table 8 "control h")
  (aset  dtk-character-to-speech-table 9 "tab")
  (aset  dtk-character-to-speech-table 10 "newline")
  (aset  dtk-character-to-speech-table 11 "control k")
  (aset  dtk-character-to-speech-table 12 "control l")
  (aset  dtk-character-to-speech-table 13 "control m")
  (aset  dtk-character-to-speech-table 14 "control n")
  (aset  dtk-character-to-speech-table 15 "control o")
  (aset  dtk-character-to-speech-table 16 "control p")
  (aset  dtk-character-to-speech-table 17 "control q")
  (aset  dtk-character-to-speech-table 18 "control r")
  (aset  dtk-character-to-speech-table 19 "control s")
  (aset  dtk-character-to-speech-table 20 "control t")
  (aset  dtk-character-to-speech-table 21 "control u")
  (aset  dtk-character-to-speech-table 22 "control v")
  (aset  dtk-character-to-speech-table 23 "control w")
  (aset  dtk-character-to-speech-table 24 "control x")
  (aset  dtk-character-to-speech-table 25 "control y")
  (aset  dtk-character-to-speech-table 26 "control z")
  (aset  dtk-character-to-speech-table 27 "escape")
  (aset  dtk-character-to-speech-table 28 "control backslash")
  (aset  dtk-character-to-speech-table 29 "control right bracket")
  (aset  dtk-character-to-speech-table 30 "control caret" )
  (aset  dtk-character-to-speech-table 31 "control underscore")
  (aset  dtk-character-to-speech-table 32 "space")
  (aset  dtk-character-to-speech-table 33 "exclamation")
  (aset  dtk-character-to-speech-table 34 "quotes")
  (aset  dtk-character-to-speech-table 35 "number sign")
  (aset  dtk-character-to-speech-table 36 "dollar")
  (aset  dtk-character-to-speech-table 37 "percent" )
  (aset  dtk-character-to-speech-table 38 "ampersand")
  (aset  dtk-character-to-speech-table 39 "apostrophe" )
  (aset  dtk-character-to-speech-table 40 "left parenthesis" )
  (aset  dtk-character-to-speech-table 41 "right parenthesis" )
  (aset  dtk-character-to-speech-table 42 "asterisk")
  (aset  dtk-character-to-speech-table 43 "plus")
  (aset  dtk-character-to-speech-table 44 "comma")
  (aset  dtk-character-to-speech-table 45 "dash")
  (aset  dtk-character-to-speech-table 46 "dot")
  (aset  dtk-character-to-speech-table 47 "slash")
  (aset  dtk-character-to-speech-table 48 "zero")
  (aset  dtk-character-to-speech-table 49 "one")
  (aset  dtk-character-to-speech-table 50 "two")
  (aset  dtk-character-to-speech-table 51 "three")
  (aset  dtk-character-to-speech-table 52  "four")
  (aset  dtk-character-to-speech-table 53 "five")
  (aset  dtk-character-to-speech-table 54 "six")
  (aset  dtk-character-to-speech-table 55 "seven")
  (aset  dtk-character-to-speech-table 56 "eight")
  (aset  dtk-character-to-speech-table 57 "nine")
  (aset  dtk-character-to-speech-table 58 "colon" )
  (aset  dtk-character-to-speech-table 59 "semi colon")
  (aset  dtk-character-to-speech-table 60 "less than")
  (aset  dtk-character-to-speech-table 61 "equals")
  (aset  dtk-character-to-speech-table 62 "greater than")
  (aset  dtk-character-to-speech-table 63 "question mark")
  (aset  dtk-character-to-speech-table 64 "at")
  (aset  dtk-character-to-speech-table 65 "cap a")
  (aset  dtk-character-to-speech-table 66 "cap b")
  (aset  dtk-character-to-speech-table 67 "cap c")
  (aset  dtk-character-to-speech-table 68 "cap d")
  (aset  dtk-character-to-speech-table 69 "cap e")
  (aset  dtk-character-to-speech-table 70 "cap f")
  (aset  dtk-character-to-speech-table 71 "cap g")
  (aset  dtk-character-to-speech-table 72 "cap h")
  (aset  dtk-character-to-speech-table 73 "cap i")
  (aset  dtk-character-to-speech-table 74 "cap j")
  (aset  dtk-character-to-speech-table 75 "cap k")
  (aset  dtk-character-to-speech-table 76 "cap l")
  (aset  dtk-character-to-speech-table 77 "cap m")
  (aset  dtk-character-to-speech-table 78 "cap m")
  (aset  dtk-character-to-speech-table 79 "cap o")
  (aset  dtk-character-to-speech-table 80 "cap p")
  (aset  dtk-character-to-speech-table 81 "cap q")
  (aset  dtk-character-to-speech-table 82 "cap r")
  (aset  dtk-character-to-speech-table 83 "cap s")
  (aset  dtk-character-to-speech-table 84 "cap t")
  (aset  dtk-character-to-speech-table 85 "cap u")
  (aset  dtk-character-to-speech-table 86 "cap v")
  (aset  dtk-character-to-speech-table 87 "cap w")
  (aset  dtk-character-to-speech-table 88 "cap x")
  (aset  dtk-character-to-speech-table 89 "cap y")
  (aset  dtk-character-to-speech-table 90 "cap z")
  (aset  dtk-character-to-speech-table 91 "left bracket")
  (aset  dtk-character-to-speech-table 92 "backslash")
  (aset  dtk-character-to-speech-table 93 "right bracket")
  (aset  dtk-character-to-speech-table 94 "caret")
  (aset  dtk-character-to-speech-table 95 "underscore")
  (aset  dtk-character-to-speech-table 96 "backquote")
  (aset  dtk-character-to-speech-table 97 "a")
  (aset  dtk-character-to-speech-table 98 "b")
  (aset  dtk-character-to-speech-table 99 "c")
  (aset  dtk-character-to-speech-table 100 "d")
  (aset  dtk-character-to-speech-table 101 "e")
  (aset  dtk-character-to-speech-table 102 "f")
  (aset  dtk-character-to-speech-table 103 "g")
  (aset  dtk-character-to-speech-table 104 "h")
  (aset  dtk-character-to-speech-table 105 "i")
  (aset  dtk-character-to-speech-table 106 "j")
  (aset  dtk-character-to-speech-table 107 "k")
  (aset  dtk-character-to-speech-table 108 "l")
  (aset  dtk-character-to-speech-table 109 "m")
  (aset  dtk-character-to-speech-table 110 "n")
  (aset  dtk-character-to-speech-table 111 "o")
  (aset  dtk-character-to-speech-table 112 "p")
  (aset  dtk-character-to-speech-table 113 "q")
  (aset  dtk-character-to-speech-table 114 "r")
  (aset  dtk-character-to-speech-table 115 "s")
  (aset  dtk-character-to-speech-table 116 "t")
  (aset  dtk-character-to-speech-table 117 "u")
  (aset  dtk-character-to-speech-table 118 "v")
  (aset  dtk-character-to-speech-table 119 "w")
  (aset  dtk-character-to-speech-table 120 "x")
  (aset  dtk-character-to-speech-table 121 "y")
  (aset  dtk-character-to-speech-table 122 "z")
  (aset  dtk-character-to-speech-table 123 "left brace")
  (aset  dtk-character-to-speech-table 124 "pipe")
  (aset  dtk-character-to-speech-table 125 "right brace")
  (aset  dtk-character-to-speech-table 126 "tilde")
  (aset  dtk-character-to-speech-table 127 "backspace")


(defsubst dtk-char-to-speech (char)
  (declare (special dtk-character-to-speech-table char ))
  (aref dtk-character-to-speech-table char ))

;;}}}
;;{{{  interactively selecting the driver:

(defun dtk-select-driver ()
  "Select a dectalk driver interactively.
This will be the driver that is used when you next call either
\\[dtk-initialize] or \\[dtk-emergency-restart]. "
  (interactive)
  (declare (special  dtk-sh dtk-drivers-alist dtk-driver-prefix ))
  (setq dtk-program
        (completing-read "Select Dectalk driver:"
                         dtk-drivers-alist  nil
                         t dtk-driver-prefix ))
  (cond
   ((string= dtk-program "dtk-soft")
      (setq dtk-sh "dtk-mme"))
   ((string= dtk-program "dtk-face")
      (setq dtk-sh "DECface"))
    (t (setq dtk-sh "sh")))
  (message "Selected %s. Use %s to start using it. "
           dtk-program
           (substitute-command-keys "\\[dtk-emergency-restart]")))

;;}}}
;;{{{  initialize the speech process
(defvar dtk-debug nil
  "Set this to t if you want to debug the synthesizer driver. ")


(defun  dtk-initialize ()
  "Initialize speech system. "
  (declare (special dtk-program dtk-sh 
                    dtk-speaker-process  dtk-debug 
                    dtk-startup-hook))
    ;;; first load the appropriate interface library:
  (require 'dtk-sh)
  (when (and dtk-speaker-process
             (or (eq 'run (process-status dtk-speaker-process ))
                 (eq 'stop (process-status dtk-speaker-process ))))
    (kill-process dtk-speaker-process ))
  (setq dtk-speaker-process
        (start-process "speaker"
    	 (and dtk-debug " *speaker*")
    	 dtk-sh))
         ;; (concat emacspeak-dir "/" dtk-program  )))
  (unless dtk-debug 
  (set-process-filter dtk-speaker-process 'dtk-filter-function ))
  (run-hooks 'dtk-startup-hook ))

(defun dtk-emergency-restart ()
  "Use this to nuke the currently running dtk driver and restart it.
Useful for emergency stopping of speech.
You should have to use this only if all else fails.
Also useful if you power cycle  the Dectalk
 with an emacspeak session running. "
  (interactive)
  (dtk-initialize))


(defun dtk-toggle-debug (&optional flag )
  "Toggle state of the debug flag.
When debugging is on, you can switch to the buffer
*speaker* to examine the output from the process
that talks to the speech device.
Note: *speaker* is a hidden buffer, ie it has a leading space in its name."
  (interactive "P")
  (declare (special dtk-debug ))
  (cond
   (flag (setq dtk-debug t ))
   (t (setq dtk-debug (not dtk-debug ))))
  (message "Turned %s debugging of the synthesizer driver. %s"
           (if dtk-debug "on" "off")
           (if dtk-debug
               (substitute-command-keys
                "Restart the synthesizer driver  by pressing
\\[dtk-emergency-restart] to start debugging")
             (substitute-command-keys
              "Restart the synthesizer driver  by pressing
\\[dtk-emergency-restart] to stop  debugging"))))

;;}}}
(provide 'dtk-speak)

;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
