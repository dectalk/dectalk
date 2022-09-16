;;; $Id: emacspeak-dired.el,v 3.21 1995/09/19 13:40:08 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extension to speech enable dired 
;;; Keywords: Emacspeak, Dired, Spoken Output
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
(require 'voice-lock)
(eval-when (compile) (require 'dired))
(require 'dtk-speak)
(require 'emacspeak-speak)
(require 'emacspeak-sounds)
;;{{{  Introduction:

;;; This module speech enables dired.
;;; It reduces the amount of speech you hear:
;;; Typically you hear the file names as you move through the dired buffer
;;; Voicification is used to indicate directories, marked files etc. 

;;}}}
;;{{{  functions:

(defun emacspeak-dired-speak-line ()
  "Speak the dired line intelligently. "
  (let ((filename (dired-get-filename t t ))
        (personality (get-text-property (point) 'personality)))
     (cond
      (filename
         (put-text-property  0  (length filename)
                             'personality personality filename )
         (dtk-speak filename))
       (t (emacspeak-speak-line )))))

;;}}}
;;{{{  advice:

(defadvice dired (after emacspeak pre act)
"Produce an auditory icon. "
(when (interactive-p)
(voice-lock-mode 1)
(emacspeak-dired-label-fields)
(emacspeak-auditory-icon 'open-object )))

(defadvice dired-next-line (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

(defadvice dired-previous-line (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

(defadvice dired-next-marked-file (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

(defadvice dired-prev-marked-file  (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))
(defadvice dired-prev-subdir (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

(defadvice dired-next-subdir (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

(defadvice dired-mark (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line))
  )

(defadvice dired-flag-file-deletion (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line))
  )

(defadvice dired-next-dirline (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line))
  )

(defadvice dired-prev-dirline (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line))
  )

(defadvice dired-unmark-backward (after emacspeak pre act)
  "Speak the filename name"
  (when (interactive-p )
    (emacspeak-dired-speak-line)))

;;; Producing auditory icons:
;;; These dired commands do some action that causes a state change:
;;; e.g. marking a file, and then change
;;; the current selection, ie
;;; move to the next line:
;;; We speak the line moved to, and indicate the state change
;;; with an auditory icon. 

(defadvice dired-mark (after emacspeak pre act) 
"Produce an auditory icon. "
(when (interactive-p)
(emacspeak-auditory-icon 'mark-object )
(emacspeak-dired-speak-line)))

(defadvice dired-flag-file-deletion (after emacspeak pre act )
"Produce an auditory icon indicating 
that a file was marked for deletion. "
(when (interactive-p )
(emacspeak-auditory-icon 'delete-object )
(emacspeak-dired-speak-line )))

(defadvice dired-unmark (after emacspeak pre act)
  "Give speech feedback.
Also provide an auditory icon."
  (when (interactive-p)
    (emacspeak-auditory-icon 'deselect-object )
    (emacspeak-dired-speak-line)))

;;}}}
;;{{{  labeling fields in the dired buffer:

(defun emacspeak-dired-label-fields-on-current-line ()
  "Labels the fields on a dired line.
Assumes that dired-listing-switches contains  -al"
  (let ((start nil)
        (fields (list "permissions"
                      "links"
                      "owner"
                      "group"
                      "size"
                      "modified in"
                      "modified on"
                      "modified at"
                      "name")))
    (save-excursion
      (beginning-of-line)
      (skip-syntax-forward " ")
      (while (and fields
                  (not (eolp)))
        (setq start (point))
        (skip-syntax-forward "^ ")
        (put-text-property start (point)
                           'field-name (car fields ))
        (setq fields (cdr fields ))
        (skip-syntax-forward " ")))))

(defun emacspeak-dired-label-fields ()
  "Labels the fields of the listing in the dired buffer.
Currently is a no-op  unless
unless dired-listing-switches contains -al"
  (interactive)
  (declare (special dired-listing-switches))
  (when (save-match-data
          (string-match  "al" dired-listing-switches))
    (let ((read-only buffer-read-only))
      (unwind-protect
          (progn
            (setq buffer-read-only nil)
            (save-excursion
              (goto-char (point-min))
              (dired-goto-next-nontrivial-file)
              (while (not (eobp))
                (emacspeak-dired-label-fields-on-current-line )
                (forward-line 1 ))))
        (setq buffer-read-only read-only )))))

;;}}}
;;{{{  keys

(add-hook 'dired-mode-hook
          (function (lambda ()
                      (declare (special dired-mode-map ))
                      (define-key dired-mode-map "\C-i"
                        'emacspeak-speak-next-field)
                      (define-key dired-mode-map  "," 'emacspeak-speak-previous-field)
                      (define-key dired-mode-map '[up] 'dired-previous-line)
                      (define-key dired-mode-map '[down] 'dired-next-line))))

;;}}}
(provide 'emacspeak-dired)
;;{{{ emacs local variables

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
