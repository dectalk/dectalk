
			      Emacspeak
			    User's Manual
		First Edition, Emacspeak Version 4.2A
		    Digital Equipment Corporation

COPYRIGHT NOTICE 

Copyright (c) Digital Equipment Corporation, 1993, 1994, 1995, 1996.  All
Rights reserved. Unpublished rights reserved under the copyright laws
of the United States. Copyright is claimed in the computer program and
user interface thereof.  The software contained on this media is
proprietary to and embodies the confidential technology of Digital
Equipment Corporation. Possession, use, duplication or dissemination
of the software and media is authorized only pursuant to a valid
written license from Digital Equipment Corporation.  The name of
Digital Equipment Corporation may not be used to endorse or promote
products derived from this software without specific prior written
permission. All other rights reserved.

THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF
NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
Digital assumes no responsibility AT ALL for the use or reliability of
this software.  USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT
IS SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c) DFARS
252.227-7013, OR IN FAR 52.227-19 OR IN 52.227-14 ALT III, AS
APPLICABLE

Contents
  Introduction	
  Synthesizers Supported	
  DECtalk Software	
  Installation	
  Quick Installation	
  Configuring and Installing Emacspeak	
  Basic Usage	
  Movement	
  Action	
  Miscellaneous	
  Compatibility with Emacs subsystems	
  Advanced Features	
  Hooks	
  Acknowledgements	

Introduction
------------

Emacspeak is an Emacs subsystem that allows the user to get feedback
using synthesized speech. Screen reading programs allow a visually
impaired user to get feedback using synthesized speech. Such programs
have been commercially available for well over a decade. Most of them
run on PC's under DOS, and there are now a few screen-readers for the
Windows platform.  However, screen-readers for the UNIX environment
have been conspicuous in their absence.

This means that most visually impaired computer users face the
additional handicap of being DOS-impaired --- a far more serious
problem.  Emacspeak is an emacs subsystem that provides basic speech
access functionality. Emacspeak will always have the shortcoming that
it will only work under Emacs. This said, there is very little that
cannot be done inside Emacs, so it's not a real shortcoming.

Emacspeak does have a significant advantage: since it runs inside
Emacs, a structure-sensitive, fully customizable editor, Emacspeak
often has more context-specific information about what it is speaking
than its commercial counterparts.  In this sense, Emacspeak is not a
``screenreader'', it is a subsystem that produces speech output.  A
traditional screen-reader speaks the content of the screen, leaving it
to the user to interpret the visually laid-out information.
Emacspeak, on the other hand, treats speech as a first-class output
modality; it speaks the information in a manner that is easy to
comprehend when listening.

This initial version provides a basic speech subsystem for Emacs;
using Emacs' power and flexibility, it has proven straightforward to
add modules that customize how things are spoken, e.g. depending on
the major/minor mode of a given buffer.  Note that the basic speech
functionality provided by Emacspeak is sufficient to use most Emacs
packages effectively; adding package-specific customizations makes the
interaction much smoother.  This is because package- specific
extensions can take advantage of the current context. Emacspeak
currently comes with speech extensions for several popular Emacs
subsystems and editing modes.

     W3 for surfing the WWW.  

     VM For reading and replying to email.  
 
     Gnus  for reading Usenet news.  

     Calendar for maintaining appointments etc.  
 
     auctex for editing TeX and LaTeX.  
 
     Dired for navigating a file system.  
 
     C and C++ editing extensions.  
 
     Calc for working with the Emacs Calculator.  
 
     Info for listening to online documentation.  
 
     Folding for using Emacs as a structured folding editor.  
 
     Tempo a package that allows for editing templates.  
           This extension makes html-helper-mode speech friendly.  
 
     Ispell for spell checking files.  
 
     Eterm for launching terminal based programs.      
         This extension enables you to login to another system and get
         spoken feedback, as well as running programs that can only be run from
         the shell.  Note: eterm is a new improved terminal emulator by Perl
         Bothner (bothner@cygnus.com)

     Buffer-menu for navigating through the list of currently open buffers.

     Comint for command interpreters running in an inferior process.  

     In addition, other editing modes like Perl and TCL modes work fluently
     with emacspeak Emacspeak.

Emacs-19's font-locking facilities are extended to the speech output
as well; for instance, a user can customize the system to have
different types of text spoken using different kinds of voices (speech
fonts).  Currently, this feature is used to provide ``voice locking``
for many popular editing modes like c-mode, tcl-mode, perl-mode,
emacs-lisp-mode etc.

The basic concepts used by Emacspeak are simple; all of the Emacs
cursor movement commands as well as the various input-output functions
are adapted to provide speech feedback.  Hence, a user can just use
Emacs as they normally would; Emacspeak works behind the scene to give
audio feedback in addition to updating the screen.

Synthesizers Supported 
----------------------
Emacspeak currently supports the DECtalk Software (using dtk-mme). 

DECtalk Software
----------------
DECtalk Software is a Dectalk Speech Synthesizer that runs in
software on the Digital UNIX workstations.  This software library
allows user applications to produce synthesized speech.

To use the DECtalk Software with Emacspeak, you need to install DECtalk 
Software on your workstation.

