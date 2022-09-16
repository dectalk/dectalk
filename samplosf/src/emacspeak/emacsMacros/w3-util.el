
;;; w3-util.el,v --- Utility functions for other packages to interface to w3
;; Author: wmperry
;;$Id: w3-util.el,v 1.4 1995/09/06 22:11:22 raman Exp $
;; Created: 1995/03/09 20:35:12
;; Version: 1.27
;; Keywords: hypermedia
;;{{{  Copyright:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Copyright (c) 1995 by William M. Perry (wmperry@spry.com)
;;;
;;; This file is part of GNU Emacs.
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;}}}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; First, hyperlink stuff (<a ...>foo</a>)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defsubst w3-hyperlink-element-p (obj)
  "Return non-nil if and only if OBJ is a hyperlink object."
   (eq 'w3 (nth 0 obj)))

(defsubst w3-hyperlink-element-name (hobj)
  "Return the name of hyperlink object HOBJ.
This is the NAME or ID attribute of the HTML tag that started this
object.  It is used to resolve fragment links like \"#xxx\"."
   (nth 1 hobj))

(defsubst w3-hyperlink-element-href (hobj)
  "Return the destination of hyperlink object HOBJ.
This is the HREF or SRC attribute of the HTML tag that started this
object.  This is guaranteed to be a fully specified URL if non-nil."
   (nth 2 hobj))

(defsubst w3-hyperlink-element-text (hobj)
   (nth 3 hobj))

(defsubst w3-hyperlink-element-urn (hobj)
   (nth 4 hobj))

(defsubst w3-hyperlink-element-relationship (hobj)
   (nth 5 hobj))

(defsubst w3-hyperlink-element-reverse-relationship (hobj)
   (nth 6 hobj))

(defsubst w3-hyperlink-element-method (hobj)
   (nth 7 hobj))

(defsubst w3-hyperlink-element-title (hobj)
   (nth 8 hobj))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Then, images
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defsubst w3-image-element-p (obj)
  "Return non-nil if and only if OBJ is an inlined image object."
   (eq (nth 0 obj) 'w3graphic))

(defsubst w3-delayed-image-element-p (obj)
  "Return non-nil if and only if OBJ is a delayed inlined image object."
   (eq (nth 0 obj) 'w3delayed))

(defsubst w3-delayed-mpeg-element-p (obj)
  "Return non-nil if and only if OBJ is a delayed movie object."
   (eq (nth 0 obj) 'w3mpeg))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Then, form input areas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defsubst w3-input-element-p (obj)
  "Returns non-nil if and only if OBJ is a form input object."
   (eq 'w3form (nth 0 obj)))

(defsubst w3-input-element-action (formobj)
  "Returns the action information for the form object FORMOBJ.
This is a cons pair of (METHOD . URL), where METHOD specifies what
method to use to retrieve the form when it is submitted, and URL is a
fully specified URL pointing at where to submit the form data to."
   (nth 1 formobj))

(defsubst w3-input-element-type (formobj)
  "Returns the type of input area for the form object FORMOBJ.
This is a string (always uppercase) of what type of input object this
is.  Examples are CHECKBOX, RADIO, TEXTAREA, etc."
   (nth 2 formobj))

(defsubst w3-input-element-name (formobj)
  "Returns the name of the input area for the form object FORMOBJ."
   (nth 3 formobj))

(defsubst w3-input-element-default (formobj)
  "Returns the default value of the input area FORMOBJ.
This is a string or nil."
   (nth 4 formobj))

(defsubst w3-input-element-value (formobj)
  "Returns the current value of the input area FORMOBJ.
This is a string or nil."
   (nth 5 formobj))

(defsubst w3-input-element-is-checked (formobj)
  "Returns the current state of the input area FORMOBJ.
This is only useful for RADIO or CHECKBOX input elements."
   (nth 6 formobj))

(defsubst w3-input-element-size (formobj)
  "Returns the size of the input area FORMOBJ in characters.
This only applies to types like TEXT, INT, etc."
   (nth 7 formobj))

(defsubst w3-input-element-maxlength (formobj)
  "Returns the maximum length of the input area FORMOBJ, in characters.
This only applies to types like TEXT, INT, etc.  This may be nil if
there is no maximum length."
   (nth 8 formobj))

(defsubst w3-input-element-belongs-to (formobj)
  "Returns the identifier of the form input area FORMOBJ belongs to.
This can be passed to `w3-zones-matching' to get all input elements in
a form."
   (nth 9 formobj))

(defsubst w3-input-element-options (formobj)
  "Returns the list of options for form input area FORMOBJ.
This only has meaning for SELECT input areas."
   (nth 10 formobj))

(defsubst w3-input-element-id (formobj)
  "Returns the identifier for form input area FORMOBJ.
This is the ID attribute present on the HTML tag that caused the
creation of this input area."
   (nth 11 formobj))

(provide 'w3-util)

