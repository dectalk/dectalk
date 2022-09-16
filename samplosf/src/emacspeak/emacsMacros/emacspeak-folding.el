;;; $Id: emacspeak-folding.el,v 1.4 1995/09/14 18:07:16 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for folding-mode
;;; Keywords:emacspeak, audio interface to emacs Folding editor
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

(require 'emacspeak-sounds)
;;{{{  Introduction:

;;; Folding mode turns emacs into a folding editor.
;;; Folding mode is what I use: 
;;; emacs 19 comes with similar packages, e.g. allout.el
;;; This module defines some advice forms that make folding mode a pleasure to use.
;;; Think of a fold as a container. 
;;; 

;;}}}
;;{{{ Advice

(defadvice folding-mode (after emacspeak pre act )
  "Provide spoken feedback"
  (when (interactive-p)
    (message "turned %s folding mode"
             (if folding-mode " on " " off" ))))

(defadvice fold-enter (after emacspeak pre act)
  "Produce an auditory icon and then speak the line. "
(when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (emacspeak-speak-line)))

(defadvice fold-exit (after emacspeak pre act)
  "Produce an auditory icon. 
Then speak the folded line."
  (when (interactive-p) 
    (emacspeak-auditory-icon'close-object)
    (emacspeak-speak-line)))

(defadvice fold-fold-region (after emacspeak pre act)
"Produce an auditory icon. "
(when (interactive-p )
(emacspeak-auditory-icon 'open-object)
(message "Specify a meaningful name for the new fold ")))

;;}}}
(provide  'emacspeak-folding)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