Installation
------------

This chapter of the manual deals with getting, configuring, compiling, and 
installing Emacspeak.

Quick Installation
------------------

Here are the quick installation instructions.  See the next section
for detailed installation instructions.

For help on installation type "make help".

Look over the Makefile and edit site-specific variables.
Type "make copy" to copy the sources to a user area.
cd over to the directory to which the source files were copied.
Type "make config" to configure the sources for your site.
Type "make emacspeak" to compile the files.

To Run it do one of the following:

Start Emacs as follows: 
      emacs -l <emacspeak-dir>/emacspeak-setup.el -l ~/.emacs 	    

To the top of your .emacs file add the line: 		
      (load-file "<emacspeak-dir>/emacspeak-setup.el") 
 	    

Run the shell script emacspeak.sh found in the directory  <emacspeak-dir>

In the above, <emacspeak-dir> refers to the directory where you copied
the sources.

Configuring and Installing Emacspeak
------------------------------------

Note: You need GNU Emacs 19 (19.23 or later) for using Emacspeak.
Emacspeak may work with other flavors of Emacs19, e.g. xemacs, but it
has not been tried.

Decide where you want the Emacspeak elisp files.  Most Unix packages
are unpacked and compiled in one directory, and then the executable,
documentation, and data files are installed in the appropriate system
directories.  However, Emacspeak elisp byte-compiled files are
conventionally left in the same directory as the source files.  One
reasonable choice would be /usr/local/lib/emacs/site-lisp/emacspeak.

Once you have decided on the appropriate directory, copy it from
/usr/opt/DTKRT420/emacspeak/Macros/.  To do this  automatically, use
the Makefile in /usr/opt/DTKRT420/emacspeak/Macros/.  Edit it and
change DESTDIR to point to the destination directory of your choice.
To start copying the files type:
     make copy

The directory prefix for installation.  The default is /usr/local, so
the executable file dtk-mme goes to /usr/local/bin.  To change this,
edit the line defining BINDIR in the Makefile.

Configure the source files by typing 
      make config

Next, compile the elisp files by typing 
	make emacspeak

The driver program can also be specified at run time by setting the shell  
environment variable DTK_PROGRAM. Note: This is the default value.   

Examples: 

 If using csh or tcsh 
	setenv DTK_PROGRAM "dtk-soft"

 If using sh or bash
	DTK_PROGRAM=dtk-soft 	
        export DTK_PROGRAM

You can always set this variable from a running Emacs session by
executing the Emacs setenv command.

Starting Emacspeak

To use emacspeak you can do one of the following:
     To the start of your .emacs file add the line:

     (load-file (expand-file-name "<emacspeak_dir>/emacspeak-setup.el"))

This will start emacspeak every time you use Emacs.  (This might not
be a good idea if a sighted person often uses your account.)

Alternatively, define emacspeak as an alias.  

If you use csh or tcsh:
 alias emacspeak "emacs -q -l <emacspeak_dir>/emacspeak-setup.el -l $HOME/.emacs"

If you use bash (the default under linux):
 alias emacspeak="emacs -q -l <emacspeak_dir>/emacspeak-setup.el -l $HOME/.emacs"
 
This could go into the system-wide initilization file (/etc/profile)
or in the personal initialization file (in ~/.bash_profile,
~/.bash_login, or ~/.profile) 

Note: in all of the above you should of course replace <emacspeak_dir> with 
your site-specific value.

Use the emacspeak.sh shell script which is equivalent to the above
alias.   emacspeak.sh is created during the config stage.

Using any one of these methods will:
  Add the Emacspeak code directory to the load-path. 	
  Load the relevant libraries. 	
  Start up Emacspeak.

Basic Usage
-----------
All Emacs navigation and editing commands have been speech
enabled. Thus, moving to the next or previous word, line or sexp
results in the text around point being spoken.  Exactly how much text
is spoken is determined by the amount by which point moves. In
addition, Emacspeak provides basic reading functions that can be
invoked to listen to chunks of text without moving point.
 
Movement
--------
All of the normal Emacs movement commands will speak the relevant
information after moving.  Here are some of the cursor movement
functions that have been speech enabled.  Note that this list only
enumerates a few of these speech enabled commands; the purpose of
emacspeak is to speech-enable all of emacs and provide you spoken
feedback as you work.  Thus, this list is here only as a
representative example of the kind of speech-enabling extensions
Emacspeak provides.

C-n 
M-x next-line 
DOWN	
Speaks line moved to.
C-p 
M-x previous-line 
UP	
Speaks line moved to.
M-f 
M-x forward-word 	
Speaks word moved to.  Places point on the first character of the next
work, rather than on the space preceding it

M-b 
M-x backward-word 	
Speaks word moved to.

M-C-f 
M-x forward-sexp 	
Speaks sexp moved to.  If the sexp spans more than a line, only the
first line is spoken.

M-C-b 
M-x backward-sexp 	
Speaks sexp moved to.  If the sexp spans more than a line, only the
first line is spoken.

