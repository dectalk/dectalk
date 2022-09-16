;;; $Id: dtk-spatial.el,v 1.3 1995/08/17 16:10:57 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Use spatial audio with Emacspeak. 
;;; Keywords: Emacspeak, Dectalk (software) Spatialization
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
(require 'backquote)

(defun dtk-spatialize (azimuth elevation)
  "Set spatial coordinates"
  (declare (special dtk-speaker-process ))
  (process-send-string dtk-speaker-process
                       (format "dtk_synchronize;\
 dtk_set_spatial -azimuth %s -elevation  %s\n"
                               azimuth elevation )))

(defmacro dtk-with-spatial (a e &rest body )
  (` (unwind-protect
         (let ((dtk-stop-immediately nil ))
           (dtk-spatialize  (, a) (, e ))
           (,@ body)
           (dtk-spatialize 0 0 )))))

(provide 'dtk-spatial)

