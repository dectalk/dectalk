;;; $Id: html-voice.el,v 1.2 1995/09/16 20:51:33 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Voice locking for html helper  mode. Cloned from html-font.el
;;; Keywords: voice lock, html-helper-mode, emacspeak, speech 
;;{{{  LCD Archive entry: 
;;; LCD Archive Entry:
;;; emacspeak| T. V. Raman |raman@crl.dec.com 
;;; A speech interpersonality to Emacs |
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



;;; html-voice.el --- Adds voice-lock support to HTML helper mode in Emacs.
;; Copyright (C) 1995 Ulrik Dickow.

;; Author: Ulrik Dickow <dickow@nbi.dk> (http://www.nbi.dk/~dickow)
;; Created: 18-Jan-1995
;; Maintainer: Ulrik Dickow <dickow@nbi.dk> (http://www.nbi.dk/~dickow)
;; Version: @(#) html-voice.el version 3.0 28-Jun-1995 U.Dickow
;; Keywords: languages HTML voice-lock personalitys
;; See also: fort-voice.el kumac-voice.el html-helper-mode.el html-mode.el
;; See also URL: http://www.nbi.dk/~dickow/emacs/

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; LCD Archive Entry:
;; html-voice|Ulrik Dickow|dickow@nbi.dk|
;; Adds Font Lock support to HTML helper mode in Emacs.|
;; xx-Jul-1995|3.0|~/misc/html-voice.el.Z|

;;; Commentary:

;; Sets up HTML helper mode for full support of voice-lock-mode in Emacs.
;; Without something like this, voice-lock-mode will only voiceify strings.
;; Required: html-helper-mode.el (LCD or http://www.santafe.edu/~nelson/tools/)
;; However, this file can easily be adapted to e.g. M.Andreessen's html-mode.
;; Written for Emacs 19.27-29.
;; Doesn't work with XEmacs 19.10/11, but perhaps with 19.12?

;; Installation, currently:
;;   1) Put html-voice.el in your load-path and `M-x byte-compile-file' it.
;;   2) Add this to your ~/.emacs (without the ";;" in front):
;;        (add-hook 'html-helper-load-hook '(lambda () (load "html-voice")))
;; Customize voice-lock as you would do for any other major mode.
;;   For Emacs 19.29, default colours are setup automatically.
;;   For earlier versions, you have to write a lot yourself (or get it from
;;   somewhere else, e.g. Simon Marshall's personality-lock.el in the LCD; see also
;;   http://www.nbi.dk/~dickow/emacs/), for example:
;;   3) To have a colourful display with voice lock in any supported major mode,
;;      you can add something like this to your ~/.emacs:
;;        (copy-personality             'bold 'voice-lock-keyword-personality) ; or italic/...
;;        (set-personality-foreground         'voice-lock-keyword-personality "ForestGreen")
;;        (setq voice-lock-keyword-personality 'voice-lock-keyword-personality)
;;      and similary for `voice-lock-string-personality' etc. (see voice-lock.el).
;;   4) To have voice-lock turned on every time html-helper-mode is entered do
;;        (add-hook 'html-helper-mode-hook '(lambda () (voice-lock-mode 1)))
;;      If you don't want strings highlighted as such, then insert
;;        (make-local-variable voice-lock-no-comments)
;;        (setq voice-lock-no-comments t)
;;      in the hook (immediately before `(voice-lock-mode 1)').
;; A brave XEmacs 19.12 user that wants to try this file should
;; define voice-lock-{bold,italic,underline}-personality, for example like this:
;;   (copy-personality 'bold   'voice-lock-bold-personality)
;;   (copy-personality 'italic 'voice-lock-italic-personality)
;;   (set-personality-underline-p (make-personality 'voice-lock-underline-personality) t)
;; For faster startup, you may want to use colours instead, like in 3).

;; This file will probably be incorporated into html-helper-mode.el later on.

;; Author's note: It should remain possible for the user to choose whether
;;   to highlight strings or not. The default may be changed, however (cf. the
;;   commented out statements in the hook in the bottom of this file).

;; Bugs: * Nested tags may not always be voiceified the way you would expect.
;;   "strings" ("...") outside tags shouldn't inhibit bold/italic
;;   voiceification, but it currently does (author doesn't care much).
;;   * It almost works for XEmacs 19.10/11, but with "screwy colours" 8-().

;;; Code:

(require 'html-helper-mode)  ; When we like to modify the syntax table
(require 'cl)
(require 'voice-lock)
;; Code for greater flexibility, especially for XEmacs compatibility.
;; Note that Emacs evaluates the personality entries in `voice-lock-keywords',
;; while XEmacs doesn't.



;; The following personality variable is introduced in Emacs 19.29's voice-lock.el.
;; For Emacs <19.29 we fall back to the doc string personality (obsoleted by
;;19.29).
(declaim (special voice-lock-variable-name-personality))
(or (boundp 'voice-lock-variable-name-personality)
    (setq voice-lock-variable-name-personality 'voice-lock-doc-string-personality))

;; Let's reset syntax to make it possible for voice-lock to colour strings.
;; They usually appear inside anchors; thus these may become two-coloured.
(modify-syntax-entry ?\" "\"   " html-helper-mode-syntax-table)

(defvar html-voice-lock-keywords
  (let ((tword "\\(h1\\|title\\)")          ; Titles, like function defs
	(bword "\\(b\\|h[2-4]\\|strong\\)") ; Names of tags to boldify
	(iword "\\(address\\|cite\\|em\\|i\\|var\\)") ; ... to italify
	;; Regexp to match shortest sequence that surely isn't a bold end.
	;; We simplify a bit by extending "</strong>" to "</str.*".
	;; Do similarly for non-italic and non-title ends.
	(not-bend (concat "\\([^<]\\|<\\([^/]\\|/\\([^bhs]\\|"
			  "b[^>]\\|"
			  "h\\([^2-4]\\|[2-4][^>]\\)\\|"
			  "s\\([^t]\\|t[^r]\\)\\)\\)\\)"))
	(not-iend (concat "\\([^<]\\|<\\([^/]\\|/\\([^aceiv]\\|"
			  "a\\([^d]\\|d[^d]\\)\\|"
			  "c\\([^i]\\|i[^t]\\)\\|"
			  "e\\([^m]\\|m[^>]\\)\\|"
			  "i[^>]\\|"
			  "v\\([^a]\\|a[^r]\\)\\)\\)\\)"))
	(not-tend (concat "\\([^<]\\|<\\([^/]\\|/\\([^ht]\\|"
			  "h[^1]\\|t\\([^i]\\|i[^t]\\)\\)\\)\\)")))
    (list
     ;; Comments: <!-- ... -->. They traditionally override string colouring.
     ;; It's complicated 'cause we won't allow "-->" inside a comment, and
     ;; voice-lock colours the *longest* possible match of the regexp.
     '("\\(<!--\\([^-]\\|-[^-]\\|--[^>]\\)*-->\\)" 1 voice-lock-comment-personality t)
     ;; SGML things like <!DOCTYPE ...> with possible <!ENTITY...> inside.
     '("\\(<![a-z]+\\>[^<>]*\\(<[^>]*>[^<>]*\\)*>\\)"
       1 voice-lock-comment-personality keep)
     ;; Anchors, images & forms (again keep possible string colouring inside).
     '("\\(<a\\b[^>]*>\\)" 1 voice-lock-keyword-personality keep)
     "</a>"
     '("\\(<\\(form\\|i\\(mg\\|nput\\)\\)\\>[^>]*>\\)"
       1 voice-lock-variable-name-personality keep)
     ;; HTML special characters
     '("&[^;\n]*;" . voice-lock-string-personality)
     ;; Underline is rarely used. Only handle it when no tags inside.
     '("<u>\\([^<]*\\)</u>" 1 voice-lock-underline-personality keep)
     ;; '("<u>\\([^<]*\\)<" 1 ..underl..) '("\\(>[^<]*\\)</u>" 1 ..underl..)
     ;; Titles and level 1 headings (anchors do sometimes appear in h1's)
     (list (concat "<" tword ">\\(" not-tend "*\\)</\\1>")
	   2 'voice-lock-function-name-personality 'keep)
     ;; Large-scale structure keywords (like "program" in Fortran).
     ;;   "<html>" "</html>" "<body>" "</body>" "<head>" "</head>" "</form>"
     '("</?\\(body\\|form\\|h\\(ead\\|tml\\)\\)>"
       . voice-lock-variable-name-personality)
     ;; Any tag, general rule, just before bold/italic stuff.
     '("\\(<[^>]*>\\)" 1 voice-lock-type-personality keep)
     ;; More tag pairs (<b>...</b> etc.).
     ;; Cunning repeated voiceification to handle common cases of overlap.
     ;; Bold simple --- first voiceify bold regions with no tags inside.
     (list (concat "<" bword ">\\("  "[^<]"  "*\\)</\\1>")
	   2 'voice-lock-bold-personality 'keep)
     ;; Italic complex --- possibly with arbitrary non-italic kept inside.
     (list (concat "<" iword ">\\(" not-iend "*\\)</\\1>")
	   2 'voice-lock-italic-personality 'keep)
     ;; Bold complex --- possibly with arbitrary other non-bold stuff inside.
     (list (concat "<" bword ">\\(" not-bend "*\\)</\\1>")
	   2 'voice-lock-bold-personality 'keep)))
  "Additional expressions to highlight in HTML helper mode.")

;; It shouldn't matter whether this hook is executed before or after voice-lock.
;; Fortunately, voice-lock.el is very friendly in this respect.
;; We must be equally friendly and make sure we don't make global defaults.
;; It can be done much more elegantly in Emacs 19.29+, but we'll keep it this
;; way to retain compatibility with older Emacsen.
(add-hook 'html-helper-mode-hook
 '(lambda ()
    (make-local-variable 'voice-lock-keywords-case-fold-search)
    (make-local-variable 'voice-lock-keywords)
;;  (make-local-variable 'voice-lock-no-comments)
    ;; Regard the patterns in html-voice-lock-keywords as case-insensitive
    (setq voice-lock-keywords-case-fold-search t)
    (setq voice-lock-keywords html-voice-lock-keywords)))
;;  (setq voice-lock-no-comments t)))

(provide 'html-voice)

;;; html-voice.el ends here
