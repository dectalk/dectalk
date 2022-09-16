;;; $Id: voice-lock.el,v 3.19 1995/09/16 21:07:28 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Voice lock mode for Emacspeak
;;; Keywords: Emacspeak, Voices, Speech fonts, Dectalk
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

;;{{{  gnu copyright

;; Electric Font Lock Mode
;; Copyright (C) 1992, 1993, 1994 Free Software Foundation, Inc.

;; Author: jwz, then rms
;; Maintainer: FSF
;; Keywords: languages, faces

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;}}}

;;; Commentary:
;;; A voice is to audio as a font is to a visual display.
;;; A personality is to audio as a face is to a visual display. 
;;; 
;; Voice-lock-mode is a minor mode that causes your comments to be 
;; spoken in one personality, strings in another, reserved words in another,
;; documentation strings in another, and so on.
;;
;; Comments will be spoken in `voice-lock-comment-personality'.
;; Strings will be spoken in `voice-lock-string-personality'.
;; Doc strings will be spoken in `voice-lock-doc-string-personality'.
;; Function and variable names (in their defining forms) will be
;;  spoken in `voice-lock-function-name-personality'.
;; Reserved words will be spoken in `voice-lock-keyword-personality'.
;;
;; To make the text you type be voiceified, use M-x voice-lock-mode.
;; When this minor mode is on, the voices of the current line are
;; updated with every insertion or deletion.
;;
;; To define new reserved words or other patterns to highlight, use
;; the `voice-lock-keywords' variable.  This should be mode-local.
;;
;; To turn this on automatically, add this to your .emacs file:
;;
;;	(setq emacs-lisp-mode-hook '(lambda () (voice-lock-mode 1)))
;;
;; On a Sparc2, the initial voiceification takes about 12 seconds for a 120k
;; file of C code, using the default configuration.  You can speed this up
;; substantially by removing some of the patterns that are highlighted by
;; default.  Voiceifying Lisp code is significantly faster, because Lisp has a
;; more regular syntax than C, so the expressions don't have to be as hairy.

;;; Code:

(defvar voice-lock-comment-personality
  'paul-monotone  
  "Personality to use for comments.")
(defvar voice-lock-underline-personality 
  'paul-animated 
  "Personality to use for underline text.")

(defvar voice-lock-bold-personality 
  'harry
  "Personality to use for bold  text.")

(defvar voice-lock-italic-personality 
  'paul-italic 
  "Personality to use for italic  text.")

(defvar voice-lock-doc-string-personality
  'dennis  
  "Personality to use for documentation strings.")

(defvar voice-lock-string-personality
  'betty 
  "Personality to use for string constants.")

(defvar voice-lock-function-name-personality
  'harry 
  "Personality to use for function names.")

(defvar voice-lock-keyword-personality
  'ursula  
  "Personality to use for keywords.")

(defvar voice-lock-type-personality
  'paul-smooth 
  "Personality to use for data types.")

(defvar voice-lock-no-comments nil
  "Non-nil means Voice-Lock shouldn't check for comments or strings.")

(make-variable-buffer-local 'voice-lock-keywords)
(defvar voice-lock-keywords nil
  "*The keywords to highlight.
If this is a list, then elements may be of the forms:

  \"string\"			  ; A regexp to highlight in the 
				  ;  `voice-lock-keyword-personality'.
  (\"string\" . N)  	          ; Highlight subexpression N of the regexp.
  (\"string\" . personality-name)	  ; Use the named personality
  (\"string\" N personality-name)        ; Both of the above
  (\"string\" N personality-name t)      ; This allows highlighting to override
				  ;  already-highlighted regions.
  (\"string\" N personality-name keep)   ; This allows highlighting to occur
				  ; even if some parts of what STRING matches
				  ; are already highlighted--but does not alter
				  ; the existing highlighting of those parts.

These regular expressions should not match text which spans lines.
While \\[voice-lock-voiceify-buffer] handles multi-line patterns correctly,
updating when you edit the buffer does not,
since it considers text one line at a time.

Be careful composing regexps for this list; the wrong pattern can dramatically
slow things down!")

(defvar voice-lock-keywords-case-fold-search nil
  "*Non-nil means the patterns in `voice-lock-keywords' are case-insensitive.")

(defvar voice-lock-syntax-table nil
  "*Non-nil means use this syntax table for voiceifying.
If this is nil, the major mode's syntax table is used.")

(defvar voice-lock-verbose nil 
  "*Non-nil means `voice-lock-voiceify-buffer' should print status messages.")

;;;###autoload
(defvar voice-lock-mode-hook nil
  "Function or functions to run on entry to Voice Lock mode.")

;;; These variables record, for each buffer,
;;; the parse state at a particular position, always the start of a line.
;;; This is used to make voice-lock-voiceify-region faster.
(defvar voice-lock-cache-position nil)
(defvar voice-lock-cache-state nil)
(make-variable-buffer-local 'voice-lock-cache-position)
(make-variable-buffer-local 'voice-lock-cache-state)

(defun voice-lock-voiceify-region (start end)
  "Put proper personality on each string and comment between START and END."
  (save-excursion
    (goto-char start)
    (beginning-of-line)
    (setq end (min end (point-max)))
    (let ((buffer-read-only nil)
	  state startline prev prevstate
	  (modified (buffer-modified-p)))
      ;; Find the state at the line-beginning before START.
      (setq startline (point))
      (if (eq (point) voice-lock-cache-position)
	  (setq state voice-lock-cache-state)
	;; Find outermost containing sexp.
	(beginning-of-defun)
	;; Find the state at STARTLINE.
	(while (< (point) startline)
	  (setq state (parse-partial-sexp (point) startline 0)))
	(setq voice-lock-cache-state state
	      voice-lock-cache-position (point)))
      ;; Now find the state precisely at START.
      (setq state (parse-partial-sexp (point) start nil nil state))
      ;; If the region starts inside a string, show the extent of it.
      (if (nth 3 state)
	  (let ((beg (point)))
	    (while (and (re-search-forward "\\s\"" end 'move)
			(nth 3 (parse-partial-sexp beg (point)
						   nil nil state))))
	    (put-text-property beg (point) 'personality voice-lock-string-personality)
	    (setq state (parse-partial-sexp beg (point) nil nil state))))
      ;; Likewise for a comment.
      (if (or (nth 4 state) (nth 7 state))
	  (let ((beg (point)))
	    (while (and (re-search-forward (if comment-end
					       (concat "\\s>\\|"
						       (regexp-quote comment-end))
					     "\\s>")
					   end 'move)
			(nth 3 (parse-partial-sexp beg (point)
						   nil nil state))))
	    (put-text-property beg (point) 'personality voice-lock-comment-personality)
	    (setq state (parse-partial-sexp beg (point) nil nil state))))
      ;; Find each interesting place between here and END.
      (while (and (< (point) end)
		  (setq prev (point) prevstate state)
		  (re-search-forward (if comment-start-skip
					 (concat "\\s\"\\|" comment-start-skip)
				       "\\s\"")
				     end t)
		  ;; Clear out the voices of what we skip over.
		  (progn (remove-text-properties prev (point) '(personality nil)) t)
		  ;; Verify the state at that place
		  ;; so we don't get fooled by \" or \;.
		  (setq state (parse-partial-sexp prev (point)
						  nil nil state)))
	(let ((here (point)))
	  (if (or (nth 4 state) (nth 7 state))
	      ;; We found a real comment start.
	      (let ((beg (match-beginning 0)))
		(goto-char beg)
		(save-restriction
		  (narrow-to-region (point-min) end)
		  (condition-case nil
		      (progn
			(forward-comment 1)
			;; forward-comment skips all whitespace,
			;; so go back to the real end of the comment.
			(skip-chars-backward " \t"))
		    (error (goto-char end))))
		(put-text-property beg (point) 'personality voice-lock-comment-personality)
		(setq state (parse-partial-sexp here (point) nil nil state)))
	    (if (nth 3 state)
		(let ((beg (match-beginning 0)))
		  (while (and (re-search-forward "\\s\"" end 'move)
			      (nth 3 (parse-partial-sexp here (point)
							 nil nil state))))
		  (put-text-property beg (point) 'personality voice-lock-string-personality)
		  (setq state (parse-partial-sexp here (point) nil nil state))))
	      ))
	;; Make sure PREV is non-nil after the loop
	;; only if it was set on the very last iteration.
	(setq prev nil))
      (and prev
	   (remove-text-properties prev end '(personality nil)))
      (and (buffer-modified-p)
	   (not modified)
	   (set-buffer-modified-p nil)))))

;; This code used to be used to show a string on reaching the end of it.
;; It is probably not needed due to later changes to handle strings
;; starting before the region in question.
;;	    (if (and (null (nth 3 state))
;;		     (eq (char-syntax (preceding-char)) ?\")
;;		     (save-excursion
;;		       (nth 3 (parse-partial-sexp prev (1- (point))
;;						  nil nil prevstate))))
;;		;; We found the end of a string.
;;		(save-excursion
;;		  (setq foo2 (point))
;;		  (let ((ept (point)))
;;		    (forward-sexp -1)
;;		    ;; Highlight the string when we see the end.
;;		    ;; Doing it at the start leads to trouble:
;;		    ;; either it fails to handle multiline strings
;;		    ;; or it can run away when an unmatched " is inserted.
;;		    (put-text-property (point) ept 'personality
;;				       (if (= (car state) 1)
;;					   voice-lock-doc-string-personality
;;					 voice-lock-string-personality)))))

(defun voice-lock-unvoiceify-region (beg end)
  (let ((modified (buffer-modified-p))
	(buffer-read-only nil))
    (remove-text-properties beg end '(personality nil))
    (set-buffer-modified-p modified)))

;; Called when any modification is made to buffer text.
(defun voice-lock-after-change-function (beg end old-len)
  (save-excursion
    (save-match-data
      (goto-char beg)
      ;; Discard the cache info if text before it has changed.
      (and voice-lock-cache-position
	   (> voice-lock-cache-position beg)
	   (setq voice-lock-cache-position nil))
      ;; Rescan till end of line.  yes!
      (goto-char end)
      (end-of-line)
      (setq end (point))
      (goto-char beg)
      (beginning-of-line)
      (setq beg (point))
      ;; First scan for strings and comments.
      ;; Must scan from line start in case of
      ;; inserting space into `intfoo () {}'.
      (if voice-lock-no-comments
	  (remove-text-properties beg (min (1+ end) (point-max)) '(personality nil))
	(voice-lock-voiceify-region beg (min (1+ end) (point-max))))
      ;; Now scan for keywords.
      (voice-lock-hack-keywords beg end))))

;;; Voiceifying arbitrary patterns

(defsubst voice-lock-any-properties-p (start end)
  (or (get-text-property start 'personality)
      (let ((next (next-single-property-change start 'personality)))
	(and next (< next end)))))

(defun voice-lock-hack-keywords (start end &optional loudly)
  (goto-char start)
  (let ((case-fold-search voice-lock-keywords-case-fold-search)
	(rest voice-lock-keywords)
	(count 0)
	(buffer-read-only nil)
	(modified (buffer-modified-p))
	first str match personality s e allow-overlap-p
	(old-syntax (syntax-table)))
    (unwind-protect
	(progn
	  (if voice-lock-syntax-table
	      (set-syntax-table voice-lock-syntax-table))
	  (while rest
	    (setq first (car rest) rest (cdr rest))
	    (goto-char start)
	    (cond ((consp first)
		   (setq str (car first))
		   (cond ((consp (cdr first))
			  (setq match (nth 1 first)
				personality (eval (nth 2 first))
				allow-overlap-p (nth 3 first)))
			 ((symbolp (cdr first))
			  (setq match 0 allow-overlap-p nil
				personality (eval (cdr first))))
			 (t
			  (setq match (cdr first)
				allow-overlap-p nil
				personality voice-lock-keyword-personality))))
		  (t
		   (setq str first match 0 allow-overlap-p nil
			 personality voice-lock-keyword-personality)))
	    ;(message "regexp: %s" str)
	    (while (re-search-forward str end t)
	      (setq s (match-beginning match)
		    e (match-end match))
	      (or s (error "expression did not match subexpression %d" match))
	      ;; don't voiceify this keyword if we're already in some other context.
	      (or (if allow-overlap-p nil (voice-lock-any-properties-p s e))
		  (if (not (memq allow-overlap-p '(t nil)))
		      (save-excursion
			(goto-char s)
			(while (< (point) e)
			  (let ((next (next-single-property-change (point) 'personality
								   nil e)))
			    (if (or (null next) (> next e))
				(setq next e))
			    (if (not (get-text-property (point) 'personality))
				(put-text-property (point) next 'personality personality))
			    (goto-char next))))
		    (put-text-property s e 'personality personality))))
	    (if loudly (message "Voiceifying %s... (regexps...%s)"
				(buffer-name)
				(make-string (setq count (1+ count)) ?.)))))
      (set-syntax-table old-syntax))
    (and (buffer-modified-p)
	 (not modified)
	 (set-buffer-modified-p nil))))

;; The user level functions

(defvar voice-lock-mode nil) ; for modeline
(or (assq 'voice-lock-mode minor-mode-alist)
    (setq minor-mode-alist
	  (append minor-mode-alist
		  '((voice-lock-mode " Voice")))))

(defvar voice-lock-voiceified nil) ; whether we have hacked this buffer
(put 'voice-lock-voiceified 'permanent-local t)

;;;###autoload
(defun voice-lock-mode (&optional arg)
  "Toggle Voice Lock mode.
With arg, turn Voice Lock mode on if and only if arg is positive.

When Voice Lock mode is enabled, text is voiceified as you type it:

 - comments are spoken in `voice-lock-comment-personality';
     (That is a variable whose value should be a personality name.)
 - strings are spoken in `voice-lock-string-personality';
 - documentation strings are spoken in `voice-lock-doc-string-personality';
 - function and variable names in their defining forms are spoken
   in `voice-lock-function-name-personality';
 - and certain other expressions are spoken in other personalitys
   according to the value of the variable `voice-lock-keywords'.

When you turn Voice Lock mode on/off, the buffer is voiceified/devoiceified.
To voiceify a buffer without having newly typed text become voiceified, you
can use \\[voice-lock-voiceify-buffer]."
  (interactive "P")
  (let ((on-p (if (null arg)
		  (not voice-lock-mode)
		(> (prefix-numeric-value arg) 0))))
    (if (equal (buffer-name) " *Compiler Input*") ; hack for bytecomp...
	(setq on-p nil))
    (make-local-variable 'after-change-functions)
    (if on-p
	(or (memq 'voice-lock-after-change-function after-change-functions)
	    (setq after-change-functions (cons 'voice-lock-after-change-function
					       after-change-functions)))
      (setq after-change-functions
	    (delq 'voice-lock-after-change-function
		  (copy-sequence after-change-functions))))
    (set (make-local-variable 'voice-lock-mode) on-p)
    (make-local-variable 'voice-lock-no-comments)
    (cond (on-p
	   (voice-lock-set-defaults)
	   (make-local-variable 'before-revert-hook)
	   (make-local-variable 'after-revert-hook)
	   ;; If buffer is reverted, must clean up the state.
	   (add-hook 'before-revert-hook 'voice-lock-revert-setup)
	   (add-hook 'after-revert-hook 'voice-lock-revert-cleanup)
	   (run-hooks 'voice-lock-mode-hook)
	   (or voice-lock-voiceified (voice-lock-voiceify-buffer)))
	  (voice-lock-voiceified
	   (setq voice-lock-voiceified nil)
	   (remove-hook 'before-revert-hook 'voice-lock-revert-setup)
	   (remove-hook 'after-revert-hook 'voice-lock-revert-cleanup)
	   (voice-lock-unvoiceify-region (point-min) (point-max))))
    (and  (interactive-p) 
          (message 
           (format "Turned %s voice lock mode. "
                   (if voice-lock-mode "on" "off" ))))
    (force-mode-line-update)))

;; If the buffer is about to be reverted, it won't be voiceified.
(defun voice-lock-revert-setup ()
  (setq voice-lock-voiceified nil))

;; If the buffer has just been reverted, we might not even be in voice-lock
;; mode anymore, and if we are, the buffer may or may not have already been
;; revoiceified.  Revoiceify here if it looks like we need to.
(defun voice-lock-revert-cleanup ()
  (and voice-lock-mode
       (not voice-lock-voiceified)
       (voice-lock-mode 1)))

(defun voice-lock-voiceify-buffer ()
  "Voiceify the current buffer the way `voice-lock-mode' would:

 - comments are spoken in `voice-lock-comment-personality';
 - strings are spoken in `voice-lock-string-personality';
 - documentation strings are spoken in `voice-lock-doc-string-personality';
 - function and variable names in their defining forms are spoken
   in `voice-lock-function-name-personality';
 - and certain other expressions are spoken in other personalitys
   according to the value of the variable `voice-lock-keywords'.

This can take a while for large buffers."
  (interactive)
  (let ((was-on voice-lock-mode)
	(voice-lock-verbose (or voice-lock-verbose (interactive-p))))
    (if voice-lock-verbose (message "Voiceifying %s..." (buffer-name)))
    ;; Turn it on to run hooks and get the right voice-lock-keywords.
    (or was-on (voice-lock-set-defaults))
    (voice-lock-unvoiceify-region (point-min) (point-max))
    (if (and voice-lock-verbose (not voice-lock-no-comments))
	(message "Voiceifying %s... (syntactically...)" (buffer-name)))
    (save-excursion
      (or voice-lock-no-comments
	  (voice-lock-voiceify-region (point-min) (point-max)))
      (if voice-lock-verbose (message "Voiceifying %s... (regexps...)"
				     (buffer-name)))
      (voice-lock-hack-keywords (point-min) (point-max) voice-lock-verbose))
    (set (make-local-variable 'voice-lock-voiceified) t)
    (if voice-lock-verbose (message "Voiceifying %s... done." (buffer-name)))
    ))


;;; Various mode-specific information.

(defconst lisp-voice-lock-keywords-1
 '(;;
   ;; highlight defining forms.  This doesn't work too nicely for
   ;; (defun (setf foo) ...) but it does work for (defvar foo) which
   ;; is more important.
   ("^(def[-a-z]+\\s +\\([^ \t\n\)]+\\)" 1 voice-lock-function-name-personality)
   ;;
   ;; highlight CL keywords
   ("\\s :\\(\\(\\sw\\|\\s_\\)+\\)\\>" . 1)
   ;;
   ;; this is highlights things like (def* (setf foo) (bar baz)), but may
   ;; be slower (I haven't really thought about it)
;   ("^(def[-a-z]+\\s +\\(\\s(\\S)*\\s)\\|\\S(\\S *\\)"
;    1 voice-lock-function-name-personality)
   )
 "For consideration as a value of `lisp-voice-lock-keywords'.
This does fairly subdued highlighting.")

(defconst lisp-voice-lock-keywords-2
  (append
   lisp-voice-lock-keywords-1
   '(;;
     ;; Highlight control structures
     ("(\\(cond\\|if\\|when\\|unless\\|[ec]?\\(type\\)?case\\)[ \t\n]" . 1)
     ("(\\(while\\|do\\|let\\*?\\|flet\\|labels\\|prog[nv12*]?\\)[ \t\n]" . 1)
     ("(\\(catch\\|\\throw\\|block\\|return\\|return-from\\)[ \t\n]" . 1)
     ("(\\(save-restriction\\|save-window-restriction\\)[ \t\n]" . 1)
     ("(\\(save-excursion\\|unwind-protect\\|condition-case\\)[ \t\n]" . 1)
     ;;
     ;; highlight function names in emacs-lisp docstrings (in the syntax
     ;; that substitute-command-keys understands.)
     ("\\\\\\\\\\[\\([^]\\\n]+\\)]" 1 voice-lock-keyword-personality t)
     ;;
     ;; highlight words inside `' which tend to be function names
     ("`\\([-a-zA-Z0-9_][-a-zA-Z0-9_][-a-zA-Z0-9_.]+\\)'"
      1 voice-lock-keyword-personality t)
     ))
 "For consideration as a value of `lisp-voice-lock-keywords'.
This does a lot more highlighting.")

;; default to the gaudier variety?
;(defvar lisp-voice-lock-keywords lisp-voice-lock-keywords-2
;  "Additional expressions to highlight in Lisp modes.")
(defvar lisp-voice-lock-keywords lisp-voice-lock-keywords-2
  "Additional expressions to highlight in Lisp modes.")


;(defvar   html-voice-lock-keywords
;'(
;  ("<[a-zA-Z0-9]+>" .  voice-lock-type-personality)
;("</[a-zA-Z0-9]+>" . voice-lock-type-personality)
;("&[a-zA-z0-9]+;" . voice-lock-keyword-personality))
;"Voice locking for HTML.
;HTML tags are spoken in a softer voice.
;HTML entities, e.g. &lt; are spoken in  a different voice.")


(defconst c-voice-lock-keywords-1 nil
 "For consideration as a value of `c-voice-lock-keywords'.
This does fairly subdued highlighting.")

(defconst c-voice-lock-keywords-2 nil
 "For consideration as a value of `c-voice-lock-keywords'.
This does a lot more highlighting.")

(defconst c++-voice-lock-keywords-1 nil
 "For consideration as a value of `c++-voice-lock-keywords'.
This does fairly subdued highlighting.")

(defconst c++-voice-lock-keywords-2 nil
 "For consideration as a value of `c++-voice-lock-keywords'.
This does a lot more highlighting.")

(let* ((storage "auto\\|extern\\|register\\|static\\|typedef")
       (struct "struct\\|union\\|enum")
       (prefixes "signed\\|unsigned\\|short\\|long")
       (types (concat prefixes "\\|int\\|char\\|float\\|double\\|String\\|String\\|void"))
       (ctoken "[a-zA-Z0-9_:~*]+")
       (c++-things (concat
		    "const\\|class\\|protected:\\|private:\\|public:\\|inline\\|"
		    "new\\|delete")))
 (setq c-voice-lock-keywords-1
  (list
   ;; voiceify preprocessor directives as comments.
   '("^#[ \t]*[a-z]+" . voice-lock-comment-personality)
   ;;
   ;; voiceify names being defined.
   '("^#[ \t]*\\(define\\|undef\\)[ \t]+\\(\\(\\sw\\|\\s_\\)+\\)" 2
     voice-lock-function-name-personality)
   ;;
   ;; voiceify other preprocessor lines.
   '("^#[ \t]*\\(if\\|elif\\|else\\|endif\\)[ \t]+\\([^\n]+\\)"
     2 voice-lock-function-name-personality keep)
   '("^#[ \t]*\\(ifn?def\\)[ \t]+\\([^ \t\n]+\\)"
     2 voice-lock-function-name-personality t)
   ;;
   ;; voiceify the filename in #include <...>
   ;; don't need to do this for #include "..." because those were
   ;; already voiceified as strings by the syntactic pass.
   '("^#[ \t]*include[ \t]+\\(<[^>\"\n]+>\\)" 1 voice-lock-string-personality)
   ;;
   ;; voiceify the names of functions being defined.
   (list (concat
	  "^\\(" ctoken "[ \t]+\\)?"	; type specs; there can be no
	  "\\(" ctoken "[ \t]+\\)?"	; more than 3 tokens, right?
	  "\\(" ctoken "[ \t]+\\)?"
	  "\\([*&]+[ \t]*\\)?"		; pointer
	  "\\(" ctoken "\\)[ \t]*(")		; name
    5 'voice-lock-function-name-personality)
   ;;
   ;;
   ;; Voiceify structure names (in structure definition form).
   (list (concat "^\\(" storage "\\)?[ \t]*\\<\\(" struct "\\)"
	  "[ \t]+\\(" ctoken "\\)[ \t]*\\(\{\\|$\\)")
    3 'voice-lock-function-name-personality)
   ;;
   ;; Voiceify declarations of simple identifiers (including typedefs).
   ;; (Should this be in c-voice-lock-keywords-2 instead?)
   (list (concat "^[ \t]*\\(\\(" storage "\\)[ \t]+\\)?\\(\\(\\(" prefixes
	  "\\)\\>[ \t]*\\)*\\(" types "\\)\\)[ \t]+\\(" ctoken
	  "\\)[ \t]*[=;]")
    7 'voice-lock-function-name-personality 'keep)
   ;;
   ;; And likewise for structs
   (list (concat "^[ \t]*\\(\\(" storage "\\)[ \t]+\\)?\\(" struct
	  "\\)[ \t]+" ctoken "[ \t]+\\(" ctoken "\\);")
    4 'voice-lock-function-name-personality 'keep)
   ;;
   ;; Voiceify case clauses.  This is fast because its anchored on the left.
   '("case[ \t]+\\(\\(\\sw\\|\\s_\\)+\\):". 1)
   '("\\<\\(default\\):". 1)
   ))

 (setq c-voice-lock-keywords-2
  (append c-voice-lock-keywords-1
   (list
    ;;
    ;; voiceify all storage classes and type specifiers
    (cons (concat "\\<\\(" storage "\\)\\>") 'voice-lock-type-personality)
    (cons (concat "\\<\\(" types "\\)\\>") 'voice-lock-type-personality)
    (cons (concat "\\<\\(\\(\\(" prefixes "\\)\\>[ \t]*\\)*\\(" types
	   "\\)\\)\\>")
     'voice-lock-type-personality)
    (list (concat "\\<\\(" struct "\\)[ \t]+" ctoken)
     0 'voice-lock-type-personality 'keep)
    ;;
    ;; voiceify all builtin tokens
    (cons (concat
	   "[ \t]\\("
	   (mapconcat 'identity
	    '("for" "while" "do" "return" "goto" "case" "break" "switch"
	      "if" "else" "default" "continue" "default")
	    "\\|")
	   "\\)[ \t\n(){};,]")
     1)
    ;;
    ;; voiceify case targets and goto-tags.  This is slow because the
    ;; expression is anchored on the right.
    '("[ \t\n]\\(\\(\\sw\\|\\s_\\)+\\):" . 1)
    ;;
    ;; Voiceify variables declared with structures, or typedef names.
    '("}[ \t*]*\\(\\(\\sw\\|\\s_\\)+\\)[ \t]*[,;]"
      1 voice-lock-function-name-personality)
    ;;
    ;; Voiceify global variables without a type.
;    '("^\\([_a-zA-Z0-9:~*]+\\)[ \t]*[[;={]" 1 voice-lock-function-name-personality)
    )))

 (setq c++-voice-lock-keywords-1
       (cons 
	(concat "\\(" c++-things "\\)[ \t\n]")
	c-voice-lock-keywords-1))
 (setq c++-voice-lock-keywords-2
       (cons 
	(cons (concat "\\<\\(" c++-things "\\)\\>") 'voice-lock-type-personality)
	c-voice-lock-keywords-2))
 )

; default to the gaudier variety?
(defvar c-voice-lock-keywords c-voice-lock-keywords-2
  "Additional expressions to highlight in C mode.")

(defvar c++-voice-lock-keywords c++-voice-lock-keywords-2
  "Additional expressions to highlight in C++ mode.")


(defvar perl-voice-lock-keywords
  (list
   (cons (concat "[ \n\t{]*\\("
		 (mapconcat 'identity
			    '("if" "until" "while" "elsif" "else" "unless" "for"
			      "foreach" "continue" "exit" "die" "last" "goto" "next"
			      "redo" "return" "local" "exec")
			    "\\|")
		 "\\)[ \n\t;(]") 1)
   (mapconcat 'identity
	      '("#endif" "#else" "#ifdef" "#ifndef" "#if" "#include"
		"#define" "#undef")
	      "\\|")
   '("^[ \n\t]*sub[ \t]+\\([^ \t{]+\\)[ \t]*[{]" 1 voice-lock-function-name-personality)
   '("[ \n\t{]*\\(eval\\)[ \n\t(;]" 1 voice-lock-function-name-personality)
   '("\\(--- .* ---\\|=== .* ===\\)" . voice-lock-doc-string-personality)
   )
  "Additional expressions to highlight in Perl mode.")


(defvar tcl-voice-lock-keywords nil
  "Keywords to highlight in tcl mode")

;;{{{  Snarfed from tcl.el /usr/local/lib/emacs/site-lisp/tcl.el

(defvar tcl-proc-list
  '("proc" "method" "itcl_class" "public" "protected")
  "List of commands whose first argument defines something.
This exists because some people (eg, me) use \"defvar\" et al. ")

(defvar tcl-proc-regexp
  (concat "^\\("
          (mapconcat 'identity tcl-proc-list "\\|")
          "\\)[ \t]+")
  "Regexp to use when matching proc headers.")

(defvar tcl-typeword-list
  '("global" "upvar")
  "List of Tcl keywords denoting \"type\".  Used only for highlighting. ")

;; Generally I've picked control operators to be keywords.
(defvar tcl-keyword-list
  '("if" "then" "else" "elseif" "for" "foreach" "break" "continue" "while"
    "set" "eval" "case" "in" "switch" "default" "exit" "error" "proc" "return"
    "uplevel" "loop" "for_array_keys" "for_recursive_glob" "for_file"
    "unwind_protect" 
    ;; itcl
    "method" "itcl_class" )
  "List of Tcl keywords.  Used only for highlighting.
Default list includes some TclX keywords. ")

;; FIXME need some way to recognize variables because array refs look
;; like 2 sexps.
(defvar tcl-type-alist
  '(
    ("expr" tcl-expr)
    ("catch" tcl-commands)
    ("set" tcl-expr)
    ("if" tcl-expr "then" tcl-commands)
    ("elseif" tcl-expr "then" tcl-commands)
    ("elseif" tcl-expr tcl-commands)
    ("if" tcl-expr tcl-commands)
    ("while" tcl-expr tcl-commands)
    ("for" tcl-commands tcl-expr tcl-commands tcl-commands)
    ("foreach" nil nil tcl-commands)
    ("for_file" nil nil tcl-commands)
    ("for_array_keys" nil nil tcl-commands)
    ("for_recursive_glob" nil nil nil tcl-commands)
    ;; Loop handling is not perfect, because the third argument can be
    ;; either a command or an expr, and there is no real way to look
    ;; forward.
    ("loop" nil tcl-expr tcl-expr tcl-commands)
    ("loop" nil tcl-expr tcl-commands)
    )
  "Alist that controls indentation.
\(Actually, this really only controls what happens on continuation lines).
Each entry looks like `(KEYWORD TYPE ...)'.
Each type entry describes a sexp after the keyword, and can be one of:
* nil, meaning that this sexp has no particular type.
* tcl-expr, meaning that this sexp is an arithmetic expression.
* tcl-commands, meaning that this sexp holds Tcl commands.
* a string, which must exactly match the string at the corresponding
  position for a match to be made.

For example, the entry for the \"loop\" command is:

   (\"loop\" nil tcl-expr tcl-commands)

This means that the \"loop\" command has three arguments.  The first
argument is ignored (for indentation purposes).  The second argument
is a Tcl expression, and the last argument is Tcl commands.")

(setq tcl-voice-lock-keywords
      (list
	 ;; Names of functions (and other "defining things").
	 (list (concat tcl-proc-regexp "\\([^ \t\n]+\\)")
	       2 'voice-lock-function-name-personality)

	 ;; Names of type-defining things.
	 (list (concat "\\(\\s-\\|^\\)\\("
		       ;; FIXME Use 'regexp-quote?
		       (mapconcat 'identity tcl-typeword-list "\\|")
		       "\\)\\(\\s-\\|$\\)")
	       2 'voice-lock-type-personality)

	 ;; Keywords.  Only recognized if surrounded by whitespace.
	 ;; FIXME consider using "not word or symbol", not
	 ;; "whitespace".
	 (cons (concat "\\(\\s-\\|^\\)\\("
		       ;; FIXME Use regexp-quote? 
		       (mapconcat 'identity tcl-keyword-list "\\|")
		       "\\)\\(\\s-\\|$\\)")
	       2)
	 )
)
;;}}}



(defvar tex-voice-lock-keywords
  (list
   '("\\(\\\\\\([a-zA-Z@]+\\|.\\)\\)" 1 voice-lock-keyword-personality t)
   '("{\\\\em\\([^}]+\\)}" 1 voice-lock-comment-personality t)
   '("{\\\\bf\\([^}]+\\)}" 1 voice-lock-keyword-personality t)
   '("^[ \t\n]*\\\\def[\\\\@]\\(\\w+\\)" 1 voice-lock-function-name-personality t)
   '("\\\\\\(begin\\|end\\){\\([a-zA-Z0-9\\*]+\\)}"
     2 voice-lock-function-name-personality t)
   '("[^\\\\]\\$\\([^$]*\\)\\$" 1 voice-lock-string-personality t)
;   '("\\$\\([^$]*\\)\\$" 1 voice-lock-string-personality t)
   )
  "Additional expressions to highlight in TeX mode.")

(defvar texi-voice-lock-keywords
  (list
   "@\\(@\\|[^}\t \n{]+\\)"					;commands
   '("^\\(@c\\|@comment\\)[ \t].*$" . voice-lock-comment-personality)	;comments
   '("^\\(*.*\\)[\t ]*$" 1 voice-lock-function-name-personality t)	;menu items
   '("@\\(emph\\|strong\\|b\\|i\\){\\([^}]+\\)" 2 voice-lock-comment-personality t)
   '("@\\(file\\|kbd\\|key\\){\\([^}]+\\)" 2 voice-lock-string-personality t)
   '("@\\(samp\\|code\\|var\\){\\([^}]+\\)" 2 voice-lock-function-name-personality t)
   '("@\\(xref\\|pxref\\){\\([^}]+\\)" 2 voice-lock-keyword-personality t)
   '("@end *\\([a-zA-Z0-9]+\\)[ \t]*$" 1 voice-lock-function-name-personality t)
   '("@item \\(.*\\)$" 1 voice-lock-function-name-personality t)
   '("\\$\\([^$]*\\)\\$" 1 voice-lock-string-personality t)
   )
  "Additional expressions to highlight in TeXinfo mode.")

(defvar shell-voice-lock-keywords
  (list (cons shell-prompt-pattern 'voice-lock-keyword-personality)
	'("[ \t]\\([+-][^ \t\n]+\\)" 1 voice-lock-comment-personality)
	'("^[^ \t]+:.*$" . voice-lock-string-personality)
	'("^\\[[1-9][0-9]*\\]" . voice-lock-string-personality))
  "Additional expressions to highlight in Shell mode.")

(defvar dired-voice-lock-keywords
  '(;; Put directory headers in italics.
    ("^  \\(/.+\\)$" 1 voice-lock-type-personality)
    ;; Put symlinks in bold italics.
    ("\\([^ ]+\\) -> [^ ]+$" . voice-lock-function-name-personality)
    ;; Put marks (entire line) in bold.
    ("^\\([^ ]\\).*$" .  voice-lock-comment-personality)
    ;; Put files that are subdirectories in bold.
    ("^..d.* \\([^ ]+\\)$" . voice-lock-keyword-personality))
  "Additional expressions to highlight in Dired mode.")

(defvar rmail-voice-lock-keywords
  '(;; Put From field in bold.
    ("^From: \\(.*\\)$" 1 voice-lock-keyword-personality)
    ;; Put subject in bold italics
    ("^Subject: \\(.*\\)$" 1 voice-lock-function-name-personality))
  "Additional expressions to highlight in Rmail mode.")

(defvar rmail-summary-voice-lock-keywords
  '(("^\\s *[0-9]+D.*$" . voice-lock-doc-string-personality)
    ("^\\s *[0-9]+-.*$" . voice-lock-keyword-personality))
  "Additional expressions to highlight in Rmail Summary mode.")

(defvar vm-voice-lock-keywords nil
  "Keywords to highlight in vm")

(defvar vm-summary-voice-lock-keywords
  "Additional expressions to highlight in vm  Summary mode.")


(defvar compilation-mode-voice-lock-keywords
  '(("^\\([^\n:]*:\\([0-9]+:\\)+\\)\\(.*\\)$" 1 voice-lock-function-name-personality))
;;;  ("^\\([^\n:]*:\\([0-9]+:\\)+\\)\\(.*\\)$" 0 voice-lock-keyword-personality keep)
  "Additional expressions to highlight in Compilation mode.")

(defun voice-lock-set-defaults ()
  "Set `voice-lock-keywords' to something appropriate for this mode."
  (if (memq major-mode '(rmail-mode dired-mode compilation-mode shell-mode))
      (setq voice-lock-no-comments t))
  (if (not voice-lock-keywords)		; if not already set.
      (setq voice-lock-keywords
	    (cond ((eq major-mode 'lisp-mode)	    lisp-voice-lock-keywords)
		  ((eq major-mode 'emacs-lisp-mode) lisp-voice-lock-keywords)
                  ;((eq major-mode 'html-helper-mode) html-voice-lock-keywords)
		  ((eq major-mode 'c-mode)
		   (make-local-variable 'voice-lock-syntax-table)
		   (setq voice-lock-syntax-table
			 (copy-syntax-table (syntax-table)))
		   (modify-syntax-entry ?_ "w" voice-lock-syntax-table)
		   c-voice-lock-keywords)
		  ((eq major-mode 'c++-c-mode)
		   (make-local-variable 'voice-lock-syntax-table)
		   (setq voice-lock-syntax-table
			 (copy-syntax-table (syntax-table)))
		   (modify-syntax-entry ?_ "w" voice-lock-syntax-table)
		   c-voice-lock-keywords)
		  ((eq major-mode 'c++-mode)	    c++-voice-lock-keywords)
		  ((eq major-mode 'perl-mode) 	    perl-voice-lock-keywords)
                  ((eq major-mode' tcl-mode) 	    tcl-voice-lock-keywords)
		  ((eq major-mode 'plain-tex-mode)  tex-voice-lock-keywords)
		  ((eq major-mode 'latex-mode)      tex-voice-lock-keywords)
		  ((eq major-mode 'slitex-mode)     tex-voice-lock-keywords)
		  ((eq major-mode 'latex2e-mode)    tex-voice-lock-keywords)
                  ((eq major-mode 'texinfo-mode)    texi-voice-lock-keywords)
		  ((eq major-mode 'shell-mode)      shell-voice-lock-keywords)
		  ((eq major-mode 'dired-mode)      dired-voice-lock-keywords)
		  ((eq major-mode 'rmail-mode)      rmail-voice-lock-keywords)
		  ((eq major-mode 'rmail-summary-mode)
		   rmail-summary-voice-lock-keywords)
                  		  ((eq major-mode 'vm-mode)      vm-voice-lock-keywords)
		  ((eq major-mode 'vm-summary-mode)
		   vm-summary-voice-lock-keywords)
		  ((eq major-mode 'compilation-mode)
		   compilation-mode-voice-lock-keywords)
		  (t nil)))))

(provide 'voice-lock)

;;; voice-lock.el ends here
