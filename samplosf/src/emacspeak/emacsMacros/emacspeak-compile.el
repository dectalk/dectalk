;;; $Id: emacspeak-compile.el,v 1.7 1995/08/03 20:36:57 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extensions to  the compile package 
;;; Keywords: Emacspeak Speech Output Compile.el 
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
(require 'emacspeak-speak)

;;{{{  Introduction:

;;; This module makes compiling code from inside Emacs speech friendly.
;;; It is an example of how a little amount of code can make Emacspeak even
better.
;;; Note: This code is not essential to use
;;; Emacs' compile-mode with emacspeak:
;;; It just makes things a lot better. 

;;}}}
;;{{{  functions

(defun emacspeak-compilation-speak-error ()
  "Speech feedback about the compilation error. "
  (declare (special dtk-stop-immediately
                    compilation-last-buffer ))
  (let ((dtk-stop-immediately nil))
    (emacspeak-speak-line ))
  (when compilation-last-buffer 
    (save-excursion (set-buffer compilation-last-buffer)
                    (emacspeak-speak-line ))))

;;}}}
;;{{{  advice 

(defadvice next-error (after emacspeak pre act )
  "Speak the line containing the error. "
  (when (interactive-p) (emacspeak-compilation-speak-error))
  )
(defadvice previous-error (after emacspeak pre act )
  "Speak the line containing the error. "
  (when (interactive-p) (emacspeak-compilation-speak-error))
  )

(defadvice compile-goto-error (after emacspeak pre act)
  "Speak the compilation error. "
  (when (interactive-p) (emacspeak-speak-line ))
  )


(defadvice compilation-next-file (after emacspeak pre act)
  "Speak the error line. "
  (when (interactive-p) (emacspeak-compilation-speak-error ))
  )

(defadvice compilation-previous-file (after emacspeak pre act)
  "Speak the error line. "
  (when (interactive-p) (emacspeak-compilation-speak-error ))
  )

;;}}}

(provide 'emacspeak-compile)

;;{{{  emacs local variables

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
