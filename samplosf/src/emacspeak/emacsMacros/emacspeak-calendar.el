;;; $Id: emacspeak-calendar.el,v 3.29 1995/08/28 13:12:10 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extensions to speech enable the calendar.
;;; Keywords: Emacspeak, Calendar, Spoken Output
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
(require 'advice)
(require 'cl)
(require 'dtk-speak)
(require 'dtk-voices)
(require 'emacspeak-speak)
(require 'emacspeak-sounds)
(eval-when (compile) (require 'calendar )
           )

;;{{{  Introduction:

;;; This module speech enables the Emacs Calendar.
;;; Speech enabling is not the same as speaking the screen:
;;; This is an excellent example of this. 

;;}}}
;;{{{  personalities

(dtk-define-voice 'emacspeak-diary-mark-personality  "[:nu]")

;;}}}
;;{{{  functions: 

(defun calendar-entry-marked-p()
  "Check if diary entry is marked. "
  (declare (special diary-entry-marker))
  (or
   (get-text-property (point) 'personality)
   (save-excursion
     (forward-char 1)
     (string= diary-entry-marker (buffer-substring (point) (+ 1 (point ))))))
  )

(defun emacspeak-speak-calendar-date()
  "Speak the date under point when called in Calendar Mode. "
  (interactive)
  (let ((voice-lock-mode t)
        (dtk-stop-immediately nil))
    (emacspeak-dtk-sync)
    (if (calendar-entry-marked-p)
        (dtk-with-voice 'emacspeak-diary-mark-personality 
                        (dtk-speak
                         (calendar-date-string (calendar-cursor-to-date t ) nil  nil )))
      (dtk-speak
       (calendar-date-string (calendar-cursor-to-date t ) nil  nil )))
    )
  )

;;}}}
;;{{{  Advice:

(defadvice view-diary-entries (after emacspeak pre act)
  "Speak the diary entries."
  (when (interactive-p)
    (save-excursion
      (set-buffer "*Fancy Diary Entries*")
  (emacspeak-speak-buffer))))

(defadvice  mark-visible-calendar-date (after emacspeak pre act )
  "Use voice locking to mark date. "
  (let
      ((date (ad-get-arg 0 ))
       (mark 'emacspeak-diary-mark-personality)
       (buffer-read-only nil))
    (if (calendar-date-is-legal-p date)
        (save-excursion
          (set-buffer calendar-buffer)
          (calendar-cursor-to-visible-date date)
          (put-text-property  (1-(point)) (1+ (point))
                              'personality   mark )))))

(defadvice calendar (after emacspeak pre act )
  "Announce yourself."
  (when (interactive-p)
    (message "Welcome to the calendar")))

(defadvice calendar-goto-date (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p )
    (emacspeak-speak-calendar-date ))

  )

(defadvice calendar-goto-today (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p )
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-backward-day (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-forward-day (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-backward-week (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-forward-week (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-backward-month (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-forward-month (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-backward-year (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))

  )


(defadvice calendar-forward-year (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )



(defadvice calendar-beginning-of-week (after emacspeak pre act)

  "Speak the date. "

  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )

(defadvice calendar-beginning-of-month (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )

(defadvice calendar-beginning-of-year (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )


(defadvice calendar-end-of-week (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )

(defadvice calendar-end-of-month (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )

(defadvice calendar-end-of-year (after emacspeak pre act)
  "Speak the date. "
  (when (interactive-p)
    (emacspeak-speak-calendar-date ))
  )

(defadvice exit-calendar (after emacspeak pre act)
  "Speak modeline. "
  (when (interactive-p )
    (emacspeak-speak-mode-line)))
(defadvice insert-diary-entry (after emacspeak pre act)
  "Speak the line. "
  (when (interactive-p)
      (emacspeak-speak-line )))

;;}}}
;;{{{  keymap

(defun emacspeak-calendar-keys()
  "Set up appropriate bindings for calendar"
  (declare (special calendar-buffer calendar-mode-map emacspeak-prefix ))
  (save-excursion
    (set-buffer calendar-buffer)
    (local-unset-key emacspeak-prefix)
    (define-key calendar-mode-map  "\C-e." 'emacspeak-speak-calendar-date)
    (define-key calendar-mode-map  "\C-ee" 'calendar-end-of-week))
  )
(add-hook 'initial-calendar-window-hook 'emacspeak-calendar-keys t)
(add-hook 'initial-calendar-window-hook 
(function (lambda () 
(dtk-set-punctuations "some")
(emacspeak-dtk-sync))))
;;}}}

;;{{{  Appointments:
;;; For the present, we just take over and speak the appointment.
(declaim (special appt-display-duration ))
(setq appt-display-duration 90)

(defun emacspeak-appt-speak-appointment (minutes-left new-time message )
  "Speak the appointment instead of displaying it visually."
  (let ((appt-buffer (get-buffer-create " *appointments*")))
    (emacspeak-auditory-icon 'alarm)
    (save-excursion
      (set-buffer appt-buffer)
      (set  (make-local-variable 'dtk-punctuation-mode ) "some")
    (emacspeak-dtk-sync)
    (erase-buffer)
    (insert
     (format "You have an appointment in %s minutes. %s"
             minutes-left message ))
    (message  (buffer-string )))
    (emacspeak-dtk-sync)))

(declaim (special appt-disp-window-function))
(setq appt-disp-window-function 'emacspeak-appt-speak-appointment)

(defun emacspeak-appt-delete-display ()
  "Function to delete appointment message"
  (and (get-buffer " *appointments*")
       (save-excursion
         (set-buffer " *appointments*")
         (erase-buffer))))

(declaim (special appt-delete-window-function))
(setq appt-delete-window-function 'emacspeak-appt-delete-display)

(defun emacspeak-appt-repeat-announcement ()
  "Speaks the most recently displayed appointment message if any."
  (interactive)
  (let  ((appt-buffer (get-buffer " *appointments*")))
  (cond
   ( appt-buffer
      (save-excursion
        (set-buffer  appt-buffer)
         (emacspeak-dtk-sync)
         (if (= (point-min) (point-max))
             (message  "No appointments are currently displayed")
           (dtk-speak (buffer-string )))))
   (t (message "You have no appointments "))))
  (emacspeak-dtk-sync))
    

(defadvice appt-add (after emacspeak pre act )
  "Confirm that the alarm got set."
  (when (interactive-p)
    (let ((time (ad-get-arg 0))
          (message (ad-get-arg 1 )))
      (message "Set alarm %s at %s"
               message time ))))
;;}}}

(provide 'emacspeak-calendar)
;;{{{ emacs local variables

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}


