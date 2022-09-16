;;; $Id: dtk-sh.el,v 3.120 1995/09/17 13:28:26 raman Exp $
;;; $Author: leeber$ 
;;; Description:  Interfacing to the Dectalk via TCL. 
;;; Keywords: Dectalk, TCL
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
(require 'dtk-macros)
(eval-when (compile)
  (provide 'dtk-sh) ;;keep byte compiler from recursing
  (require 'dtk-speak))

;;{{{  Introduction:

;;; This module defines the interface to the
;;; various speech drivers written in C
;;; This module is Dectalk specific. 

;;}}}
;;{{{  User customizations:

(defvar dtk-quiet nil
  "Switch indicating if the speech synthesizer is to keep quiet.
Do not set this variable by hand.
See command dtk-toggle-quiet bound to \\[dtk-toggle-quiet].")


(defvar dtk-split-caps t 
  "Flag indicating whether to use split caps when speaking.
Do not set this variable by hand, use command  dtk-toggle-split-caps
 bound to \\[dtk-toggle-split-caps]. ")

(defvar dtk-cleanup-patterns
  (list
   "." "_" "-"  "=" "/"  "+" "*" ":" ";" "%" 
   "$" ")" "#" "/\\" "<>" )
  "List of repeating patterns to clean up.
Use command  dtk-add-cleanup-pattern
 bound to \\[dtk-add-cleanup-pattern]  to add more patterns. 
Specify patterns that people use to decorate their ASCII files, and cause
untold pain to the speech synthesizer. ") 

;;}}}
;;{{{  internal variables

(defvar dtk-character-scale 1.25
  "Factor by which speech rate is scaled when characters are spoken.
 Do not set this variable by hand, use command
dtk-set-character-scale bound to \\[dtk-set-character-scale]. ")

(defvar dtk-capitalize nil
  "Non-nil means produce a beep to indicate  capitalization.
 Do not set this variable by hand, use command dtk-capitalize
bound to \\[dtk-capitalize]. ")

(defconst dtk-punctuation-mode-alist
  '(("some" . "some" )
    ("all" . "all")
    ("none" . "none"))
  "Alist of valid punctuation modes. ")
(defconst dtk-pronunciation-mode-alist
  '(("math" . "math")
    ("europe" . "europe")
    ("spell" . "spell")
    ("name" . "name"))
  "Alist of valid pronunciation  modes. ")


(defvar dtk-last-output nil
  "Variable holding last output")

(defvar dtk-speech-rate 375
  "Rate at which dectalk talks.
Do not modify this variable directly; use command  dtk-set-rate
 bound to \\[dtk-set-rate]. ")

;;}}}
;;{{{  Helpers to handle invisible text:

    (defsubst text-visible-p (position)
    (not (get-text-property position 'invisible )))


    (defsubst text-invisible-p (position)
     (get-text-property position 'invisible ))

     (defsubst skip-invisible-forward  ()
     (and (text-invisible-p (point))
     (goto-char
      (or (next-single-property-change (point) 'invisible )
      (point-max)))))
;;; Delete invisible text from current buffer:
(defsubst skip-invisible-backward  ()
     (and (text-invisible-p (point))
     (goto-char
      (or (previous-single-property-change (point) 'invisible )
      (point-min)))))

      (defsubst delete-invisible-text ()
(goto-char (point-min))
(let ((start  (point ))
      (end nil ))
  (while (not (eobp))
    (cond
     ((text-invisible-p (point ))
      (skip-invisible-forward)
      (delete-region  start (point ))
      (setq start (point )))
(t (goto-char
    (or (next-single-property-change (point) 'invisible )
        (point-max )))
   (setq start (point)))))))

;;}}}
;;{{{  define inline functions first

;;; helper function:

;;; Quote the string in current buffer so sh does not barf.
;;; Fix brackets by changing to text.
 ;;; This is necessary because
;;;  [] marks dtk commands; {} is special to sh

(defconst dtk-bracket-regexp "[][{}]"
  "Brackets that are special to dtk and sh ")

(defsubst  dtk-fix-brackets (mode)
  (declare  (special dtk-bracket-regexp ))
  (save-excursion 
    (cond
     ((string=  "all"  mode )
      (while (re-search-forward dtk-bracket-regexp  nil t )
        (cond
         ((= ?{ (char-after (match-beginning 0 )))
          (replace-match "left brace "))
         ((= ?} (char-after (match-beginning 0 )))
          (replace-match " right brace "))
         ((=  ?\] (char-after (match-beginning 0)))
          (replace-match " right bracket "))
         ((= ?\[ (char-after  (match-beginning 0)))
          (replace-match " left bracket ")))))
     (t (save-match-data
          (while (re-search-forward dtk-bracket-regexp   nil t )
            (replace-match " " nil t )))))))

(defsubst dtk-handle-single-caps ()
  (goto-char (point-min))
  (save-match-data
    (while (re-search-forward " [A-Z] " nil t)
    (replace-match  " cap \\&" ))))

(defsubst dtk-fix-control-chars ()
  (declare (special dtk-character-to-speech-table))
  (let ((control "[\001-\037]"))
    (goto-char (point-min ))
    (save-match-data 
      (while (re-search-forward control nil t )
        (or  (= (char-after (match-beginning 0)) 10)
             (= (char-after (match-beginning 0)) 9)
             (replace-match
              (format " %s " (aref  dtk-character-to-speech-table
                                    (char-after (match-beginning 0 ))))))))))

(defsubst  dtk-quote(mode ) 
  (declare (special dtk-cleanup-patterns
                    dtk-capitalize))
  (goto-char (point-min))
      ;;; First cleanup  repeated patterns:
  (save-excursion
    (mapcar 
     (function (lambda (str)
                 (dtk-replace-duplicates str mode )))
     dtk-cleanup-patterns ))
    ;;; dtk will think it's processing a command otherwise:
  (dtk-fix-brackets mode)
  ;;; fix control chars
  (dtk-fix-control-chars))

;;; Moving  across a chunk of text. 
;;; A chunk  is specified by a punctuation followed by whitespace
;;; or  multiple blank lines
;;; or a comment start or end
;;; or a parenthesis grouping start or end 
;;; leaves point at the end of the chunk.
;;; returns  distance moved; nil if stationery
(defvar dtk-chunk-separator-syntax "^."
  "Syntax string to identify chunks when splitting text. ")

;;; Invariance: at front of visible text:
;;; stop moving at clause boundary 
(defsubst  dtk-move-across-a-chunk ()
  (declare (special dtk-chunk-separator-syntax ))
  (skip-syntax-forward ".")
  (let ((done nil )
        (orig (point ))
        (moved (skip-syntax-forward dtk-chunk-separator-syntax )))
    (while (and  (not done )
                 (not (eobp )))
      (skip-syntax-forward ".")
      (cond
                                        ; fail if you did not move 
       ((zerop moved) (goto-char orig )
        (setq done t))
                                        ; if  punctuation, look for  ws
       ((or (eolp)
            (and (char-after  (point))
                 (= 32 (char-syntax (preceding-char )))))
        (skip-syntax-forward " ")
        (setq done t))
                                        ; otherwise continue looking 
       (t (setq moved (skip-syntax-forward dtk-chunk-separator-syntax )))))
    (or (not (zerop moved))
        (re-search-forward "\n\n+" nil t ))))

;Internal function used by dtk-speak to send text out.
;Handles voice locking etc.
; assumes in dtk-scratch-buffer
;start and end give the extent of the text to be spoken. 
(defsubst dtk-format-text-and-speak (start end )
  (declare (special voice-lock-mode  dtk-current-voice
                    dtk-speaker-process ))
  (cond
   ((and (boundp 'voice-lock-mode) voice-lock-mode)
    (let ((last  nil)
          (personality (get-text-property start 'personality )))
      (while (and (< start end )
                  (setq last
                         (next-single-property-change  start 'personality
                                                          (current-buffer) end)))
        (if personality 
            (dtk-with-voice
             personality 
             (process-send-string dtk-speaker-process
                                  (format "queue_speech { %s }  \n"
                                          (buffer-substring start last ))))
          (process-send-string dtk-speaker-process
                               (format "queue_speech { %s }  \n"
                                       (buffer-substring  start last))))
        (setq start  last
              personality (get-text-property last  'personality))) ; end while
      ))                                ; end clause 
   (t (process-send-string dtk-speaker-process
                           (format "queue_speech  { %s }  \n"
                                   (buffer-substring start end  ))))))

;Force the speech. 
(defsubst dtk-force ()
  (declare (special dtk-speaker-process ))
  (process-send-string dtk-speaker-process
                       "dectalk_speak {} \n"))

;Write out the string to the dectalk via SH.
;No quoting is done, if want to quote the text, see dtk-speak
(defsubst dtk-dispatch (string)
  (declare (special dtk-speaker-process
                    dtk-quiet)) 
  (unless dtk-quiet
          (process-send-string dtk-speaker-process
                               (format  "dectalk_say { %s }\n " string ))))

(defsubst dtk-stop ()
  "Stop speech now.
 Assumes interfacing to the Dectalk via an appropriate SH. " 
  (interactive)
  (declare (special dtk-speaker-process ))
  (process-send-string dtk-speaker-process
                       (format "dectalk_stop \n" )))

;;}}}
;;{{{  adding cleanup patterns:

(defun dtk-add-cleanup-pattern () 
  "Add this pattern to the list of repeating patterns that are cleaned up. "
  (interactive)
  (declare (special dtk-cleanup-patterns ))
  (setq dtk-cleanup-patterns
        (cons
         (read-from-minibuffer "Specify repeating pattern: ")
         dtk-cleanup-patterns ))
  )

;;}}}
;;{{{  producing output via tcl 

;;; Filter function to record last output from tcl

(defun dtk-filter-function (proc output)
  (declare (special dtk-last-output))
  (setq dtk-last-output output))

                                        ;Takes  a string, and replaces occurences of this pattern that
                                        ;are longer than 3 by
                                        ;a string of the form \"count string\".
                                        ;Second argument, mode, is the pronunciation mode being used to speak.
;;; Removing repeated chars, and replacing them by a count:
(defun dtk-replace-duplicates (string mode)
  (let* ((pattern (regexp-quote string))
         (reg (concat
               pattern pattern 
               "\\(" pattern  "\\)+")))
    (save-excursion
      (save-match-data
        (while (re-search-forward reg nil t)
          (replace-match
           (if  (string= "all" mode) 
               (format " aw %s %s"
                       (/ (- (match-end 0 ) (match-beginning 0))
                          (length string))
                       pattern )
             "")))))))

;;; Uses the syntax table belonging to the buffer that owns the text
;;; to parse and speak the text intelligently.


(defun dtk-speak (text &optional wait)
  "Speak the text string on the  dectalk, 
by passing through an appropriate tcl.
No-op if variable dtk-quiet is set to nil.
If optional arg wait is non-nil, then this function returns after the speech
has been completed.
 If outline-minor-mode is t, only speak upto the first ctrl-m. "
  (declare (special dtk-speaker-process dtk-stop-immediately
                    dtk-quiet 
                    voice-lock-mode dtk-current-voice  dtk-punctuation-mode
                    selective-display outline-minor-mode))
  ; If you dont want me to talk, I wont.
  (unless  dtk-quiet
           ; ensure  the process  is live
  (or (eq 'run (process-status dtk-speaker-process ))
      (dtk-initialize) )
                                        ; flush previous speech if asked to 
  (when dtk-stop-immediately
    (dtk-stop )
    (if (and (boundp 'voice-lock-mode ) voice-lock-mode)
        (dtk-dispatch
         (dtk-get-voice-command dtk-current-voice ))))
  (or (stringp text) (setq text (format "%s" text )))
  (let ((ctrl-m nil ))
    (when (and text 
               (or (and (boundp 'outline-minor-mode) outline-minor-mode)
                   (and (boundp  'selective-display ) selective-display ))
               (setq ctrl-m (string-match "\015" text )))
      (setq text (substring  text 0 ctrl-m ))))
  (let ((syntax-table (syntax-table ))
        (start 1)
        (end nil )
        (dtk-scratch-buffer (get-buffer-create " *dtk-scratch-buffer* "))
        (mode dtk-punctuation-mode)
        (voice-lock (and (boundp 'voice-lock-mode)
                         voice-lock-mode )))
    (save-excursion
      (set-buffer dtk-scratch-buffer )
      (erase-buffer)
      (set-syntax-table syntax-table )
      (setq voice-lock-mode voice-lock)
      (insert  text)
      (delete-invisible-text)
      (dtk-quote mode)
      (goto-char (point-min))
      (while (and (not (eobp))
                  (dtk-move-across-a-chunk ) )
        (setq end (point ))
        (dtk-format-text-and-speak  start end )
        (setq start  end))              ; end while
                                        ; process trailing text
      (or (eobp) 
          (dtk-format-text-and-speak start (point-max )))))
  (when  wait (accept-process-output dtk-speaker-process 0 1)
         (setq dtk-last-output nil))
  (dtk-force)
  (when (and wait (not dtk-last-output ))
    (accept-process-output dtk-speaker-process ))))

(defun dtk-speak-list (text )
  "Speak a  list of strings. "
  (declare (special dtk-speaker-process dtk-stop-immediately
                    voice-lock-mode dtk-punctuation-mode))
                                        ; ensure  the process  is live 
  (unless (eq 'run (process-status dtk-speaker-process ))
    (dtk-initialize) )
                                        ; flush previous speech if asked to 
  (when dtk-stop-immediately (dtk-stop ))
  (let ((syntax-table (syntax-table ))
        (start 1)
        (end nil )
        (dtk-scratch-buffer (get-buffer-create " *dtk-scratch-buffer* "))
        (mode dtk-punctuation-mode)
        (voice-lock voice-lock-mode ))
    (save-excursion
      (set-buffer dtk-scratch-buffer )
      (set-syntax-table syntax-table )
      (setq voice-lock-mode voice-lock)
      (while text 
        (erase-buffer)
        (insert  (car text))
        (setq text (cdr text))
        (dtk-quote mode)
        (goto-char (point-min))
        (while (and (not (eobp))
                    (dtk-move-across-a-chunk ) )
          (setq end (point ))
          (dtk-format-text-and-speak  start end )
          (setq start  end))            ; end while
                                        ; process trailing text 
        (unless (eobp) 
          (dtk-format-text-and-speak start (point-max )))
        (dtk-tone 500 50)
        (setq start 1 end nil )
        )))
  (dtk-force))
      
  
  
(defun dtk-letter (letter)
  "Speak a letter"
  (declare (special dtk-speaker-process
                    dtk-quiet ))
  (unless dtk-quiet
          (process-send-string dtk-speaker-process
                       (format "dectalk_letter %s\n" letter ))))

                                        ;Say these words, ie speak each of them as a word.
                                        ; Text is sent via the appropriate TCLSH. 
(defun dtk-say (words)
  "Say these words"
  (declare (special dtk-speaker-process dtk-stop-immediately
                    dtk-punctuation-mode  dtk-quiet ))
  ;; I wont talk if you dont want me to
  (unless dtk-quiet 
  (or (eq 'run (process-status dtk-speaker-process ))
    (dtk-initialize) )
  (and dtk-stop-immediately (dtk-stop ))
  (let ((dtk-scratch-buffer (get-buffer-create "*dtk-scratch-buffer*"))
        (mode  dtk-punctuation-mode ))
    (save-excursion
      (set-buffer dtk-scratch-buffer )
      (erase-buffer)
      (insert words )
      (delete-invisible-text)
      (dtk-quote mode)
      (process-send-string dtk-speaker-process
                           (format "dectalk_say { %s }  \n"
                                   (buffer-string)))))))


(defun dtk-tone (&optional  pitch duration wait)
  "Produce a tone. Optional args: pitch 400 duration 50 wait nil  "
  (declare (special dtk-quiet ))
  (unless dtk-quiet 
  (or pitch (setq pitch 440))
  (or duration (setq duration 50 ))
  (declare (special dtk-speaker-process dtk-last-output  )) 
  (process-send-string dtk-speaker-process
                       (format "dectalk_tone   %d   %d\n"
                               pitch duration ))
  (dtk-force)
  (when  wait (accept-process-output dtk-speaker-process 0 5)
         (setq dtk-last-output nil)
         (dtk-force)
         (when  (not dtk-last-output )
           (accept-process-output dtk-speaker-process )))))

;;}}}
;;{{{  sending commands 

(defun dtk-set-rate (rate    &optional prefix)
  "Set speaking rate for the dectalk.
Interactive prefix arg means set   the global default value, and then set the
current local  value to the result. "
  (interactive "nEnter new rate:\nP")
  (declare (special dtk-speech-rate dtk-speaker-process))
  (cond
   (prefix
      (setq-default dtk-speech-rate rate )
  (setq dtk-speech-rate rate))
   (t (make-local-variable 'dtk-speech-rate )
      (setq dtk-speech-rate rate)))
  (process-send-string dtk-speaker-process
                       (format "dectalk_set_speech_rate %s; \
dectalk_speak {set speaking rate to %s %s}\n"
                               rate
                               rate (if prefix "" " locally"))))

(defun dtk-set-character-scale (factor &optional prefix)
  "Set scale factor by which speech rate is scaled when
 speaking characters.
Interactive prefix arg means set   the global default value, and then set the
current local  value to the result. "
  (interactive "nEnter new factor:\nP")
  (declare (special dtk-character-scale dtk-speaker-process ))
  (cond
   (prefix
      (setq-default dtk-character-scale factor)
       (setq dtk-character-scale factor))
   (t (make-local-variable 'dtk-character-scale)
      (setq dtk-character-scale factor)))
  (process-send-string dtk-speaker-process
                       (format "dectalk_set_character_scale %s; \
dectalk_speak {Set character scale factor to %s %s}\n"
                               dtk-character-scale dtk-character-scale
                               (if  prefix "locally"  ""))))


(defun dtk-toggle-quiet (&optional prefix)
  "Toggle state of the speech device between being quiet and talkative.
Useful if you want to continue using an emacs session that has emacspeak
loaded
but wish to make the speech shut up."
  (interactive "P")
  (declare (special dtk-speaker-process dtk-quiet ))
  (message "Turned %s speech synthesizer %s. "
           (if dtk-quiet "on" "off" )
           (if prefix "" " locally"))
  (cond
   (prefix
    (setq-default  dtk-quiet
                   (not  (default-value 'dtk-quiet )))
    (setq dtk-quiet (default-value 'dtk-quiet )))
   (t (make-local-variable 'dtk-quiet)
    (setq dtk-quiet 
            (not dtk-quiet ))))
  (message "Turned %s speech synthesizer %s. "
           (if dtk-quiet "off" "on" )
           (if prefix "" " locally")))

(defun dtk-toggle-split-caps (&optional prefix )
  "Toggle split caps mode.
Split caps mode is useful when reading Hungarian notation in program source
code.
 Interactive prefix arg means toggle  the global default value, and then
set the current local  value to the result. "
  (interactive "P")
  (declare (special dtk-speaker-process dtk-split-caps))
  (cond
   (prefix
    (setq-default  dtk-split-caps
                   (not  (default-value 'dtk-split-caps )))
    (setq dtk-split-caps (default-value 'dtk-split-caps )))
   (t (make-local-variable 'dtk-split-caps)
    (setq dtk-split-caps 
            (not dtk-split-caps ))))
  (process-send-string dtk-speaker-process
                       (format "dectalk_split_caps %s\n"
                               (if dtk-split-caps 1 0 )))
  (message "Turned %s split caps mode%s. "
           (if dtk-split-caps "on" "off" )
           (if prefix "" " locally")))

(defun dtk-toggle-capitalization  (&optional prefix)
  "Toggle capitalization.
 when set, capitalization is indicated by a short beep.
Interactive prefix arg means toggle  the global default value, and then set the
current local  value to the result. "
  (interactive "P")
  (declare (special dtk-speaker-process dtk-capitalize))
  (cond
   (prefix
    (setq-default  dtk-capitalize
                   (not  (default-value 'dtk-capitalize )))
    (setq dtk-capitalize (default-value 'dtk-capitalize )))
   (t (make-local-variable 'dtk-capitalize)
      (setq dtk-capitalize 
            (not dtk-capitalize ))))
  (process-send-string dtk-speaker-process 
                       (format "dectalk_capitalize  %s\n"
                               (if dtk-capitalize  1 0 )))
  (message "Turned %s capitalization  mode%s. "
           (if dtk-capitalize  "on" "off" )
           (if prefix "" " locally")))

(defun dtk-set-punctuations  (mode &optional prefix ) 
  "Set punctuation state.
Possible values are `some', `all', or `none'.
Interactive prefix arg means set   the global default value, and then set the
current local  value to the result. "
  (interactive
   (list
    (completing-read  "Enter punctuation mode: "
                      dtk-punctuation-mode-alist 
                      nil
                      t)
    current-prefix-arg))
  (declare (special dtk-punctuation-mode dtk-speaker-process
                    dtk-punctuation-mode-alist))
  (cond
   (prefix
    (setq dtk-punctuation-mode mode )
      (setq-default dtk-punctuation-mode mode))
   (t (make-local-variable 'dtk-punctuation-mode)
      (setq dtk-punctuation-mode mode )))
  (process-send-string dtk-speaker-process  
                       (format "dectalk_set_punctuations %s;\
 dectalk_speak {set punctuation mode to %s}\n"
                               mode mode )))

(defun dtk-set-pronunciation-mode  (mode state  )
  "Set pronunciation mode.
This command is valid only for newer Dectalks, e.g.
the Dectalk Express.  
Possible values are `math, name, europe, spell',
all of which can be turned on or off. "
  (interactive
   (list
    (completing-read  "Enter pronunciation  mode: "
                      dtk-pronunciation-mode-alist nil t)
    (y-or-n-p "Turn it on ")))
  (declare (special dtk-pronunciation-mode-alist))
  (dtk-dispatch
   (format "[:mode %s %s]"
           mode
           (if state "on" "off"))))


;;}}}
(provide 'dtk-sh)
;;{{{  local variables

;;; local variables:
;;; folded-file: t
;;; end: 

;;}}}

