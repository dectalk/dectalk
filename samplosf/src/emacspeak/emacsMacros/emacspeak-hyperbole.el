;;; $Id: emacspeak-hyperbole.el,v 1.3 1995/09/04 17:32:07 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Emacspeak extensions for Bob Weiner's excellent Hyperbole system
;;; Keywords: Emacspeak, Speech Access, Hyperbole
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

;;; Provide Emacspeak  advice to the hyperbole system

;;}}}

;;{{{  Fix default hyperbole menu:
(declaim (special hyperb:kotl-p))
;;; The default menu hyperbole displays sounds awful when spoken
;;;  Here we change it.

(declaim (special hui:menus))

(setq
 hui:menus
 (list (cons
	'hyperbole
	 (delq nil
	       (list
                (list "")
		'("Act"         hui:hbut-act
		  "Activates button at point or prompts for explicit button.")
		'("ButFile/"    (menu . butfile)
		  "Quick access button files menus.")
		'("Doc/"        (menu . doc)
		  "Quick access to Hyperbole documentation.")
		'("ExpBut/"       (menu . ebut)
		  "Explicit button commands.")
		'("GloBut/"       (menu . gbut)
		  "Global button commands.")
		'("ImpBut/"       (menu . ibut)
		  "Implicit button and button type commands.")
		'("Msg/"        (menu . msg)
		  "Mail and News messaging facilities.")
		(if hyperb:kotl-p
		    '("OutLin/"        (menu . otl)
		      "Autonumbered outlining and hyper-node facilities."))
		'("RoloDex/"       (menu . rolo)
		  "Hierarchical, multi-file rolodex lookup and edit commands.")
		'("WinConf/"       (menu . win)
		  "Window configuration management command.")
                '("Hist"        (hhist:remove current-prefix-arg)
		  "Jumps back to location prior to last Hyperbole button follow.")
		)))
       '(butfile .
                 (("Butfile>")
                  ("DirFile"      (find-file hbmap:filename)
                   "Edits directory-specific button file.")
                  ("Info"
                   (hact 'link-to-Info-node "(hyperbole.info)Button Files")
                   "Displays manual section on button files.") 
                  ("PersonalFile" (find-file
                                   (expand-file-name hbmap:filename hbmap:dir-user))
                   "Edits user-specific button file.")
                  ))
       '(doc .
             (("Doc>")
              ("Demo"         (find-file-read-only
                               (expand-file-name "DEMO" hyperb:dir))
               "Demonstrates Hyperbole features.")
              ("Files"        (find-file-read-only
                               (expand-file-name "MANIFEST" hyperb:dir))
               "Summarizes Hyperbole system files.  Click on an entry to view it.")
              ("Glossary"
               (hact 'link-to-Info-node "(hyperbole.info)Glossary")
               "Glossary of Hyperbole terms.")
              ("HypbCopy"  (progn
                             (hact 'link-to-string-match "* Copyright" 2
                                   (expand-file-name "README" hyperb:dir))
                             (setq buffer-read-only nil)
                             (toggle-read-only))
               "Displays general Hyperbole copyright and license details.")
              ("Info"      (hact 'link-to-Info-node "(hyperbole.info)Top")
               "Online Info version of Hyperbole manual.")
              ("MailLists"    (progn
                                (hact 'link-to-string-match "* Mail Lists" 2
                                      (expand-file-name "README" hyperb:dir))
                                (setq buffer-read-only nil)
                                (toggle-read-only))
               "Details on Hyperbole mail list subscriptions.")
              ("New"          (progn
                                (hact 'link-to-string-match "* What's New" 2
                                      (expand-file-name "README" hyperb:dir))
                                (setq buffer-read-only nil)
                                (toggle-read-only))
               "Recent changes to Hyperbole.")
              ("SmartKy"      (find-file-read-only (hypb:mouse-help-file))
               "Summarizes Smart Key mouse or keyboard handling.")
              ("Types/"       (menu . types)
               "Provides documentation on Hyperbole types.")
              ))
       '(ebut .
              (("EButton>")
               ("Act"    hui:hbut-act
                "Activates button at point or prompts for explicit button.")
               ("Create" hui:ebut-create)
               ("Delete" hui:ebut-delete)
               ("Edit"   hui:ebut-modify "Modifies any desired button attributes.")
               ("Help/"  (menu . ebut-help) "Summarizes button attributes.")
               ("Info"
                (hact 'link-to-Info-node "(hyperbole.info)Explicit Buttons")
                "Displays manual section on explicit buttons.")
               ("Modify" hui:ebut-modify "Modifies any desired button attributes.")
               ("Rename" hui:ebut-rename "Relabels an explicit button.")
               ("Search" hui:ebut-search
                "Locates and displays personally created buttons in context.")
               ))
       '(ebut-help .
                   (("Help on>")
                    ("BufferButs"   (hui:hbut-report -1)
                     "Summarizes all explicit buttons in buffer.")
                    ("CurrentBut"   (hui:hbut-report)
                     "Summarizes only current button in buffer.")
                    ("OrderedButs"  (hui:hbut-report 1)
                     "Summarizes explicit buttons in lexicographically order.")
                    ))
       '(gbut .
              (("GButton>")
               ("Act"    gbut:act        "Activates global button by name.") 
               ("Create" hui:gbut-create "Adds a global button to gbut:file.")
               ("Edit"   hui:gbut-modify "Modifies global button attributes.")
               ("Help"   gbut:help       "Reports on a global button by name.") 
               ("Info"   (hact 'link-to-Info-node "(hyperbole.info)Global Buttons")
                "Displays manual section on global buttons.")
               ("Modify" hui:gbut-modify "Modifies global button attributes.")
               ))
       '(ibut .
              (("IButton>")
               ("Act"    hui:hbut-act    "Activates implicit button at point.") 
               ("DeleteIButType"   (hui:htype-delete 'ibtypes)
                "Deletes specified button type.")
               ("Help"   hui:hbut-help   "Reports on button's attributes.")
               ("Info"   (hact 'link-to-Info-node
                               "(hyperbole.info)Implicit Buttons and Types")
                "Displays manual section on implicit buttons.")
               ("Types"  (hui:htype-help 'ibtypes 'no-sort)
                "Displays documentation for one or all implicit button types.")
               ))
       '(msg .
             (("Msg>")
              ("Compose-Hypb-Mail"
               (hmail:compose "hyperbole@hub.ucsb.edu" '(hact 'hyp-config))
               "Send a message to the Hyperbole discussion list.")
              ("Edit-Hypb-List-Entry"
               (hmail:compose "hyperbole-request@hub.ucsb.edu"
                              '(hact 'hyp-request))
               "Add, remove or change your entry on a hyperbole mail list.")
              ("Modify-Hypb-Announce-Entry"
               (hmail:compose "hyperbole-announce-request@hub.ucsb.edu"
                              '(hact 'hyp-request))
               "Add, remove or change your entry on a hyperbole mail list.")
              ))
       (if hyperb:kotl-p
	   '(otl
	     . (("Otl>")
		("All"       kotl-mode:show-all "Expand all collapsed cells.") 
		("Below"     kotl-mode:hide-sublevels
		 "Hide all cells in outline deeper than a particular level.")
		("Create"    kfile:find   "Create or edit an outline file.")
		("Example"   (find-file-read-only
			      (expand-file-name
			       "EXAMPLE.kotl" (concat hyperb:dir "kotl/")))
		 "Display a self-descriptive example outline file.")
		("Hide"      (progn (kotl-mode:is-p)
				    (kotl-mode:hide-tree (kcell-view:label)))
		 "Collapse tree rooted at point.")
		("Info"
		 (hact 'link-to-Info-node "(hyperbole.info)Outliner")
		 "Display manual section on Hyperbole outliner.")
		("Kill"      kotl-mode:kill-tree
		 "Kill ARG following trees starting from point.")
		("Link"      klink:create
		 "Create and insert an implicit link at point.")
		("Overview"  kotl-mode:overview
		 "Show first line of each cell.")
		("Show"      (progn (kotl-mode:is-p)
				    (kotl-mode:show-tree (kcell-view:label)))
		 "Expand tree rooted at point.")
		("Top"       kotl-mode:top-cells
		 "Hide all but top-level cells.") 
		("View"      kfile:view
		 "View an outline file in read-only mode.")
		)))
       '(rolo .
              (("Rolo>")
               ("Add"              rolo-add	  "Add a new rolo entry.")
               ("Display"          rolo-display-matches
                "Display last found rolodex matches again.")
               ("Edit"             rolo-edit   "Edit an existing rolo entry.")
               ("Info"   (hact 'link-to-Info-node "(hyperbole.info)Rolodex")
                "Displays manual section on Hyperbole rolodex.")
               ("Kill"             rolo-kill   "Kill an existing rolo entry.")
               ("Order"            rolo-sort   "Order rolo entries in a file.")
               ("RegexFind"        rolo-grep   "Find entries containing a regexp.")
               ("StringFind"       rolo-fgrep  "Find entries containing a string.")
               ("WordFind"         rolo-word   "Find entries containing words.")
               ("Yank"             rolo-yank
                "Find an entry containing a string and insert it at point.")
               ))
       '(types .
               (("Types>")
                ("ActionTypes"      (hui:htype-help   'actypes)
                 "Displays documentation for one or all action types.")
                ("IButTypes"        (hui:htype-help   'ibtypes 'no-sort)
                 "Displays documentation for one or all implicit button types.")
                ))
       '(win .
             (("WinConfig>")
              ("AddName"        wconfig-add-by-name
               "Name current window configuration.")
              ("DeleteName"     wconfig-delete-by-name
               "Delete named window configuration.")
              ("RestoreName"    wconfig-restore-by-name
               "Restore frame to window configuration given by name.")
              ("PopRing"        wconfig-delete-pop
               "Restores window configuration from ring and removes it from ring.")
              ("SaveRing"       wconfig-ring-save
               "Saves current window configuration to ring.")
              ("YankRing"       wconfig-yank-pop
               "Restores next window configuration from ring.")))))

;;}}}

(provide  'emacspeak-hyperbole)
;;{{{  emacs local variables 

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}
