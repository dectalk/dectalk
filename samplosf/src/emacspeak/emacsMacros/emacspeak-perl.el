;;; $Id: emacspeak-perl.el,v 1.1 1995/08/20 20:35:59 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for perl-mode
;;; Keywords:emacspeak, audio interface to emacs perl
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

;;; Provide additional advice to perl-mode 

;;}}}
;;{{{  Advice electric insertion to talk:

(defadvice electric-perl-terminator  (after emacspeak pre act comp )
  "Speak what you inserted."
  (when (interactive-p)
    (emacspeak-speak-this-char last-input-char)))

;;}}}
;;{{{  Program structure:

(defadvice mark-perl-function (after emacspeak pre act comp)
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'mark-object)
    (message "Marked procedure")))

(defadvice perl-beginning-of-function (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice perl-end-of-function (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)))

;;}}}

(provide  'emacspeak-perl)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
