;;; $Id: dtk-macros.el,v 1.13 1995/06/23 01:52:54 raman Exp $
;;; $Author: leeber$ 
;;; Description: Macros used by dtk module.
;;; Keywords: dectalk.
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
(require 'backquote)
(require 'dtk-voices)

;;{{{  Introduction:

;;; This module defines the macro dtk-with-voice
;;; Usage: (dtk-with-voice voice &body)
;;; Executes body with voice set to voice.
;;; See module dtk-voices for the voice definitions.
;;; Voice locking is currently specific to the Dectalk. 

;;}}}
;;{{{  defmacro dtk-with-voice 

(defvar dtk-current-voice  'paul
  "Name of current voice. ")

(defmacro dtk-with-voice (voice &rest body)
  (`
   (progn
     (declare (special dtk-current-voice dtk-speaker-process ))
     (let ((dtk-saved-voice dtk-current-voice)
           (dtk-current-voice (or (, voice ) dtk-current-voice )))
       (unwind-protect
           (and (not (eq 'inaudible dtk-current-voice ))
                (progn 
                  (process-send-string
                   dtk-speaker-process
                   (format "queue_speech {%s}\n"
                           (dtk-get-voice-command dtk-current-voice )))
                  (,@ body)))
         (process-send-string
          dtk-speaker-process
          (format "dectalk_speak {%s} \n"
                  (dtk-get-voice-command dtk-saved-voice )))
         (setq dtk-current-voice dtk-saved-voice ))))))

;;}}}
;;{{{  dtk-with-speech-rate

(defmacro dtk-with-speech-rate (speech-rate &rest body)
  (`
   (progn
     (declare (special dtk-speech-rate dtk-speaker-process ))
     (let ((dtk-saved-speech-rate dtk-speech-rate)
           (dtk-speech-rate (or (, speech-rate ) dtk-speech-rate )))
       (unwind-protect
           (progn 
             (process-send-string
              dtk-speaker-process
              (format "dectalk_set_rate %s\n"
                      dtk-speech-rate ))
             (,@ body))
         (process-send-string
          dtk-speaker-process
          (format "dectalk_set_rate %s \n"
                  dtk-saved-speech-rate ))
         (setq dtk-speech-rate dtk-saved-speech-rate ))))))

;;}}}
;;{{{  dtk-with-punctuation-mode 

(defmacro dtk-with-punctuation-mode (punctuation-mode &rest body)
  (`
   (progn
     (declare (special dtk-punctuation-mode dtk-speaker-process ))
     (let ((dtk-saved-punctuation-mode dtk-punctuation-mode)
           (dtk-punctuation-mode
            (or (, punctuation-mode ) dtk-punctuation-mode )))
       (unwind-protect
           (progn 
             (process-send-string
              dtk-speaker-process
              (format "dectalk_set_punctuations %s\n"
                      dtk-punctuation-mode ))
             (,@ body))
         (process-send-string
          dtk-speaker-process
          (format "dectalk_set_punctuations %s \n"
                  dtk-saved-punctuation-mode ))
         (setq dtk-punctuation-mode dtk-saved-punctuation-mode ))))))

;;}}}

(provide 'dtk-macros)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
