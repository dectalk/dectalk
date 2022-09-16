;;; $Id: emacspeak-tabulate.el,v 1.16 1995/08/18 18:04:01 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Utility to help emacspeak identify tabulated information
;;; Keywords: Emacspeak, Tabulated Data,  Visual layout gives structure
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


;;{{{  Introduction:
;;; This module is a simple table recognizer.
;;; Can recognize the columns in tabulated output, e.g. ps, ls output

;;}}}
;;{{{  helper functions:

;;; An interval is a cons of start and end 
(defsubst ems-make-interval (start end ) (cons start end ))
(defsubst ems-interval-start (interval) (car interval ))
(defsubst ems-interval-end (interval) (cdr interval  ))
(defsubst ems-intersect-intervals (i1 i2)
  (let  ((i (cons (max (ems-interval-start i1)
                       (ems-interval-start i2))
                  (min (ems-interval-end i1)
                       (ems-interval-end i2 )))))
    (if (< (car i) (cdr i)) i nil )))

;;}}}
;;{{{  Identify the fields in a region 

(defun emacspeak-fields-in-this-line () 
  "Returns a list of intervals 
specifying the  field separators on the line. 
Fields are assumed to be delimited by whitespace. "
  (let ((positions nil )
        (beg nil)
        (end nil)
        (first nil)
        (last nil))
    (save-excursion
      (end-of-line)
      (setq end (point ))
      (beginning-of-line)
      (skip-syntax-forward " ")
      (setq beg (point )) 
      (while (<= (point)  end )
        (unless (zerop (skip-syntax-forward "^ "))
          (setq first  (current-column  )))
        (unless (zerop (skip-syntax-forward " "))
          (setq last (current-column)))
        (and first last
             (push (ems-make-interval  first last  ) positions))
        (setq first nil
              last nil ))
      (nreverse  positions ))))

(defun emacspeak-fields-in-region (start end )
  "Return a list of column separators. "
  (when  (< end start )
    (let ((tmp end))
      (setq end start
            start tmp )))
  (save-restriction 
    (narrow-to-region start end )
    (save-excursion
      (goto-char start )
      (let  ((try nil)
             (first nil)
             (last nil)
             (interval nil)
             (new-guesses nil)
             (guesses (emacspeak-fields-in-this-line )))
        (while (and guesses
                    (< (point) end)
                    (not (= 1 (forward-line 1))))
          (setq try guesses)
          (while try
            (beginning-of-line )
            (goto-char (+ (point )  (ems-interval-start   (car try ))))
            (skip-syntax-forward "^ ")
            (setq first (current-column))
            (skip-syntax-forward " ")
            (setq last (current-column ))
            (setq interval
                  (ems-intersect-intervals (car try)
                                           (ems-make-interval first last )))
            (cond
             (interval
              (push (car try) new-guesses)
              (pop try ))
             (t (pop try )))
            (setq first nil
                  last nil
                  interval nil ))
          (end-of-line)
                    (setf guesses (nreverse new-guesses) 
                          new-guesses nil))
        guesses ))))

(defun emacspeak-tabulate-region (start end  &optional mark-fields)
  "Voicifies the columns of a table if one found.
 Optional interactive prefix arg mark-fields specifies if the header row
information
is used to mark fields in the columns."
  (interactive "r\nP")
  (let ((columns   (emacspeak-fields-in-region start end ))
        (dtk-stop-immediately nil)
        (read-only-state buffer-read-only)
        (personality-table (emacspeak-possible-voices ))
        (last-line-start nil)
        (header "")
        (col-begin nil)
        (col-end nil )
        (col-start 0))
    (unwind-protect
        (progn
          (setq buffer-read-only nil)
          (dtk-speak (format  "Detected %s columns."
                              (length columns )) )
          (sit-for 1)
          (save-excursion
            (goto-char end)
            (beginning-of-line)
            (setq last-line-start (point))
            (goto-char start )
            (setq col-begin start )
            (while columns
              (goto-char last-line-start )
              (forward-char(ems-interval-end   (car columns)))
              (setq header 
                    ( buffer-substring  col-begin 
                                        (+  start(ems-interval-end  (car columns )))))
              (emacspeak-voicify-rectangle col-begin (point)
                                           (read
                                            (completing-read
                                             (format
                                              "Personality for column %s from  %s through %s"
                                              header col-start  (current-column))
                                             personality-table  nil t )))
              (and mark-fields
                   (emacspeak-put-text-property-on-rectangle
                    col-begin (point)
                    'field-name header ))
              (goto-char start )
              (setq col-start(ems-interval-end  (car columns)))
              (forward-char(ems-interval-end  (car columns)))
              (setq col-begin (point))
              (setq columns (cdr columns )))))
      (setq buffer-read-only read-only-state))))
;;}}}
(provide 'emacspeak-tabulate)

;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
