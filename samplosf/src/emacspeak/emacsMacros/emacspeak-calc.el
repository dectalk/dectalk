;;; $Id: emacspeak-calc.el,v 1.6 1995/08/18 23:29:34 raman Exp $
;;; $Author: leeber$ 
;;; Description: 
;;; Keywords:
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

(require 'advice)
(require 'emacspeak-fix-interactive)
(require 'emacspeak-speak)
(require 'emacspeak-sounds)
;;{{{  Introduction:

;;; This module extends the Emacs Calculator.
;;; Extensions are minimal.
;;; We force a calc-load-everything,
;;; And use an after advice on this function
;;; To fix all of calc's interactive functions

;;}}}
;;{{{  If you load everything:

(defvar emacspeak-calc-commands-to-fix 
  '(calc-over-notation
    calc-radix
    calc-describe-key-briefly
    calc-graph-num-points
    calc-settings-file-name
    calc-precision
    calc-match
    calc-hms-notation
    calc-collect
    calc-graph-output
    calc-left-label
    calc-arrange-vector
    calc-find-minimum
    calc-graph-title-x
    calc-graph-title-y
    calc-graph-title-z
    calc-describe-key
    calc-graph-geometry
    calc-date-notation
    calc-graph-name
    calc-graph-command
    calc-poly-roots
    calc-summation
    calc-point-char
    calc-rewrite-selection
    calc-graph-display
    calc-report-bug
    calc-mrow
    calc-undefine-unit
    calc-kbd-query
    calc-graph-device
    calc-convert-time-zones
    calc-matrix-brackets
    calc-fix-notation
    calc-derivative
    calc-kbd-report
    calc-substitute
    calc-taylor
    calc-trail-marker
    calc-product
    calc-insert-variables
    calc-find-root
    calc-ident
    calc-histogram
    calc-rewrite
    calc-group-char
    calc-build-vector
    calc-solve-for
    report-calc-bug
    calc-alt-summation
    calc-define-unit
    calc-mcol
    calc-get-unit-definition
    calc-tabulate
    calc-graph-range-x
    calc-graph-range-y
    calc-graph-range-z
    calc-find-maximum
    calc-date-part
    calc-num-integral
    calc-right-label
    calc-graph-header
    calc-integral
    calc-index)
  "List of interactive commands that need to be fixed
by emacspeak-fix-interactive. 
This list has been computed by hand,
ie by calling emacspeak-fix-commands-that-use-interactive 
after loading calc, and extracting the names of those 
commands that were found to have been fixed.")

(defadvice calc-load-everything (after emacspeak pre act)
  "Fix all the interactive functions provided by calc. "
(declare (special emacspeak-calc-commands-to-fix ))
  (mapcar 'emacspeak-fix-interactive-command-if-necessary 
emacspeak-calc-commands-to-fix ))

(defadvice calc-quit (after emacspeak pre act )
  "Announce the buffer that becomes current when calc is quit."
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (emacspeak-speak-mode-line)))

;;}}}
(provide 'emacspeak-calc)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