M-< 
M-x beginning-of-buffer 	
Speaks line moved to.
M-> 
M-x end-of-buffer 	
Speaks line moved to.
M-m 
M-x back-to-indentation 	
Speaks entire current line. A useful way of hearing the current line.

 For a complete list of the functions that have been advised, see file
'emacspeak-advice.el'.

Action
------
While typing in an Emacs buffer, hitting space speaks the recently
typed word. Under Emacs19, use 'load-library ret completion ret' for
loading the completion package.

The standard Emacs I/O functions have also been advised to speak.  All
forms of completion, including minibuffer completion, provide speech
feedback.

In addition, Emacspeak provides a number of commands for reading
portions of the current buffer, getting status information, and
modifying Emacspeak's state.  All of the commands are documented in
the subsequent sections.  They can be classified into types:

Emacspeak commands for listening to chunks of information.  The names
of these commands all start with the common prefix 'emacspeak-'.  All
Emacspeak commands are bound to the keymap emacspeak-keymap and are
accessed with the key Control-e.  Thus, the Emacspeak command
emacspeak-speak-line is bound to 'l' in keymap emacspeak-keymap and
can be accessed with the keystroke 'Control-e l'.  If for some reason
you wish to use some key other than 'Control-e' as the common keyboard
prefix for all Emacspeak commands, set the variable emacspeak-prefix.

The second category of commands provided by Emacspeak manipulate the
state of the speech device.  The names of these commands start with
the common prefix dtk- and are bound in keymap emacspeak-dtk-submap.
You can access these commands via the prefix Control-e.  Note: d is
mnemonic for Dectalk.  Thus, the command dtk-set-rate is bound to 'r'
in keymap emacspeak-dtk-submap and can be executed by pressing
'Control-e d r'.

Emacs has extensive online help; so does emacspeak. Please use
it. This info manual is only to get you started.  You can get a
summary of Emacspeak's features by pressing Control-h Control-e

Miscellaneous
-------------
Reading without moving point: 

The following commands allow you to listen to information without
moving point (point is emacs terminology for the editing cursor).

Emacspeak uses Ctrl-e as a prefix-key.  Note: In all of the following,
a prefix arg (conventionally Ctrl-u) will read the "rest of the unit"
and a negative prefix arg (conventionally 'Ctrl-u -') will read the
initial part of the unit before point.  As an example, given the sexp
emacspeak-speak-sexp with point on the '-' preceding the speak,
emacspeak-speak-speak will say:

emacspeak-speak-region with no prefix-arg.    
speak-region with a positive prefix-arg.    
emacs with a negative prefix arg.

Note: For a better way of reading the beginning and or rest of a line
etc, see the extended Emacspeak reading commands such as
emacspeak-speak-line-interactively.

C-el 
M-x emacspeak-speak-line 	
Speaks current line.

C-e UP 
M-x emacspeak-read-next-line 	
Speaks previous line (without moving point).  Numeric prefix arg can
specify offset relative to current line. (Useful in shell buffers to
quickly look at the output.)

C-e DOWN 
M-x emacspeak-read-next-line 	
Speaks next line (without moving point).  Numeric prefix arg can
specify offset relative to current line.  (Useful in shell buffers to
quickly look at the output.)

C-e . 
M-x emacspeak-speak-sentence 	
Speaks current sentence. 

C-e ' 
M-x emacspeak-speak-sexp 	
Speaks current sexp. 

C-e w 
M-x emacspeak-speak-word 	
Speaks current word.

C-e c 
M-x emacspeak-speak-char 	
Speaks current char.

C-e r 
M-x emacspeak-speak-region 	
Speaks current region.

C-e b 
M-x emacspeak-speak-buffer  	
Speaks current buffer.

C-e h 
M-x emacspeak-speak-help 	
Speaks current help buffer if present.

C-e C-i 
M-x emacspeak-speak-completions 
Speaks possible completions if any listed. 

The following commands provide miscellaneous information.
C-e v 
M-x emacspeak-speak-version 	
Identifies current version of Emacspeak. 

C-e t 
M-x emacspeak-speak-time 	
Speaks date and time.

C-e m 
M-x emacspeak-speak-mode-line 	
Speaks concise mode-line. Only major mode information is spoken.

C-e M 
C-e h 
M-x emacspeak-speak-help 	
Speaks help buffer.

M-x emacspeak-speak-minor-mode-line 	
Speaks minor mode information.


Compatibility with Emacs Subsystems 
-----------------------------------
Write one node for each subsystem, e.g. vm, gnus, ...  Note: emacspeak
already works with these subsystems, writing additional modules will
customize how things get spoken.


Advanced Features 
-----------------
Hooks
----- 
These are the various hooks you can use to
customize some of Emacspeaks behavior.  They are arranged in the order
in which they would happen.

dtk-startup-hook specifies a list of functions to run after starting
the speech system. You can set the speech-device state,
e.g. speech-rate etc in this hook.  emacspeak-startup-hook is run
after Emacspeak has been started up.

Acknowledgements
----------------
Emacspeak was developed by T.V. Raman, and would not have come about
without input from the following people: Dave Wecker who was the
motive force behind this package.  Hans Chalupsky whose "advice"
package makes Emacspeak work.
