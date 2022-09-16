;;; $Id: emacspeak-oo-browser.el,v 1.5 1995/09/13 13:40:21 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extensions for Bob Weiner's excellent OO-Browser.
;;; Keywords: Emacspeak, Speech Access, Browsing source code.
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

;;; Provide Emacspeak  advice to the OO-Browser

;;}}}
;;{{{  Make browser comamnds speak:

(defadvice br-next-entry (after emacspeak pre act )
  "Speak the line."
  (when (interactive-p)
    (emacspeak-speak-line )))

(defadvice br-prev-entry (after emacspeak pre act )
  "Speak the line."
  (when (interactive-p)
    (emacspeak-speak-line )))

(defadvice br-ancestors (after emacspeak pre act )
  "Provide spoken feedback. "
  (when (and ad-return-value  (interactive-p))
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Ancestors   of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))



(defadvice br-children (after emacspeak pre act )
  "Provide spoken feedback. "
  (when (and ad-return-value  (interactive-p))
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Children  of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))


(defadvice br-categories (after emacspeak pre act )
  "Provide spoken feedback. "
  (when (and ad-return-value  (interactive-p))
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Categories   of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))
(defadvice br-descendants (after emacspeak pre act )
  "Provide spoken feedback. "
  (when (and ad-return-value  (interactive-p))
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Descendants   of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point ))))))))
  )

(defadvice br-edit-entry (after emacspeak pre act )
  "Speak the line. "
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice br-features (after emacspeak pre act )
  "Provide spoken feedback. "
  (when   (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Features    of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))

(defadvice br-match (after emacspeak pre act )
  "Provide spoken feedback. "
  (when   (interactive-p)
    (let ((start nil ))
      (message   
       (format  "Elements matching  %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))

(defadvice br-match-entries (after emacspeak pre act )
  "Provide spoken feedback. "
  (when   (interactive-p)
    (let ((start nil ))
      (message   
       (format  "Elements matching  %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))


(defadvice br-parents (after emacspeak pre act )
  "Provide spoken feedback. "
  (when (and ad-return-value  (interactive-p))
    (emacspeak-auditory-icon 'large-movement)
    (let ((start nil )
          (dtk-stop-immediately nil))
      (message   
       (format  "Parents   of %s"
                (progn (save-excursion
                         (beginning-of-line)
                         (setq start (point ))
                         (end-of-line)
                         (buffer-substring start (point )))))))))



(defadvice br-unique (after emacspeak pre act )
  "Provide spoken feedback."
  (when (interactive-p)
    (message "Cleaning up duplicate entries")))

(defadvice br-exit-level (after emacspeak pre act )
  "Speak the line."
  (when (interactive-p)
    (emacspeak-speak-line )))

(defadvice br-to-from-viewer (after emacspeak pre act )
  "Speak the line."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice br-feature-signature (after emacspeak pre act )
  "Speak the feature signature."
  (when (interactive-p)
    (let*  ((buf (buffer-name ))
            (buffer (get-buffer (concat buf "-Elements"))))
      (when buffer 
        (save-excursion
          (set-buffer buffer   )
          (voice-lock-mode 1)
          (emacspeak-speak-buffer))))))

;;}}}

(provide  'emacspeak-oo-browser)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}

