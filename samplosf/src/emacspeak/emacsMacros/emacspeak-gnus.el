;;; $Id: emacspeak-gnus.el,v 3.29 1995/09/12 09:18:42 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extension to speech enable Gnus
;;; Keywords: Emacspeak, Gnus, Advice, Spoken Output, News
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
(eval-when (compile) (require 'gnus)
           (require 'voice-lock))
(require 'advice)
(require 'emacspeak-speak)

(require 'emacspeak-sounds)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;{{{  Introduction:

;;; This module advices gnus to speak. 

;;}}}
;;{{{  Customizations:

;;; These customizations to gnus make it convenient to listen to news:
;;; You can read news mostly by using the four arrow keys.
;;; By default all article headers are hidden, so you hear the real news.
;;; You can expose some of the headers with "T" in summary mode.


;;; Keybindings for summary mode:

(add-hook 'gnus-summary-mode-hook
          (function (lambda ()
                      (define-key gnus-summary-mode-map "\C-t"
                        'gnus-summary-toggle-header)
                      (define-key gnus-summary-mode-map "T" 'gnus-summary-hide-all-headers )
                      (define-key gnus-summary-mode-map "t" 'gnus-summary-show-some-headers)
                      (define-key gnus-summary-mode-map '[left] 'gnus-summary-catchup-quietly-and-exit)
                      (define-key gnus-summary-mode-map '[right] 'gnus-summary-show-article))))

(add-hook 'gnus-group-mode-hook
          (function
           (lambda ()
             (define-key gnus-group-mode-map '[right] 'gnus-group-read-group)
             )))

;;}}}
;;{{{  Hiding headers

(defvar  gnus-ignored-most-headers
  (concat
   "^Path:\\|^Posting-Version:\\|^Article-I.D.:\\|^Expires:"
   "\\|^Date-Received:\\|^References:\\|^Control:\\|^Xref:"
   "\\|^Lines:\\|^Posted:\\|^Relay-Version:\\|^Message-ID:\\|^Nf-ID:"
   "\\|^Nf-From:\\|^Approved:\\|^Sender:"
   "\\|^Organization:\\|^Approved:\\|^Distribution:\\|^Apparently-To:"
   "\\|^Keywords:\\|^Copyright:\\|^X-Supersedes:\\|^ACategory: \\|^Slugword:"
   "\\|^Priority:\\|^ANPA:\\|^Codes:"
   "\\|^Originator:\\|^Comment:\\|^NNTP-Posting-Host:\\|Original-To:"
   "\\|^Followup-To:\\|^Original-Cc:\\|^Reply-To:")
  "Article headers to ignore when only important article headers are to be
spoken.
See command \\[gnus-summary-show-some-headers].")

(setq gnus-ignored-headers "^.*:")
(declaim (special gnus-visible-headers))
(setq gnus-visible-headers "^Subject:")

(defun gnus-summary-show-some-headers ()
  "Show only the important article headers,
i.e. sender name, and subject."
  (interactive)
  (declare (special gnus-ignored-most-headers )) 
  (let ((gnus-ignored-headers gnus-ignored-most-headers ))
    (gnus-summary-toggle-header 1)
    (gnus-summary-toggle-header -1)))


(defun gnus-summary-hide-all-headers()
  "Hide all headers in the article.
Use this command if you don't want to listen to any article headers when
reading news."
  (interactive)
  (let ((gnus-ignored-headers "^.*:"))
    (gnus-summary-toggle-header 1 )
    (gnus-summary-toggle-header -1)))

;;}}}
;;{{{  helper functions

(defsubst emacspeak-gnus-summary-speak-subject ()
  (emacspeak-dtk-sync)
  (dtk-speak (gnus-summary-subject-string )))

;;}}}
;;{{{  Newsgroup selection

(defadvice gnus-group-read-group  (after  emacspeak pre act)
  "Speak the first article line.
 Produce an auditory icon indicating 
an object has been opened."
  (when (interactive-p) 
    (emacspeak-auditory-icon 'open-object)
    (dtk-speak (gnus-summary-subject-string))))

(defadvice gnus-group-prev-group (around emacspeak pre act)
  "Speak the newsgroup line.
 Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        (emacspeak-auditory-icon 'select-object)
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more newsgroups ")
          (emacspeak-speak-line))))
  ad-return-value)

(defadvice gnus-group-next-group (around emacspeak pre act)
  "Speak the newsgroup line.
 Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        (emacspeak-auditory-icon 'select-object)
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more newsgroups")
          (emacspeak-speak-line)))))

(defadvice gnus-group-unsubscribe-current-group (after emacspeak pre act)
"Produce an auditory icon indicating
this group is being deselected."
  (when (interactive-p)
    (emacspeak-auditory-icon 'deselect-object)
 (emacspeak-speak-line )))

;;}}}
;;{{{  summary mode 

(defadvice gnus-summary-prev-subject  (around  emacspeak pre act)
  "Speak the article  line.
 Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more articles. ")
          (progn 
            (emacspeak-auditory-icon 'select-object ))
          (dtk-speak (gnus-summary-subject-string )))
        ad-return-value )
    ad-return-value ))

(defadvice gnus-summary-next-subject  (around  emacspeak pre act)
  "Speak the article  line. 
Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more articles. ")
          (progn 
            (emacspeak-auditory-icon 'select-object )
            (dtk-speak (gnus-summary-subject-string ))))
        ad-return-value )
    ad-return-value ))

(defadvice gnus-summary-prev-unread-subject  (around  emacspeak pre act)
  "Speak the article  line.
 Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more unread articles. ")
          (progn 
            (emacspeak-auditory-icon 'select-object )
            (dtk-speak (gnus-summary-subject-string ))))
        ad-return-value )
    ad-return-value ))

(defadvice gnus-summary-next-unread-subject  (around  emacspeak pre act)
  "Speak the article line.
Produce an auditory icon if possible."
  (if (interactive-p) 
      (let ((saved-point (point )))
        ad-do-it
        (if (= saved-point (point))
            (dtk-speak "No more articles. ")
          (progn 
            (emacspeak-auditory-icon 'select-object )
            (dtk-speak (gnus-summary-subject-string )))))
    ad-return-value )
  ad-return-value )

  (defadvice gnus-summary-goto-subject (around  emacspeak pre act)
    "Speak the article  line.
 Produce an auditory icon if possible."
    (if (interactive-p) 
        (let ((saved-point (point )))
          ad-do-it
          (if (= saved-point (point))
              (dtk-speak "No more articles. ")
            (progn 
              (emacspeak-auditory-icon 'select-object )
              (dtk-speak (gnus-summary-subject-string ))))
          ad-return-value )
      ad-return-value ))

  (defadvice gnus-summary-catchup-and-exit (after emacspeak pre act)
    "Speak the newsgroup line.
 Produce an auditory icon indicating 
the previous group was closed."
    (when (interactive-p)
      (emacspeak-auditory-icon 'close-object)
      (emacspeak-speak-line )))

  (defun gnus-summary-catchup-quietly-and-exit nil
    "Catch up on articles without confirmation. "
    (interactive)
    (gnus-summary-catchup-and-exit t t)
    (emacspeak-auditory-icon 'close-object)
    (emacspeak-speak-line))

  (defadvice gnus-summary-mark-as-unread-forward (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p)
      (emacspeak-auditory-icon 'mark-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-mark-as-read-forward (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon'mark-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-mark-as-unread-backward (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon 'mark-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-mark-as-read-backward (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon 'mark-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-kill-same-subject-and-select (after emacspeak pre act)
    "Speak the subject and speak the first screenful.
Produce an auditory icon
indicating the article is being opened."
    (when (interactive-p)
      (emacspeak-gnus-summary-speak-subject)
      (sit-for 2)
      (emacspeak-auditory-icon 'open-object)
      (save-excursion
        (set-buffer  "*Article*")
        (emacspeak-dtk-sync)
        (let ((start  (point ))
              (window (get-buffer-window (current-buffer ))))
          (forward-line (window-height window))
          (emacspeak-speak-region start (point ))))))

  (defadvice gnus-summary-kill-same-subject (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p)
      (emacspeak-auditory-icon 'select-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-next-thread (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon 'select-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-prev-thread (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon 'select-object)
      (emacspeak-gnus-summary-speak-subject )))

  (defadvice gnus-summary-up-thread (after emacspeak pre act)
    "Speak the line.
 Produce an auditory icon if possible."
    (when (interactive-p) 
      (emacspeak-auditory-icon'select-object)
      (emacspeak-gnus-summary-speak-subject )))


(defadvice gnus-summary-down-thread (after emacspeak pre act)
          "Speak the line. 
Produce an auditory icon if possible."
          (when (interactive-p) 
(emacspeak-auditory-icon 'select-object)
(emacspeak-gnus-summary-speak-subject )))

(defadvice gnus-summary-kill-thread (after emacspeak pre act)
  "Speak the line.
 Produce an auditory icon if possible."
  (when (interactive-p) 
    (emacspeak-auditory-icon 'select-object)
(emacspeak-gnus-summary-speak-subject )))

;;}}}
;;{{{  Article reading

;;; helper function:

(defvar emacspeak-gnus-large-article 100
  "Articles having more than
emacspeak-gnus-large-article lines will be considered to be a large article.
A large article is not spoken all at once;
instead you hear only the first screenful.")


(defsubst emacspeak-gnus-speak-article-body ()
  (declare (special emacspeak-gnus-large-article
                    voice-lock-mode dtk-punctuation-mode))
  (let ((window nil ))
  (save-excursion
    (set-buffer  "*Article*")
    (setq window (get-buffer-window "*Article*"))
    (setq dtk-punctuation-mode "some")
    (voice-lock-mode 1)
    (emacspeak-dtk-sync)
          (cond
           ((< (count-lines (point-min) (point-max))
               emacspeak-gnus-large-article)
    (emacspeak-speak-buffer  ))
           (t (emacspeak-auditory-icon 'large-movement )
            (emacspeak-speak-region
             (window-start window)
            (window-end window )))))))

(defadvice gnus-summary-show-article (after emacspeak pre act)
  "Start speaking the article. "
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
  (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-next-page (after emacspeak pre act)
  "Speak the next pageful "
  (dtk-stop)
  (emacspeak-auditory-icon 'scroll)
  (save-excursion
    (set-buffer  "*Article*")
    (let ((start  (point ))
          (window (get-buffer-window (current-buffer ))))
      (forward-line (window-height window))
      (emacspeak-speak-region start (point )))))

(defadvice gnus-summary-prev-page (after emacspeak pre act)
  "Speak the previous  pageful "
  (dtk-stop)
  (emacspeak-auditory-icon 'scroll)
  (save-excursion
    (set-buffer  "*Article*")
    (let ((start  (point ))
          (window (get-buffer-window (current-buffer ))))
      (forward-line (-  (window-height window)))
      (emacspeak-speak-region start (point )))))

(defadvice gnus-summary-beginning-of-article (after emacspeak pre act)
  "Speak the first line. "(save-excursion
                            (set-buffer "*Article*")
                            (emacspeak-speak-line )))

(defadvice gnus-summary-end-of-article

  (after emacspeak pre act)
  "Speak the first line. "(save-excursion
                            (set-buffer "*Article*")
                            (emacspeak-speak-line )))

(defadvice gnus-summary-next-unread-article (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
  (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-prev-unread-article (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
    (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-next-article (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
  (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-prev-same-subject  (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
    (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-next-same-subject  (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
  (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-first-unread-article (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
  (emacspeak-gnus-speak-article-body)))

(defadvice gnus-summary-goto-last-article (after emacspeak pre act)
  "Speak the article. "
  (when (interactive-p)
  (emacspeak-gnus-speak-article-body )))

;;}}}

(provide 'emacspeak-gnus)
;;{{{  end of file 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
