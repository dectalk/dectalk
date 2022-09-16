;;; $Id: emacspeak-ispell.el,v 1.11 1995/08/03 20:41:09 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extension to speech enable ispell
;;; Keywords: Emacspeak, Ispell, Spoken Output, Ispell version 2.30
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


;;{{{  Introduction:

;;; This module speech enables ispell.
;;; Implementation note: This is hard because of how  ispell.el is written
;;; Namely, all of the work is done by one huge hairy function.
;;; This makes advising it hard. 

;;}}}

;;{{{  first set up voice  highlighting:

(defvar ispell-highlight-personality 'harry
  "Voice used to highlight spelling errors. ")

(and (featurep 'emacspeak )
     (fset 'ispell-highlight-spelling-error
           (symbol-function 'ispell-highlight-spelling-error-overlay)))

 (defadvice ispell-highlight-spelling-error (after emacspeak act )
   "Use voice locking to highlight the error.
Will clobber any existing personality property defined on start end"
   (let ((start (ad-get-arg 0))
         (end (ad-get-arg 1 ))
         (highlight (ad-get-arg 2 )))
     (if highlight
         (put-text-property  start end
                             'personality  ispell-highlight-personality )
       (put-text-property start end
                          'personality  nil ))
     )
   )

;;}}}
;;{{{  ispell command loop:

;;; Speak the error line:
(defadvice ispell-command-loop (before emacspeak pre act )
  "Speak the line containing the incorrect word.
 Then speak  the possible corrections. "
  (let ((choices  (ad-get-arg 0 ))
        (dtk-stop-immediately nil )
        (position 0))
    (ad-deactivate 'message)
    (emacspeak-speak-line)
    (while (and choices)
      (dtk-speak (format "%s %s" position (car choices )))
      (incf position)
      (setq choices (cdr choices )))    ; end while
    ))

(defadvice ispell-command-loop (after emacspeak pre act )
  "Re-activate message advice, which was deactivated
by the before advice to avoid chatter. "
  (ad-activate 'message)
  )


(defadvice ispell-help (before emacspeak pre act)
  "Speak the help message. "
  (let ((dtk-stop-immediately t))
    (dtk-speak (documentation 'ispell-help )))
  )

;;}}}


(provide 'emacspeak-ispell)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
