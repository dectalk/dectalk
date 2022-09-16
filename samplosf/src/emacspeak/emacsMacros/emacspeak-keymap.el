;;; $Id: emacspeak-keymap.el,v 3.50 1995/09/12 13:10:24 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Module for setting up emacspeak keybindings
;;; Keywords: Emacspeak, Keybinding, Spoken Output
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

;;; This module defines the emacspeak keybindings. 

;;}}}
;;{{{  variables: 

(defvar emacspeak-prefix "\C-e"
  "Default prefix key used for emacspeak. ")

(defvar emacspeak-keymap (make-sparse-keymap )
  "Primary keymap used by emacspeak. ")

(defvar emacspeak-dtk-submap (make-sparse-keymap)
  "Submap used for DTK commands. ")

;;}}}
;;{{{   Binding keymap and submap

(define-prefix-command 'emacspeak-prefix-command 'emacspeak-keymap)
(define-prefix-command  'emacspeak-dtk-submap-command 'emacspeak-dtk-submap )
(global-set-key emacspeak-prefix 'emacspeak-prefix-command)
(define-key emacspeak-keymap "d"  'emacspeak-dtk-submap-command)

;;; fix what we just broke:-
(define-key emacspeak-keymap "e" 'end-of-line)

;;}}}
;;{{{  The actual bindings.

(define-key help-map emacspeak-prefix 'emacspeak-describe-emacspeak)

(define-key emacspeak-keymap '[up]  'emacspeak-read-previous-line)
(define-key emacspeak-keymap '[right]  'emacspeak-read-next-word)
(define-key emacspeak-keymap '[left]  'emacspeak-read-previous-word)
(define-key emacspeak-keymap '[down]  'emacspeak-read-next-line)
(define-key emacspeak-keymap "x" 'emacspeak-view-register)
(define-key emacspeak-keymap "w" 'emacspeak-speak-word)
(define-key emacspeak-keymap "v" 'emacspeak-speak-version)
(define-key emacspeak-keymap "t" 'emacspeak-speak-time )
(define-key emacspeak-keymap "s" 'dtk-stop)
(define-key emacspeak-keymap "r" 'emacspeak-speak-region)
(define-key emacspeak-keymap "R" 'emacspeak-speak-rectangle)
(define-key emacspeak-keymap "q" 'emacspeak-voicify-rectangle)
(define-key emacspeak-keymap "p" 'emacspeak-speak-paragraph)
(define-key emacspeak-keymap "o" 'emacspeak-voicify-region)
(define-key emacspeak-keymap "m" 'emacspeak-speak-mode-line)
(define-key emacspeak-keymap "l" 'emacspeak-speak-line)
(define-key emacspeak-keymap "k" 'emacspeak-speak-current-kill )
(define-key emacspeak-keymap "i" 'emacspeak-tabulate-region)
(define-key emacspeak-keymap "h" 'emacspeak-speak-help)
(define-key emacspeak-keymap  "f" 'emacspeak-speak-current-field )
(define-key emacspeak-keymap "c" 'emacspeak-speak-char)
(define-key emacspeak-keymap "b" 'emacspeak-speak-buffer)
(define-key emacspeak-keymap "a" 'emacspeak-speak-message-again )
(define-key emacspeak-keymap "\C-s" 'dtk-emergency-restart )
(define-key emacspeak-keymap "\C-q" 'emacspeak-toggle-comint-autospeak)
(define-key emacspeak-keymap "\C-m"  'emacspeak-speak-continuously)
(define-key emacspeak-keymap "\C-i" 'emacspeak-speak-completions)
(define-key emacspeak-keymap "\C-h" 'emacspeak-learn-mode)
(define-key emacspeak-keymap "\C-b" 'emacspeak-submit-bug )
(define-key emacspeak-keymap "\"" 'emacspeak-speak-sexp-interactively)
(define-key emacspeak-keymap "W" 'emacspeak-speak-word-interactively)
(define-key emacspeak-keymap "P" 'emacspeak-speak-paragraph-interactively)
(define-key emacspeak-keymap "M" 'emacspeak-speak-minor-mode-line)
(define-key emacspeak-keymap "L" 'emacspeak-speak-line-interactively)
(define-key emacspeak-keymap "H" 'emacspeak-speak-help-interactively)
(define-key emacspeak-keymap "B" 'emacspeak-speak-buffer-interactively)
(define-key emacspeak-keymap "A" 'emacspeak-appt-repeat-announcement)
(define-key emacspeak-keymap "?" 'search-backward )
(define-key emacspeak-keymap "/" 'search-forward)
(define-key emacspeak-keymap "." 'emacspeak-speak-sentence )
(define-key emacspeak-keymap "1" 'emacspeak-speak-current-window)
(define-key emacspeak-keymap "\C-o" 'emacspeak-speak-other-window )
(define-key emacspeak-keymap "\C-p" 'emacspeak-speak-previous-window)
(define-key emacspeak-keymap "\C-n" 'emacspeak-speak-next-window )
(define-key emacspeak-keymap ")" 'emacspeak-use-customized-blink-paren)
(define-key emacspeak-keymap "'" 'emacspeak-speak-sexp)
(define-key emacspeak-keymap "=" 'emacspeak-speak-current-column)
(define-key emacspeak-keymap "%" 'emacspeak-speak-current-percentage)
(define-key emacspeak-keymap "<" 'emacspeak-speak-previous-field)
(define-key emacspeak-keymap ">"  'emacspeak-speak-next-field)
(define-key emacspeak-keymap " " 'emacspeak-speak-page-interactively)
(define-key emacspeak-keymap "\C-w" 'emacspeak-speak-window-information)
(define-key emacspeak-keymap   "\C-a"   'emacspeak-toggle-auditory-icons )
;;; submap for setting dtk:
(define-key emacspeak-dtk-submap "z" 'emacspeak-zap-dtk)
(define-key emacspeak-dtk-submap "w" 'emacspeak-toggle-word-echo)
(define-key emacspeak-dtk-submap "v" 'voice-lock-mode)
(define-key emacspeak-dtk-submap "s" 'dtk-toggle-split-caps)
(define-key emacspeak-dtk-submap "r" 'dtk-set-rate)
(define-key emacspeak-dtk-submap "q" 'dtk-toggle-quiet )
(define-key emacspeak-dtk-submap "p" 'dtk-set-punctuations)
(define-key emacspeak-dtk-submap "m" 'dtk-set-pronunciation-mode)
(define-key emacspeak-dtk-submap "l" 'emacspeak-toggle-line-echo)
(define-key emacspeak-dtk-submap "k" 'emacspeak-toggle-character-echo)
(define-key emacspeak-dtk-submap "i" 'emacspeak-toggle-audio-indentation )
(define-key emacspeak-dtk-submap "f" 'dtk-set-character-scale)
(define-key emacspeak-dtk-submap "d" 'dtk-select-driver)
(define-key emacspeak-dtk-submap "c" 'dtk-toggle-capitalization)
(define-key emacspeak-dtk-submap "b" 'dtk-toggle-debug)
(define-key emacspeak-dtk-submap "a" 'dtk-add-cleanup-pattern)

;;; Put these in the global map:

(global-set-key '[27 up]  'emacspeak-owindow-previous-line)
(global-set-key  '[27 down]  'emacspeak-owindow-next-line)
(global-set-key  '[27 prior]  'emacspeak-owindow-scroll-down)
(global-set-key  '[27 next]  'emacspeak-owindow-scroll-up)
(global-set-key  '[27 select]  'emacspeak-owindow-speak-line)

;;}}}
(provide 'emacspeak-keymap)

;;{{{  emacs local variables

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
