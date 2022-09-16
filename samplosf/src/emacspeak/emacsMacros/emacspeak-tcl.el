;;; $Id: emacspeak-tcl.el,v 1.4 1995/09/02 14:29:21 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for tcl-mode
;;; Keywords:emacspeak, audio interface to emacs tcl
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

;;; Provide additional advice to tcl-mode 

;;}}}
;;{{{  Advice electric insertion to talk:

(defadvice tcl-electric-hash (after emacspeak pre act comp )
  "Speak what you inserted."
  (when (interactive-p)
    (emacspeak-speak-this-char last-input-char)))

(defadvice tcl-electric-char (after emacspeak pre act comp )
  "Speak what you inserted."
  (when (interactive-p)
    (emacspeak-speak-this-char last-input-char)))

(defadvice tcl-electric-brace (after emacspeak pre act comp )
  "Speak what you inserted."
  (when (interactive-p)
    (emacspeak-speak-this-char last-input-char)))

;;}}}
;;{{{  Actions in the tcl mode buffer:

(defadvice switch-to-tcl (before emacspeak pre act comp)
  "Announce yourself."
  (when (interactive-p)
    (message "Switching to the Inferior TCL buffer")))

(defadvice tcl-eval-region (after emacspeak  pre act comp)
  "Announce what you did."
  (when (interactive-p)
    (message "Evaluating contents of region")))

(defadvice tcl-eval-defun (after emacspeak pre act comp )
  "Announce what you did"
  (when (interactive-p)
    (let* ((start nil)
           (proc-line
           (save-excursion
             (tcl-beginning-of-defun)
             (setq start (point))
             (end-of-line)
             (buffer-substring start (point)))))
    (message "Evaluated  %s" proc-line ))))

(defadvice tcl-help-on-word (after emacspeak pre act comp)
  "Speak  the help."
  (when (interactive-p)
    (emacspeak-auditory-icon 'help)
    (save-excursion
      (set-buffer "*Tcl help*")
      (emacspeak-speak-buffer ))))

;;}}}
;;{{{  Program structure:

(defadvice tcl-mark-defun (after emacspeak pre act comp)
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'mark-object)
    (message "Marked procedure")))

(defadvice tcl-beginning-of-defun (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice tcl-end-of-defun (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)))

;;}}}

(provide  'emacspeak-tcl)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
