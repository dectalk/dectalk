;;; $Id: emacspeak-bbdb.el,v 1.6 1995/09/18 19:35:35 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for bbdb 
;;; Keywords:emacspeak, audio interface to emacs bbdb 
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

;;{{{  Required libraries

(require 'cl)
(require 'emacspeak-speak)
(require 'emacspeak-sounds)

;;}}}
;;{{{  Introduction:

;;; Provide additional advice to bbdb

;;}}}
;;{{{  Variable settings:

;;; Emacspeak will not work if bbdb is in electric mode
(declaim (special bbdb-electric-p))
(setq bbdb-electric-p nil)
(declaim (special bbdb-mode-map))

(add-hook 'bbdb-mode-hook
          (function (lambda ()
                      (define-key  bbdb-mode-map "b" 'bbdb)
                      (define-key bbdb-mode-map "N" 'bbdb-name)
                      (define-key bbdb-mode-map "c" 'bbdb-create)
                      )))
                      
;;}}}
;;{{{ Advice:

(defadvice              bbdb-delete-current-field-or-record (after emacspeak
                                                                   pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'delete-object)
    (emacspeak-speak-line)))

(defadvice bbdb-edit-current-field (before emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object )))

(defadvice bbdb-send-mail (before emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (let ((to (if (consp (ad-get-arg 0))
                  (bbdb-dwim-net-address
                   (car (ad-get-arg 0)))
                (bbdb-dwim-net-address
                 (ad-get-arg 0 ))))
          (subject  (ad-get-arg 1)))
      (emacspeak-auditory-icon 'open-object )
      (message "Starting an email message  %s to %s %s "
               (if subject  (format "about %s" subject) "")
               to
               (if  (consp (ad-get-arg 0))
                   " and others " " ")))))

(defadvice bbdb-next-record (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement )
    (emacspeak-speak-line )))

(defadvice bbdb-prev-record (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement )
    (emacspeak-speak-line )))

(defadvice bbdb-omit-record (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (emacspeak-speak-line)))

(defadvice bbdb-bury-buffer (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (emacspeak-speak-mode-line )))

(defadvice bbdb-elide-record (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (message "Toggled  record display")))

(defadvice bbdb-transpose-fields (after emacspeak pre act )
  "Provide auditory feedback"
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

(defadvice bbdb-complete-name (around emacspeak pre act )
  "Provide spoken feedback"
  (let ((prior (point ))
        (dtk-stop-immediately nil))
    ad-do-it
    (when (> (point) prior)
      (dtk-speak  (buffer-substring prior (point ))))
    ad-return-value))

;;}}}

(provide  'emacspeak-bbdb)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
