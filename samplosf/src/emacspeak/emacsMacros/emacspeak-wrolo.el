;;; $Id: emacspeak-wrolo.el,v 1.2 1995/09/02 03:28:38 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak enhancements for Rolodex (part of hyperbole)
;;; Keywords: Emacspeak, Rolodex, Spoken Output
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

(require 'advice)
(require 'dtk-voices)
(require 'emacspeak-speak)
(require 'emacspeak-sounds)
(eval-when (load)
  (require 'wrolo))
(eval-when (compile)
  (require 'emacspeak-fix-interactive))
;;{{{  Introduction:

;;; This module extends the Rolodex that ships with Hyperbole, wrolo.el to
;;; speak fluently with emacspeak.

;;}}}

;;{{{ Interactive rolodex commands:

;;;rolo-add works without any advice.
;;; Display the matches:

(defadvice rolo-display-matches (after emacspeak pre act comp)
  "Speak the line"
  (when (interactive-p)
    (emacspeak-auditory-icon 'select-object)
    (outline-next-visible-heading 1)
    (emacspeak-speak-line )))


;;; editing rolodex: uses an interactive prompt
(emacspeak-fix-interactive-command-if-necessary 'rolo-edit)
;;; An after advice speaks the line that is to be edited

(defadvice rolo-edit (after emacspeak pre act comp)
  "Speak the line"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (emacspeak-speak-line )))

;;; Searching in the rolodex uses an interactive prompt

(emacspeak-fix-interactive-command-if-necessary 'rolo-grep)
(emacspeak-fix-interactive-command-if-necessary 'rolo-fgrep)
(emacspeak-fix-interactive-command-if-necessary 'rolo-word)

;;; Now speak the number of hits and the first hit.
(defadvice rolo-fgrep (after emacspeak pre act )
  "Speak the number of hits and the first match if any."
  (when   (interactive-p)
    (cond
     ((> ad-return-value 0)
      (emacspeak-auditory-icon 'search-hit)
      (outline-next-visible-heading 1)
      (dtk-speak
       (format  "%s hits. First hit is %s"
                ad-return-value
                (let ((start (point)))
                  (save-excursion
                    (end-of-line)
                    (buffer-substring start (point )))))))
     (t (emacspeak-auditory-icon 'search-miss)
      (dtk-speak "No matches found")))))


(defadvice rolo-grep (after emacspeak pre act )
  "Speak the number of hits and the first match if any."
  (when   (interactive-p)
    (cond
     ((> ad-return-value 0)
      (outline-next-visible-heading 1)
      (emacspeak-auditory-icon'search-hit)
      (dtk-speak
       (format  "%s hits. First hit is %s"
                ad-return-value
                (let ((start (point)))
                  (save-excursion
                    (end-of-line)
                    (buffer-substring start (point )))))))
     (t (emacspeak-auditory-icon 'search-miss)
        (dtk-speak "No matches found")))))

(defadvice rolo-word (after emacspeak pre act )
  "Speak the number of hits and the first match if any."
  (when   (interactive-p)
    (cond
     ((> ad-return-value 0)
      (outline-next-visible-heading 1)
      (emacspeak-auditory-icon 'search-hit)
      (dtk-speak
     (format  "%s hits. First hit is %s"
              ad-return-value
              (let ((start (point)))
                (save-excursion
                  (end-of-line)
                  (buffer-substring start (point )))))))
     (t(emacspeak-auditory-icon 'search-miss)
      (dtk-speak "No matches found")))))

;;; Killing a rolodex entry:
;;; First fix the interactive prompt.
(emacspeak-fix-interactive-command-if-necessary 'rolo-kill)
;;; And provide feedback if you did kill it.
(defadvice rolo-kill (after emacspeak pre act )
  "Provide auditory confirmation "
  (when (interactive-p)
    (cond
     ((> ad-return-value 0)
      (emacspeak-auditory-icon  'delete-object)
      (message "Killed %s records  matching %s"
               ad-return-value 
               (ad-get-arg 0 )))
     (t (message "Found no entries matching %s to kil"
                 (ad-get-arg 0))))))

;;; Moving through the matches is kept simple for now:
(defadvice rolo-next-match (after emacspeak pre act )
  "Speak the hit"
  (when (interactive-p)
    (emacspeak-auditory-icon 'search-hit)
    (emacspeak-speak-line )))

(defadvice rolo-previous-match (after emacspeak pre act )
  "Speak the hit"
  (when (interactive-p)
    (emacspeak-auditory-icon 'search-hit)
    (emacspeak-speak-line )))

(defadvice rolo-quit (after emacspeak pre act comp)
  "Quitting the rolodex"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)))

(defadvice rolo-sort (after emacspeak pre act comp)
  "Confirm aurally after you are done"
  (when (interactive-p)
    (message "Ordered entries in rolodex")))

(emacspeak-fix-interactive-command-if-necessary   'rolo-yank)
;;;Around advice to provide feedback on what you did
(defadvice rolo-yank (after   emacspeak pre act comp)
  "Say what you did"
  (when (interactive-p)
    (cond
     ((> ad-return-value 0)
      (emacspeak-auditory-icon 'yank-object)
      (message "Yanked record matching %s"
               (ad-get-arg 0 )))
     (t (message "Found no records matching %s to yank"
                 (ad-get-arg 0 ))))))
  
   
         
;;}}}

(provide 'emacspeak-wrolo)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
