;;; $Id: emacspeak-auctex.el,v 1.6 1995/09/12 17:09:24 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for auctex-mode
;;; Keywords:emacspeak, audio interface to emacs AUCTEX
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
(require 'emacspeak-speak)
(require 'emacspeak-sounds)
;;{{{  Introduction:

;;; Provide additional advice to auctex

;;}}}
;;{{{  Marking structured objects:

(defadvice LaTeX-mark-section (after emacspeak pre act)
"Speak the first line. 
Also provide an auditory icon. "
(when (interactive-p) 
(emacspeak-speak-line)
(emacspeak-auditory-icon 'mark-object)))

(defadvice LaTeX-mark-environment (after emacspeak pre act)
"Speak the first line. 
Also provide an auditory icon. "
(when (interactive-p) 
(emacspeak-speak-line)
(emacspeak-auditory-icon 'mark-object)))

;;}}}
;;{{{  delimiter matching:

(defadvice LaTeX-find-matching-begin (after emacspeak pre act)
"Provide auditory feedback. "
(when (interactive-p)
(emacspeak-speak-line)))

(defadvice LaTeX-find-matching-end (after emacspeak pre act)
"Provide auditory feedback. "
(when (interactive-p)
(emacspeak-speak-line)))

(defadvice LaTeX-close-environment (after emacspeak pre act)
  "Speak the inserted line. "
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (emacspeak-read-previous-line)))

(defadvice TeX-insert-dollar (after emacspeak pre act comp)
  "Speak what you inserted"
  (when (interactive-p)
    (emacspeak-speak-this-char  (preceding-char ))))

;;}}}
;;{{{  Inserting structures

(defadvice LaTeX-insert-item (after emacspeak pre act)
"Provide auditory feedback. "
(when (interactive-p)
(emacspeak-speak-line )))

(defadvice LaTeX-environment (after emacspeak pre act)
"Provide auditory feedback, by speaking 
the opening line of the newly inserted environment. "
(when (interactive-p)
(emacspeak-auditory-icon 'open-object)
(emacspeak-read-previous-line)))

(defadvice TeX-insert-macro (around  emacspeak pre act)
"Provide spoken feedback."
(let ((opoint (point )))
ad-do-it
(emacspeak-speak-region opoint (point))))

;;}}}
;;{{{  Commenting chunks:

(defadvice TeX-comment-region (after emacspeak pre act)
  "Provide spoken and auditory feedback. "
  (when (interactive-p)
    (emacspeak-speak-line)
    (emacspeak-auditory-icon 'select-object)))

(defadvice TeX-un-comment (after emacspeak pre act)
  "Provide spoken and auditory feedback. "
  (when (interactive-p)
    (emacspeak-speak-line)
    (emacspeak-auditory-icon 'select-object)))

(defadvice TeX-un-comment-region (after emacspeak pre act)
  "Provide spoken and auditory feedback. "
  (when (interactive-p)
    (emacspeak-speak-line)
    (emacspeak-auditory-icon 'select-object)))

(defadvice TeX-comment-paragraph (after emacspeak pre act)
  "Provide spoken and auditory feedback. "
  (when (interactive-p)
    (emacspeak-speak-line)
    (emacspeak-auditory-icon 'select-object)))

;;}}}

;;{{{  Debugging tex

(defadvice TeX-next-error (after emacspeak pre act)
  "Speak the error line. "
  (when (interactive-p)
    (emacspeak-auditory-icon 'select-object)
    (emacspeak-speak-line )))

;;}}}

(provide  'emacspeak-auctex)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
