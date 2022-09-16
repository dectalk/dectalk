;;; $Id: emacspeak-outline.el,v 1.1 1995/09/02 03:10:55 raman Exp $
;;; $Author: leeber$ 
;;; DescriptionEmacspeak extensions for outline-mode
;;; Keywords:emacspeak, audio interface to emacs Outlines
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

;;; Provide additional advice to outline-mode

;;}}}
;;{{{  Navigating through an outline:

(defadvice outline-next-heading (after emacspeak pre act comp)
  "Speak the line."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (dtk-with-voice 'voice-lock-type-personality
    (emacspeak-speak-line ))))

(defadvice outline-back-to-heading (after emacspeak pre act comp)
  "Speak the line."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (dtk-with-voice 'voice-lock-type-personality
    (emacspeak-speak-line ))))

(defadvice outline-next-visible-heading (after emacspeak pre act comp)
  "Speak the line."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (dtk-with-voice'voice-lock-type-personality
    (emacspeak-speak-line ))))

(defadvice outline-previous-visible-heading (after emacspeak pre act comp)
  "Speak the line."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (dtk-with-voice 'voice-lock-type-personality
    (emacspeak-speak-line ))))

(defadvice outline-up-heading (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (dtk-with-voice 'voice-lock-type-personality
    (emacspeak-speak-line ))))

(defadvice outline-forward-same-level (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))


(defadvice outline-backward-same-level (after emacspeak pre act comp)
  "Provide auditory feedback."
  (when (interactive-p)
    (emacspeak-auditory-icon 'large-movement)
    (emacspeak-speak-line )))

;;}}}
;;{{{  Hiding and showing subtrees

(defadvice hide-entry (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid the body directly following this heading")))

(defadvice show-entry (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (message "Exposed body directly following current heading")))

(defadvice hide-body (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid all of the buffer except for header lines")))

(defadvice show-all (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (message "Exposed all text in the buffer")))

(defadvice hide-subtree (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid everything at deeper levels from current heading")))

(defadvice hide-leaves (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid all of the body at deeper levels")))

(defadvice show-subtree  (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (message "Exposed everything after current heading at deeper levels")))

(defadvice hide-sublevels (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid everything except the top  %s levels"
             (ad-get-arg 0))))

(defadvice hide-other (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'close-object)
    (message "Hid everything except current body and parent headings")))

(defadvice show-branches (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (message "Exposed all subheadings while leaving their bodies hidden")))

(defadvice show-children (after emacspeak pre act comp)
  "Produce an auditory icon"
  (when (interactive-p)
    (emacspeak-auditory-icon 'open-object)
    (message "Exposed subheadings below current level")))

;;}}}

(provide  'emacspeak-outline)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
