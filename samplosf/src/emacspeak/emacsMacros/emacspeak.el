;;; $Id: emacspeak.el,v 3.75 1995/09/16 21:08:12 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak: A speech interface to Emacs
;;; Keywords: Emacspeak, Speech, Dectalk,
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
(require 'advice)
(eval-when (compile)
  (require 'dtk-speak)
  (require 'emacspeak-fix-interactive)
  (require 'emacspeak-speak)
  (require 'emacspeak-keymap))


;;{{{  Introduction:
;;; This is the main emacspeak module.
;;; It actually does very little:
;;; It loads the various parts of the system. 

;;}}}

;;{{{  Setting up things: 

(defconst emacspeak-version
  (let ((x "$Revision: 12$"))
    (string-match "[0-9.]+" x)
    (substring x (match-beginning 0)
               (match-end 0)))
  "Version number for Emacspeak. ")

(defvar emacspeak-startup-hook nil
  "Hook to run after starting emacspeak" )

;;}}}
;;{{{  Function Emacspeak: Starts up Emacspeak

(defvar emacspeak-emacs-commands-to-fix 
  '(locate-library
    insert-file
    point-to-register
    find-file-other-window
    switch-to-buffer-other-window
    jump-to-register
    describe-key
    find-file-read-only-other-window
    dtk-set-rate
    cd
    goto-line
    load-file
    window-configuration-to-register
    load-library
    view-register
    prepend-to-register
    describe-key-briefly
    append-to-register
    byte-recompile-directory
    copy-to-register
    command-apropos
    insert-register
    append-to-file
    read-abbrev-file
    copy-rectangle-to-register
    make-obsolete
    zap-to-char
    prepend-to-buffer
    dtk-set-character-scale
    set-visited-file-name
    ad-compile-function
    find-file
    find-file-read-only
    copy-to-buffer)
  "Precomputed list of interactive functions that have to be fixed.
Precomputing this saves time at start-up.")


(defun emacspeak()
  "Starts the Emacspeak speech subsystem.  Use emacs as you normally would,
emacspeak will provide you spoken feedback as you work.  Emacspeak also
provides commands for having parts of the current buffer, the mode-line etc to
be spoken.

If you are hearing this description as a result of pressing
\\[emacspeak-describe-emacspeak] you may want to press \\[dtk-stop] to stop
speech, and then use the arrow keys to move around in the Help buffer
  to   read the rest of this description, which
includes a summary of all emacspeak keybindings.

All emacspeak commands use \\[emacspeak-prefix-command] as a prefix key.  You
can also set the state of the Dectalk by using
\\[emacspeak-dtk-submap-command] as a prefix.  Here is a summary of all
emacspeak commands along with their bindings.  You need to precede the
keystrokes listed below with \\[emacspeak-prefix-command].

Emacspeak also provides a fluent speech extension to the emacs
 terminal emulator (eterm).
Note: You need to use the eterm package that comes with emacs-19.29.

\\{emacspeak-keymap}

See the online documentation for individual commands and functions for
 details. There is an info manual for Emacspeak, but it is still
 preliminary. The source code documentation is up-to-date, please use it.  "
  
  (interactive)
  (declare (special dtk-drivers-alist dtk-driver-prefix
 emacspeak-emacs-commands-to-fix))
  (let ((driver-flag nil ))
    (load-library "dtk-speak")
    (dtk-initialize)
    (when driver-flag
      (dtk-speak
       "Make sure you  set the environment variable DTK_PROGRAM next time!"))
    (load-library "emacspeak-advice")
    (load-library "emacspeak-fix-interactive")
    (load-library "emacspeak-redefine")
    (load-library "emacspeak-replace")
    (load-library "emacspeak-keymap")
    (autoload 'voice-lock-mode "voice-lock" t "voice lock mode")
    (autoload 'emacspeak-toggle-auditory-icons "emacspeak-sounds"
      "Ask emacspeak to use auditory icons" t)
    (autoload 'emacspeak-tabulate-region "emacspeak-tabulate" 
      "Identify columns in the region."  t)
    (add-hook 'term-load-hook (function (lambda () (require 'emacspeak-eterm ))))
    (add-hook 'vm-mode-hook (function (lambda () (require 'emacspeak-vm ))))
    (add-hook 'w3-load-hooks (function (lambda () (require 'emacspeak-w3 ))))
    (add-hook 'calendar-load-hook
              (function (lambda () (require 'emacspeak-calendar ))) t)
    (add-hook 'gnus-startup-hook (function (lambda () (require 'emacspeak-gnus))))
    (add-hook 'dired-load-hook '(lambda () (require 'emacspeak-dired )) t)
    (run-hooks 'emacspeak-startup-hook)
    (mapcar 'emacspeak-fix-interactive-command-if-necessary 
emacspeak-emacs-commands-to-fix)
    (emacspeak-dtk-sync)
    (message  (format "  Press %s to get an   overview of emacspeak  %s. \
 I am  completely operational,  and all my \
circuits are functioning perfectly! "
                      (substitute-command-keys
                       "\\[emacspeak-describe-emacspeak]" )
                      emacspeak-version))))

(defun emacspeak-describe-emacspeak ()
  "Give a brief overview of emacspeak. "
  (interactive)
  (describe-function 'emacspeak)
  (switch-to-buffer "*Help*")
  (dtk-set-punctuations "all")
  (emacspeak-speak-buffer))

;;}}}
;;{{{  Advice for Emacs subsystems:

;;{{{  Outline mode

(defadvice outline-mode (after emacspeak pre act comp)
  "Make sure emacspeak extensions are loaded."
  (require 'emacspeak-outline))

(defadvice outline-minor-mode (after emacspeak pre act comp)
  "Make sure emacspeak extensions are loaded."
  (require 'emacspeak-outline))

;;}}}

;;{{{  hyperbole:

(defadvice hyperbole (before emacspeak pre act )
  "Make sure emacspeak extensions are loaded."
(require 'emacspeak-hyperbole)
(require 'emacspeak-wrolo))

;;; Entry points to rolodex via hyperbole:
;'(rolo-add 
;rolo-display-matches 
;rolo-edit 
;rolo-kill 
;rolo-sort 
;rolo-grep 
;rolo-fgrep 
;rolo-word 
;rolo-yank)

;;}}}
;;{{{ kotl

(defadvice kotl-mode (before emacspeak pre act )
  "Ensure emacspeak extensions are loaded"
  (require 'emacspeak-kotl))

;;}}}
;;; Emacspeak provides speech extensions for several Emacs subsystems.
;;; Many of these are loaded via load-hooks provided by those subsystems,
;;; See function emacspeak.
;;; For those packages that do not provide such load-hooks,
;;; We will advice their entry points to require the Emacspeak extensions.

;;{{{  emacspeak-ispell 

(defadvice ispell-buffer (before emacspeak-load activate)
  "Load Emacspeak-ispell if not already loaded."
  (require 'emacspeak-ispell))

(defadvice ispell-region (before emacspeak-load activate)
  "Load Emacspeak-ispell if not already loaded."
  (require 'emacspeak-ispell))

(defadvice ispell-word (before emacspeak-load activate)
  "Load Emacspeak-ispell if not already loaded."
  (require 'emacspeak-ispell))

;;}}}

;;{{{ emacspeak-info

(defadvice info (before emacspeak-load activate)
"Load emacspeak extension for Info mode."
(require 'emacspeak-info))

;;}}}

;;{{{  emacspeak-compile

(defadvice compile (before emacspeak-load activate)
  "Load emacspeak-compile if not already loaded."
  (require 'emacspeak-compile))

;;}}}
;;{{{  calc:

(defadvice calc-dispatch (after emacspeak activate)
  (require 'emacspeak-calc))

;;}}}
;;{{{ folding:

(defadvice folding-mode (after emacspeak activate)
"Load emacspeak folding extension. "
(require 'emacspeak-folding))

;;}}}
;;{{{  C mode: c-mode and cc-mode 

(add-hook 'c-mode-hook 
(function (lambda ()
(require 'emacspeak-c))))


(add-hook 'c-mode-common-hook 
(function (lambda ()
(require 'emacspeak-c))))
;;}}}

;;{{{ Auctex: 

(defadvice tex-mode (after emacspeak activate)
"Make sure emacspeak extensions loaded."
(require 'emacspeak-auctex))

;;}}}

;;{{{  html-helper-mode

(add-hook 'html-helper-load-hook
          (function (lambda ()
                      (require 'emacspeak-tempo ))))

;;}}}

;;{{{ w3:

;;; advice all entry points: 
(defadvice w3 (before emacspeak activate )
  (require 'emacspeak-w3))

(defadvice w3-fetch (before emacspeak activate )
  (require 'emacspeak-w3))

(defadvice w3-open-local (before emacspeak activate )
  (require 'emacspeak-w3))
;;}}}

;;{{{ perl:
(defadvice perl-mode (after emacspeak pre act comp)
  "Make sure emacspeak extensions are present."
  (require 'emacspeak-perl))

;;}}}

;;{{{  tcl-mode

(defadvice tcl-mode (after emacspeak pre act comp)
  "Load emacpseak extensions"
  (require 'emacspeak-tcl))

(defadvice inferior-tcl (after emacspeak pre act comp)
  "Ensure emacspeak extensions are present."
  (require 'emacspeak-tcl))

;;}}}
;;{{{  ielm: inferior elisp

(defadvice ielm (after emacspeak pre act)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-fix-interactive-command-if-necessary 'ielm-change-working-buffer)
    (message "Welcome to the inferior elisp buffer.")))

;;}}}



(defadvice oobr ( after emacspeak pre act )
  "Load emacspeak extensions."
  (require 'emacspeak-oo-browser ))

;;{{{ ediff:
(add-hook 'ediff-load-hooks
          (function (lambda ()(require 'emacspeak-ediff ))))

;;}}}
;;{{{  bbdb 

(add-hook 'bbdb-load-hook
          (function (lambda ()
                      (require 'emacspeak-bbdb ))))
;;}}} 
;;{{{ dmacro

(defadvice insert-dmacro (before emacspeak-load pre act )
  "Ensure emacspeak extension is loaded"
  (require 'emacspeak-dmacro))

;;}}}
;;{{{  voice locking for html

       (add-hook 'html-helper-load-hook
                 (function (lambda ()
                             (load "html-voice"))))

;;}}}
;;}}}
;;{{{  Submit bugs

(defconst emacspeak-bug-address
  "raman@crl.dec.com"
  "Address of the maintainer of this package. ")


(defun emacspeak-submit-bug ()
  "Function to submit a bug to the programs maintainer"
  (interactive)
  (require 'reporter)
  (when
      (yes-or-no-p "Are you sure you want to submit a bug report? ")
    (let (
          (vars '(window-system
                  window-system-version
                  emacs-version
                  system-type
                  emacspeak-version dtk-tcl 
                  dtk-speech-rate dtk-character-scale
                  dtk-split-caps dtk-capitalize
                  dtk-punctuation-mode
                  emacspeak-line-echo  emacspeak-word-echo
                  emacspeak-character-echo
                  emacspeak-audio-indentation )))
      (mapcar
       (function
        (lambda (x)
          (if (not (and (boundp x) (symbol-value x)))
              (setq vars (delq x vars))))) vars)
      (reporter-submit-bug-report  emacspeak-bug-address 
                                   (concat "Emacspeak Version: " emacspeak-version )
                                   vars
                                   nil nil
                                   "Description of Problem:"))))

;;}}}

(provide 'emacspeak)
;;{{{ end of file 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
