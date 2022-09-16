;;; $Id: emacspeak-info.el,v 1.10 1995/08/03 20:40:46 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Module for customizing Emacs info
;;; Keywords:emacspeak, audio interface to emacs
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
(eval-when (compile)
(require 'dtk-speak))
(require 'emacspeak-sounds)
(require 'emacspeak-speak)
(require 'voice-lock)
(require 'dtk-voices)
(require 'emacspeak-fix-interactive)
;;{{{ Introduction:

;;; This module extends and customizes the Emacs info reader.

;;}}}
;;{{{  Variables:

(defvar Info-voiceify t
  "*Non-nil enables highlighting and voices in Info nodes.")

(defvar Info-voiceify-maximum-menu-size 30000
  "*Maximum size of menu to voiceify if `Info-voiceify' is non-nil.")



;;}}}
;;{{{  Voices 

(dtk-define-voice 'info-node   "[:nh]")
(dtk-define-voice 'info-xref "[:nu]")
(dtk-define-voice 'info-menu-5 "[:nb]")

;;}}}
;;{{{  Voiceify a node 

;;; Cloned from info.el Info-fontify-node 
(defun Info-voiceify-node ()
(declare (special Info-current-node))
  (save-excursion
    (let ((buffer-read-only nil))
      (goto-char (point-min))
      (if (looking-at "^File: [^,: \t]+,?[ \t]+")
	  (progn
	    (goto-char (match-end 0))
	    (while
		(looking-at "[ \t]*[^:, \t\n]+:[ \t]+\\([^:,\t\n]+\\),?")
	      (goto-char (match-end 0))
	      (put-text-property (match-beginning 1) (match-end 1)
				 'personality 'info-xref)
	      )))
      (goto-char (point-min))
      (while (re-search-forward "\\*Note[ \n\t]+\\([^:]*\\):" nil t)
	(if (= (char-after (1- (match-beginning 0))) ?\") ; hack
	    nil
	  (put-text-property (match-beginning 1) (match-end 1)
			     'personality 'info-xref)
	  ))
      (goto-char (point-min))
      (if (and (search-forward "\n* Menu:" nil t)
	       (not (string-match "\\<Index\\>" Info-current-node))
	       ;; Don't take time to annotate huge menus
	       (< (- (point-max) (point)) Info-voiceify-maximum-menu-size))
	  (let ((n 0))
	    (while (re-search-forward "^\\* \\([^:\t\n]*\\):" nil t)
	      (setq n (1+ n))
	      (if (memq n '(5 9))   ; visual aids to help with 1-9 keys
		  (put-text-property (match-beginning 0)
				     (1+ (match-beginning 0))
				     'personality 'info-menu-5))
	      (put-text-property (match-beginning 1) (match-end 1)
				 'personality 'info-node)
	      )))
      (set-buffer-modified-p nil))))

;;}}}
;;{{{ advice

;;; Advice Info mode to voice lock 

(defadvice Info-mode (after emacspeak pre act)
"Set up voice locking if requested. 
See variable `Info-voiceify`"
(and   Info-voiceify (voice-lock-mode)))

(defadvice Info-select-node (after emacspeak pre act)
  "Voiceify the Info node if requested."
  (let ((dtk-stop-immediately t ))
    (emacspeak-auditory-icon 'select-object)
    (and Info-voiceify (Info-voiceify-node))
         (let ((start  (point ))
               (window (get-buffer-window (current-buffer ))))
           (save-excursion 
             (forward-line (window-height window))
             (emacspeak-speak-region start (point ))))))

(defadvice info (after emacspeak pre act)
"Cue user that info is up."
(when (interactive-p)
(emacspeak-auditory-icon 'help)
(emacspeak-speak-line)))


(defadvice Info-scroll-up (after emacspeak pre act) 
"Speak the screenful."
(when (interactive-p)
  (emacspeak-auditory-icon 'scroll)
(let ((start  (point ))
              (window (get-buffer-window (current-buffer ))))
(save-excursion 
          (forward-line (window-height window))
          (emacspeak-speak-region start (point ))))))

(defadvice Info-scroll-down (after emacspeak pre act) 
"Speak the screenful."
(when (interactive-p)
  (emacspeak-auditory-icon 'scroll)
(let ((start  (point ))
              (window (get-buffer-window (current-buffer ))))
(save-excursion 
          (forward-line (window-height window))
          (emacspeak-speak-region start (point ))))))

(defadvice Info-exit (after emacspeak pre act)
"Play an auditory icon to close info,
and then cue the next selected buffer."
(when (interactive-p )
(dtk-stop)
(emacspeak-auditory-icon 'close-object)
(emacspeak-speak-mode-line)))


(defadvice Info-next-reference (after emacspeak pre act)
"Speak the line. "
(when (interactive-p)
(emacspeak-speak-line)))

(defadvice Info-prev-reference (after emacspeak pre act)
  "Speak the line. "
  (when (interactive-p)
    (emacspeak-speak-line)))

;;}}}
;;{{{  Fix interactive commands where necessary:

(mapcar 'emacspeak-fix-interactive-command-if-necessary 
(list 'Info-search 
'Info-index 
'Info-goto-emacs-key-command-node 
'Info-goto-emacs-command-node))


;;}}}

(provide  'emacspeak-info)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
