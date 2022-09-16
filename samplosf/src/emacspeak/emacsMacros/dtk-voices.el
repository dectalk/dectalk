;;; $Id: dtk-voices.el,v 1.13 1995/09/16 21:07:11 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Module to set up dtk voices and personalities
;;; Keywords: Voice, Personality, Dectalk
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
;;{{{  Introduction:

;;; This module defines the various voices used in voice-lock mode.
;;; This module is Dectalk specific. 

;;}}}
;;{{{  voice table 

(defvar dtk-voice-table  nil
  "Association between symbols and strings to set dtk voices.
The string can set any dtk parameter. ")

(defun dtk-define-voice (name command-string)
  "Define a dtk voice named name, which is set by sending the string
command-string to the Dectalk. "
  (declare (special dtk-voice-table ))
  (setq dtk-voice-table
        (cons (list name command-string )
              dtk-voice-table ))
  )

(defun dtk-get-voice-command (name)
  "Retrieve command string for this voice"
  (declare (special dtk-voice-table ))
  (or  (cadr  (assoc name dtk-voice-table ))
       "[:np ]" )
  )

;;}}}
;;{{{ voice definitions

;;; the nine predefined voices: 
(dtk-define-voice 'paul "[:np ]")
(dtk-define-voice 'harry "[:nh ]")
(dtk-define-voice 'dennis "[:nd]")
(dtk-define-voice 'frank "[:nf]")
(dtk-define-voice 'betty "[:nb]")
(dtk-define-voice 'ursula "[:nu]")
(dtk-define-voice 'rita "[:nr]")
(dtk-define-voice 'wendy "[:nw]")
(dtk-define-voice 'kit "[:nk]")

;;; Modified voices:
;;; Modifications for paul:
(dtk-define-voice 'paul-smooth "[:np  :dv sm 50 ri 30]")
(dtk-define-voice 'annotation-voice "[:np :dv  sm 30 ri 50  hr 0 sr 0 ]")
(dtk-define-voice 'indent-voice  "[:np :dv  sm 40 ri 40  hr 7  sr 10 ]")
(dtk-define-voice 'paul-animated
                  "[:np  :dv pr 200 hr  30 sr 50 as 100 qu 100]")
(dtk-define-voice 'paul-monotone "[:np  :dv pr 0 hr 1 sr 2 as 0 ]")
(dtk-define-voice 'paul-italic "[:np :dv ap 132 hs 99 pr 110 hr 10 sr 20]")
;;}}}
;;{{{  Settings from Janet Cahn's thesis.

;;; the  following are taken from Janet Cahn's Masters thesis.
;;; I've modified them for the Dectalk Express.
;;; lo is g5 on express.
;;; Also get rid of absolute changes in speech rate.

(dtk-define-voice 'paul-angry 
                  "[:np : dv as 90 ap 95 bf 29 hr 13 pr 250 sr 90 br 0 la 0 lx 0  qu 58 ri 100 sm 0 gh 73 gf 74 gv 65 b4 260 b5 330 ]")

(dtk-define-voice 
 'paul-disgusted 
 "[:np   :dv as 50 ap 120 bf 18 hr 18 pr 145 sr 26 br 0 la 0 lx 0   qu 0 ri 85 sm 18 gh 74 gf 75 gv 63 b4 261 b5 332 ]")

(dtk-define-voice 
 'paul-glad 
 "[:np   :dv as 39 ap 105 bf 10 hr 5 pr 250 sr 73 br 0 la 0 lx 0   qu 0 ri 56 sm 48 gh 49 gf 67 gv 63 b4 261 b5 332 ]")

(dtk-define-voice
 'paul-sad 
 "[:np   :dv as 30 ap 120 bf 14 hr 16 pr 50 sr 78 br 72 la 0 lx 100  qu 100 ri 7 sm 94 gh 35 gf 65 gv 62 b4 330 b5 1190 ]")

(dtk-define-voice 'paul-scared 
                  "[:np   :dv as 20 ap 300 bf 0 hr 100 pr 250 sr 100 br 0 la 0 lx 0   qu 100 ri 100 sm 0 gh 70 gf 70 gv 65 b4 260 b5 330 ]")

(dtk-define-voice 'paul-surprised 
                  "[:np   :dv as 60 ap 120 bf 9 hr 5 pr 220 sr 66 br 0 la 0 lx 0   qu 70 ri 49 sm 54 gh 70 gf 70 gv 64 b4 260 b5 331 ]")

;;}}}
;;{{{  the inaudible voice

(dtk-define-voice 'inaudible "")

;;}}}
(provide 'dtk-voices)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
