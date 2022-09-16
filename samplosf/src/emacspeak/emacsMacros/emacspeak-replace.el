;;; $Id: emacspeak-replace.el,v 1.13 1995/08/17 14:09:44 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extension for replace.el
;;; Keywords: Emacspeak, Speech feedback, query replace (replace.el)
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
(require 'advice)
(require 'voice-lock)
(require 'dtk-voices)
(require 'emacspeak-speak)
(eval-when (compile)
  (load-library "replace"))
;;{{{  Introduction:

;;; This module causes emacs' replacement functions to use voice locking

;;}}}
;;{{{  define personalities

(dtk-define-voice 'emacspeak-replace-personality
                  "[:np :dv ap 142]" )

;;}}}
;;{{{  Advice

(defvar emacspeak-replace-highlight-on nil
  "Flag that says if replace highlight is on.")

(defvar emacspeak-replace-saved-personality nil
  "Value saved before replace-highlight changed the personality. ")

(defvar emacspeak-replace-start nil)
(defvar emacspeak-replace-end nil)

(defadvice query-replace (around emacspeak pre act compile)
  "Stop message from chattering.
 Turn on voice lock temporarily. "
  (declare (special voice-lock-mode ))
  (let ((saved-voice-lock voice-lock-mode))
    (dtk-stop)
    (unwind-protect
        (progn
          (setq voice-lock-mode 1)
          (save-match-data (ad-deactivate 'message))
          ad-do-it)
      (setq voice-lock-mode saved-voice-lock)
      (save-match-data(ad-activate-on 'message )))))

(defadvice replace-highlight (before  emacspeak pre act)
  "Voicify and speak the line containing the replacement. "
  (declare (special emacspeak-replace-highlight-on
                    emacspeak-replace-saved-personality
                    emacspeak-replace-start emacspeak-replace-end))
  (let ((from (ad-get-arg 0))
        (to (ad-get-arg 1 ))
        (dtk-stop-immediately nil))
    (setq emacspeak-replace-highlight-on t
          emacspeak-replace-start from
          emacspeak-replace-end to 
          emacspeak-replace-saved-personality
          (get-text-property  from 'personality))
    (put-text-property from to 'personality 'emacspeak-replace-personality )
    (emacspeak-speak-line)
    )
  )

(defadvice replace-dehighlight (after emacspeak pre act)
  "Turn off the replacement highlight. "
  (declare (special emacspeak-replace-highlight-on
                    emacspeak-replace-saved-personality
                    emacspeak-replace-start emacspeak-replace-end))
  (setq emacspeak-replace-highlight-on nil)
  )

;;}}}
(provide 'emacspeak-replace)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
