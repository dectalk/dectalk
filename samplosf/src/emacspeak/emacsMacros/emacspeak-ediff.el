;;; $Id: emacspeak-ediff.el,v 1.11 1995/09/08 19:45:52 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for ediff
;;; Keywords:emacspeak, audio interface to emacs, Comparing files 
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
(require 'emacspeak-fix-interactive)
(require 'voice-lock)
(eval-when (compile)
  (require 'ediff))
;;{{{  Introduction:

;;;Ediff provides a nice visual interface to diff.
;;;Comparing and patching files is easy with ediff when you can see the screen.
;;;This module provides Emacspeak extensions to work fluently
;;;with ediff. Try it out, it's an excellent example of why Emacspeak is better
;;;than a traditional screenreader.

;;}}}
 ;;{{{  Mapping faces to personalities:

;;; we use the same personality for odd and even differences:
(defvar emacspeak-ediff-even-diff-face-A-var
  'paul-smooth
  "Personality  used to aurally highlight
even-numbered differences in buffer A.")

(defvar emacspeak-ediff-odd-diff-face-A-var
  'paul-smooth
  "Personality  used to aurally highlight
odd-numbered differences in buffer B.")

(defvar emacspeak-ediff-even-diff-face-B-var
  'paul-monotone 
  "Personality  used to aurally highlight
even-numbered differences in buffer B.")

(defvar emacspeak-ediff-odd-diff-face-B-var
  'paul-monotone
  "Personality  used to aurally highlight odd-numbered differences in buffer B.")


(defvar emacspeak-ediff-current-diff-face-A
    'harry 
    "Personality for aurally  highlighting the selected difference in buffer A.")

(defvar emacspeak-ediff-current-diff-face-B
    'ursula 
    "Personality for aurally  highlighting the selected difference in buffer
A.")

(defvar emacspeak-ediff-fine-diff-face-A
  'harry
  "Face for highlighting the refinement of the selected diff in buffer A.")

(defvar emacspeak-ediff-fine-diff-face-B
  'harry
  "Face for highlighting the refinement of the selected diff in buffer B.")

;;}}}
;;{{{ Helper functions:

(defsubst emacspeak-ediff-control-panel () (get-buffer "Ediff Control Panel"))
         

(defsubst emacspeak-ediff-get-difference (n)
  (declare (special ediff-difference-vector
                    ediff-number-of-differences))
  (assert (< n ediff-number-of-differences) t
          "There are only %s differences"
          ediff-number-of-differences)
  (aref ediff-difference-vector n ))

;;; A difference is a vector of four elements:
(defsubst emacspeak-ediff-difference-a-diff (difference) (aref difference 0))
(defsubst emacspeak-ediff-difference-b-diff (difference) (aref difference 1))
(defsubst emacspeak-ediff-difference-fine-diff   (difference)
  (aref difference 2))

(defsubst emacspeak-ediff-get-fine-difference (n)
  (declare (special ediff-difference-vector
                    ediff-number-of-differences))
  (assert (< n ediff-number-of-differences) t
          "There are only %s differences"
          ediff-number-of-differences)
  (aref (emacspeak-ediff-get-difference n)2  ))

;;}}}
;;{{{  Function: Voicify  ediff overlays:

(defun emacspeak-ediff-voicify-overlay  (overlay &optional personality)
  "Voicifies an overlay produced by ediff.
This is ediff specific only in that we
use the personality corresponding to an ediff face to voicify.
 If personality is explicitly supplied it is used."
  (let ((buffer (overlay-buffer overlay ))
        (face (overlay-get overlay 'face ))
        (start (overlay-start overlay))
        (end (overlay-end overlay )))
    (cond
     (personality)
     (t (and face
             (setq personality
                   (eval (intern (concat "emacspeak-"
                                         (symbol-name face ))))))))
    (save-excursion
      (set-buffer buffer )
      (let ((read-only buffer-read-only)
            (before-change-function nil)
            (after-change-function nil)
            (modified-flag (buffer-modified-p)))
        (unwind-protect
            (progn
              (setq buffer-read-only nil)
              (put-text-property start end
                                 'personality personality))
          (set-buffer-modified-p modified-flag)
          (setq buffer-read-only read-only ))))))

(defun emacspeak-ediff-voicify-differences  ()
  "Voicify all the difference chunks"
  (declare (special ediff-number-of-differences ))
  (let ((counter 0)
        (difference nil)
        (control-panel (emacspeak-ediff-control-panel)))
    (and control-panel
         (save-excursion
           (set-buffer control-panel )
           (while (< counter ediff-number-of-differences )
             (setq difference
                   (emacspeak-ediff-get-difference counter))
             (emacspeak-ediff-voicify-overlay
              (emacspeak-ediff-difference-a-diff difference ))
             (emacspeak-ediff-voicify-overlay
              (emacspeak-ediff-difference-b-diff difference ))
             (incf counter ))
           (message "Voicified differences")))))

(defun emacspeak-ediff-voicify-fine-differences  ()
  "Voicify all the fine difference chunks"
  (declare (special ediff-number-of-differences
                    before-change-function after-change-function))
  (let ((counter 0)
        (difference nil)
        (control-panel (emacspeak-ediff-control-panel)))
    (and control-panel
         (save-excursion
           (set-buffer control-panel )
           (let ((before-change-function nil)
                 (after-change-function nil))
           (while (< counter ediff-number-of-differences )
             (setq difference
                   (emacspeak-ediff-get-fine-difference counter))
             (when difference 
               (mapcar
                (function
                 (lambda (diff)
                   (emacspeak-ediff-voicify-overlay
                    (emacspeak-ediff-difference-a-diff  diff )
                    emacspeak-ediff-fine-diff-face-A)
                   (emacspeak-ediff-voicify-overlay
                    (emacspeak-ediff-difference-b-diff diff )
                    emacspeak-ediff-fine-diff-face-B)))
                difference ))
             (incf counter ))
           (message "Voicified fine differences "))))))

(defun emacspeak-ediff-voicify-current-difference ()
  "Voicify current difference"
  (declare (special ediff-current-difference))
  (let ((difference (emacspeak-ediff-get-difference ediff-current-difference ))
        (control-panel (emacspeak-ediff-control-panel)))
    (and control-panel
         (save-excursion
           (set-buffer control-panel)
           (emacspeak-ediff-voicify-overlay
            (emacspeak-ediff-difference-a-diff difference))
           (emacspeak-ediff-voicify-overlay
            (emacspeak-ediff-difference-b-diff difference ))))))

(defun emacspeak-ediff-voicify-current-fine-difference ()
  "Voicify current fine difference"
  (declare (special ediff-current-difference))
  (let ((difference (emacspeak-ediff-get-fine-difference ediff-current-difference ))
        (control-panel (emacspeak-ediff-control-panel)))
    (and control-panel
         (save-excursion
           (set-buffer control-panel)
           (let ((before-change-function nil)
                 (after-change-function nil ))
           (mapcar
            (function (lambda (diff)
                        (emacspeak-ediff-voicify-overlay
                         (emacspeak-ediff-difference-a-diff diff)
                         emacspeak-ediff-fine-diff-face-A)
                        (emacspeak-ediff-voicify-overlay
                         (emacspeak-ediff-difference-b-diff diff )
                         emacspeak-ediff-fine-diff-face-B)))
            difference ))))))

(add-hook 'ediff-before-setup-windows-hooks
          (function (lambda ()
                      (declare (special ediff-mode-map ))
                      (save-excursion
                        (set-buffer (emacspeak-ediff-control-panel))
                        (voice-lock-mode 1 ))
                      (define-key ediff-mode-map "." 'emacspeak-ediff-speak-current-difference)
                      (emacspeak-ediff-voicify-differences))))

;;}}}
;;{{{  Speak an ediff difference:

;;; To speak an ediff difference,
;;; First announce difference a and speak it.
;;; If you see keyboard activity, shut up
;;; and offer to speak difference b.


(defun emacspeak-ediff-speak-difference (difference)
  "Speak a difference chunk"
  (let ((a-diff (emacspeak-ediff-difference-a-diff difference ))
        (b-diff (emacspeak-ediff-difference-b-diff  difference ))
        (key ""))
    (emacspeak-auditory-icon 'select-object)
    (dtk-speak
     (concat
      "Difference ai "
      (emacspeak-overlay-get-text  a-diff)))
    (let ((dtk-stop-immediately nil ))
      (sit-for 2)
      (setq key 
            (read-key-sequence "Press any key to continue" )))
    (unless    (=  7  (string-to-char key ))
      (dtk-stop)
      (dtk-speak
       (concat
        "Difference  B  "
        (emacspeak-overlay-get-text b-diff ))))))

(defun emacspeak-ediff-speak-current-difference ()
  "Speak the current difference"
  (interactive)
  (declare (special ediff-current-difference ))
  (emacspeak-ediff-speak-difference
   (emacspeak-ediff-get-difference ediff-current-difference)))

;;}}}
;;{{{ Advice:

(emacspeak-fix-interactive-command-if-necessary 'vc-ediff)

(defadvice ediff-next-difference (after emacspeak pre act comp)
  "Speak the difference interactively."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-ediff-speak-current-difference)))

(defadvice ediff-previous-difference (after emacspeak pre act comp)
  "Speak the difference interactively."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-ediff-speak-current-difference)))

(defadvice ediff-make-fine-diffs (after emacspeak pre act comp)
  "voicify the fine differences"
    (emacspeak-ediff-voicify-current-fine-difference))

(defadvice ediff-toggle-read-only (after emacspeak pre act comp)
  "Provide auditory feedback"
  (when (interactive-p)
    (save-excursion
      (set-buffer 
    (if (eq last-command-char ?A) ediff-A-buffer ediff-B-buffer))
      (cond
       (buffer-read-only
         (message "Ediff buffer %c   named %s is now read only"
                  last-input-char (buffer-name )))
       (t (message "Ediff buffer %c   named %s can now be editted"
                  last-input-char (buffer-name )))))))
(defadvice ediff-toggle-help (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (if (string= ediff-help-message ediff-help-message-long)
	(message "Showing help window")
      (message "Hid help window"))))

(defadvice ediff-status-info (after emacspeak pre act )
  "Speak the status information"
  (when (interactive-p)
    (save-excursion
      (set-buffer " *ediff-info*")
      (emacspeak-speak-buffer ))))

(defadvice ediff-scroll-up (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'scroll)
    (message "Scrolled up buffers A and B")))

(defadvice ediff-scroll-down (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'scroll)
    (message "Scrolled down buffers A and B")))

(defadvice ediff-toggle-split (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (if (eq ediff-split-window-function 'split-window-vertically)
        (message "Split ediff windows vertically")
      (message "Split ediff windows horizontally"))))

(defadvice ediff-recenter (after emacspeak pre act )
  "Provide spoken feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'select-object )
    (message "Refreshed the ediff display")))

(defadvice ediff-jump-to-difference (after emacspeak pre act )
  "Speak the difference you jumped to"
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-ediff-speak-current-difference )))

(defadvice ediff-jump-to-difference-at-point (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-ediff-speak-current-difference)))

;;}}}

(provide  'emacspeak-ediff)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
