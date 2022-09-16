#
# @DEC_COPYRIGHT@
#
#
# HISTORY
# Revision 1.1.2.9  1996/02/23  21:09:15  Krishna_Mangipudi
# 	changed typos
# 	[1996/02/23  21:09:03  Krishna_Mangipudi]
#
# Revision 1.1.2.8  1996/02/21  15:46:46  Krishna_Mangipudi
# 	Edited instructions
# 	[1996/02/21  15:46:24  Krishna_Mangipudi]
# 
# Revision 1.1.2.7  1996/02/12  22:33:41  Krishna_Mangipudi
# 	Deleted reference to env variable DTK-SHL
# 	[1996/02/12  22:33:34  Krishna_Mangipudi]
# 
# Revision 1.1.2.6  1996/02/12  22:28:14  Krishna_Mangipudi
# 	Added help and more user friendly prompts
# 	[1996/02/12  22:28:06  Krishna_Mangipudi]
# 
# Revision 1.1.2.5  1996/02/09  00:44:18  Krishna_Mangipudi
# 	Added play and emacspeak.sh to clean
# 	[1996/02/09  00:44:07  Krishna_Mangipudi]
# 
# Revision 1.1.2.4  1996/02/09  00:37:04  Krishna_Mangipudi
# 	Added more instructions for users
# 	[1996/02/09  00:36:51  Krishna_Mangipudi]
# 
# Revision 1.1.2.3  1995/11/16  20:24:33  Darrell_Stam
# 	Remove unused items and info files.
# 	[1995/11/16  20:24:24  Darrell_Stam]
# 
# Revision 1.1.2.2  1995/11/14  21:44:57  Krishna_Mangipudi
# 	Initial checkin into DECtalk Software source pool
# 	[1995/11/14  21:37:02  Krishna_Mangipudi]
# 
# $EndLog$
#
# GNU Emacs COPYRIGHT NOTICE
#
# This file is not part of GNU Emacs, but the same permissions apply.
#
# GNU Emacs is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to
# the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
# 
########################################################################### 
# 
# Site Specific Configuration: 
# ---------------------------
#
# Edit this section, if necessary, before installing Emacspeak.   
#
# (1) Please specify a directory for all the emacspeak sources, the default
# location is in your toplevel directory.
DESTDIR = $(HOME)/emacspeak
#
# (2) Where do you want the bin files created by this program?
# Typically these files are installed in /usr/local/bin. 
# Leave "BINDIR"  unchanged if you want to take the defaults.
# 
BINDIR = /usr/local/bin
#
# (3) Specify emacs executable name.  Sometimes executable files for newer 
# versions of emacs on your system may have a version number attached to them; 
# for example -  emacs19.25 is the executable for emacs V19.25 - if this is
# the case then you might want to modify "EMACS". 
#
EMACS = emacs
#
# End of "Site Specific Configuration" section.
#
################## Do Not Edit Anything Below This #########################
#
SNAPSHOT = `date "+%h-%d-%y-%H-%M"`
CWD = `pwd`
BATCH = -batch -q
COMPILE = -f batch-byte-compile
INSTALL = install

#
# Make rules 
#
.SUFFIXES: .elc .el .def 

.el.elc:
	$(EMACS) $(BATCH)  -l $(CWD)/emacspeak-load-path  $(COMPILE) $(CWD)/$<
	@echo  "Compiled  $<.  " $(DECTALK)

#
# Source files to use 
#
ID = make.log
DISTFILES =	dtk-macros.el   \
	emacspeak-keymap.el     \
	dtk-sh.el               \
	emacspeak-kotl.el       \
	dtk-spatial.el          \
	dtk-speak.el            \
	emacspeak-oo-browser.el \
	dtk-voices.el           \
	emacspeak-outline.el    \
	emacspeak-advice.el     \
	emacspeak-perl.el       \
	emacspeak-auctex.el     \
	emacspeak-redefine.el   \
	emacspeak-bbdb.el       \
	emacspeak-replace.el    \
	emacspeak-c.el          \
	emacspeak-calc.el       \
	emacspeak-sounds.el     \
	emacspeak-calendar.el   \
	emacspeak-speak.el      \
	emacspeak-compile.el    \
	emacspeak-tabulate.el   \
	emacspeak-dired.el      \
	emacspeak-tcl.el        \
	emacspeak-dmacro.el     \
	emacspeak-tempo.el      \
	emacspeak-ediff.el      \
	emacspeak-vm.el         \
	emacspeak-eterm.el      \
	emacspeak-w3.el         \
	emacspeak-fix-interactive.el \
	emacspeak-wrolo.el      \
	emacspeak-folding.el    \
	emacspeak.el            \
	emacspeak-gnus.el       \
	html-voice.el           \
	emacspeak-hyperbole.el  \
	voice-lock.el           \
	emacspeak-info.el       \
	w3-util.el              \
	emacspeak-ispell.el     \
	emacspeak-load-path.def \
	emacspeak.def           \
	emacspeak-setup.def     \
	play.def                \
	Makefile                \
	dtk-mme                 \
	HELP

#
# Emacspeak modules
#
DTK_OBJECTS =  dtk-macros.elc\
	dtk-speak.elc\
	dtk-sh.elc\
	dtk-voices.elc
SPEAK_OBJECTS =   \
	emacspeak-speak.elc  \
	voice-lock.elc  \
        html-voice.elc \
	emacspeak-sounds.elc 

CORE_OBJECTS =  \
	emacspeak.elc \
	emacspeak-advice.elc\
	emacspeak-keymap.elc\
	emacspeak-fix-interactive.elc\
	emacspeak-redefine.elc\
	emacspeak-replace.el \
	emacspeak-tabulate.el

AUX_OBJECTS = emacspeak-calendar.elc \
	emacspeak-calc.elc \
	emacspeak-c.elc \
	emacspeak-compile.elc \
	emacspeak-auctex.elc \
	emacspeak-dired.elc \
	emacspeak-info.elc\
	emacspeak-folding.elc \
	emacspeak-outline.elc \
	emacspeak-hyperbole.elc \
	emacspeak-kotl.elc \
	emacspeak-bbdb.elc \
	emacspeak-dmacro.elc \
	emacspeak-wrolo.elc \
	emacspeak-oo-browser.elc \
	emacspeak-tempo.elc \
	emacspeak-tcl.elc \
	emacspeak-perl.elc \
	emacspeak-vm.elc \
	emacspeak-w3.elc \
	emacspeak-ispell.elc \
	emacspeak-eterm.elc \
	emacspeak-ediff.elc \
	emacspeak-gnus.elc\
	emacspeak-setup.el

        ADDON_OBJECTS=w3-util.elc # custom.elc
        
OBJECTS = $(DTK_OBJECTS) $(SPEAK_OBJECTS) $(CORE_OBJECTS)  \
	$(AUX_OBJECTS) $(ADDON_OBJECTS)

emacspeak: $(OBJECTS)
	@echo " "
	@echo "Done making emacspeak"
	@echo "Compiled on $(SNAPSHOT) by `whoami` on `hostname`" >> $(ID)
	@echo " "
	@echo " "
	@echo "To run emacspeak:"
	@echo "-----------------"
	@echo " "
	@echo "   (1) To run emacspeak please type:"
	@echo "      emacspeak.sh "
	@echo " "
#
# Help with build 
#
# 
help:
	@echo " "
	@echo "Installation instructions:"
	@echo "--------------------------"
	@echo " "
	@echo "   To install emacspeak do the following:
	@echo " "
	@echo "      (1) Create a directory called emacspeak in your login"
	@echo "      area to copy emacspeak files into.  If you wish to" 
	@echo "      use some other directory then edit the Makefile and"
	@echo "      change DESTDIR (see step 3)." 
	@echo " "
	@echo "      (2) cd over to /usr/opt/DTKRT420/emacspeak/Macros"
	@echo " "
	@echo "      (3) Edit the Makefile if necessary and change the"
	@echo "      section that says \"Site Specific Configuration\". "
	@echo " "
	@echo "      (4) To automatically create and populate a directory " 
	@echo "      with emacspeak files, please type:"
	@echo "         make copy"
	@echo " "
	@echo "      (4) After copying the files into a local directory"
	@echo "      cd over to this newly created directory. To continue"
	@echo "      installation type:"
	@echo "         make config"
	@echo " "
	@echo "      (5) Next type:"
	@echo "         make emacspeak"
	@echo " "
	@echo "   Upon completion of the compilation, emacspeak is ready for use. "
	@echo " "
	@echo "To run emacspeak:"
	@echo "-----------------"
	@echo " "
	@echo "   (1) To run emacspeak please type:"
	@echo "      emacspeak.sh "
	@echo " "
	@echo "Compiling support for specific application packages:"
	@echo "----------------------------------------------------"
	@echo " "
	@echo "NOTE:"
	@echo "   Using the steps described above results in emacspeak with support"  
	@echo "   for a full complement of applications, this is done as part of make all."  
	@echo "   If you desire to build support for only a subset of applications, rather"
	@echo "   than typing \"make emacspeak\", you can recompile support for individual "
	@echo "   packages. For e.g. for compiling emacspeak support for calendar type:"
	@echo "         make calendar"
	@echo " "
	@echo "   Please refer to emacspeak documentation for a complete list of"
	@echo "   supported packages."
	@echo " "

config: emacspeak-setup.def emacspeak-load-path.def play.def
#(which emacs ) || (echo "emacs is not  installed!" ) ; exit 1)
	@rm -f emacspeak-setup.el emacspeak-load-path.el play
	@sed "s@<emacspeak-dir>@`pwd`@g" \
		emacspeak.def > emacspeak.sh
	@sed "s@<emacspeak-dir>@`pwd`@g" \
		emacspeak-load-path.def > emacspeak-load-path.el
	@sed "s@<emacspeak-dir>@`pwd`@g" \
		emacspeak-setup.def  > emacspeak-setup.el
	@sed "s@<emacspeak-dir>@`pwd`@g" \
		play.def > play
	@chmod 444 emacspeak-setup.el emacspeak-load-path.el
	@chmod 755 play  emacspeak.sh
	@echo "  "
	@echo "Configured emacspeak, to continue please type:"
	@echo "      make emacspeak"

install:
	if [ ! -d $(BINDIR) ] ; then mkdir $(BINDIR); fi
	ln -fs `pwd`/dtk-mme /usr/local/bin/dtk-mme
	$(INSTALL) emacspeak.sh $(BINDIR)/
#        
# Modules dependent on DECtalk  Software 
#        
dtk-macros.elc: dtk-macros.el
dtk-speak.elc: dtk-speak.el dtk-sh.el
dtk-sh.elc: dtk-sh.el
dtk-voices.elc: dtk-voices.el
voice-lock.elc: voice-lock.el
html-voice.elc: html-voice.el voice-lock.elc 
#        
# Emacspeak Modules:
#        
emacspeak-sounds.elc: emacspeak-sounds.el
emacspeak-advice.elc: emacspeak-advice.el dtk-speak.elc
emacspeak-calendar.elc: emacspeak-calendar.el dtk-speak.el
emacspeak-calc.elc: emacspeak-calc.el 
emacspeak-c.elc: emacspeak-c.el dtk-speak.elc
emacspeak-dired.elc: emacspeak-dired.el dtk-speak.elc
emacspeak-auctex.elc: emacspeak-auctex.el dtk-speak.elc
emacspeak-info.elc: emacspeak-info.el dtk-speak.elc 
emacspeak-folding.elc: emacspeak-folding.el dtk-speak.elc
emacspeak-outline.elc: emacspeak-outline.el dtk-speak.elc
emacspeak-hyperbole.elc: emacspeak-hyperbole.el dtk-speak.elc
emacspeak-kotl.elc: emacspeak-kotl.el dtk-speak.elc
emacspeak-bbdb.elc: emacspeak-bbdb.el dtk-speak.elc
emacspeak-dmacro.elc: emacspeak-dmacro.el dtk-speak.elc
emacspeak-wrolo.elc: emacspeak-wrolo.el dtk-speak.elc 
emacspeak-oo-browser.elc: emacspeak-oo-browser.el dtk-speak.elc 
emacspeak-tempo.elc: emacspeak-tempo.el dtk-speak.elc
emacspeak-tcl.elc: emacspeak-tcl.el dtk-speak.elc
emacspeak-perl.elc: emacspeak-perl.el dtk-speak.elc 
emacspeak-eterm.elc: emacspeak-eterm.el dtk-speak.elc
emacspeak-ediff.elc: emacspeak-ediff.el dtk-speak.elc
emacspeak-fix-interactive.elc: emacspeak-fix-interactive.el dtk-speak.elc
emacspeak-gnus.elc: emacspeak-gnus.el dtk-speak.elc
emacspeak-ispell.elc: emacspeak-ispell.el dtk-speak.elc
emacspeak-keymap.elc: emacspeak-keymap.el 
emacspeak-load-path.elc: emacspeak-load-path.elc
emacspeak-redefine.elc: emacspeak-redefine.el  dtk-speak.elc
emacspeak-replace.elc: emacspeak-replace.el dtk-speak.elc
emacspeak-tabulate.elc: emacspeak-tabulate.el dtk-speak.elc
emacspeak-setup.elc: emacspeak-setup.el
emacspeak-speak.elc: emacspeak-speak.el dtk-speak.elc
emacspeak-vm.elc: emacspeak-vm.el dtk-speak.elc
emacspeak-w3.elc: emacspeak-w3.el dtk-speak.elc
emacspeak.elc: emacspeak.el
#
# Rule for building all targets. 
#
all: emacspeak 

#
# Rules for compiling support for individual packages:
#
calendar: emacspeak-calendar.elc
calc: emacspeak-calc.elc 
c: emacspeak-c.elc
compile: emacspeak-compile.elc
auctex: emacspeak-auctex.elc
dired: emacspeak-dired.elc  
folding: emacspeak-folding.elc
outline:emacspeak-outline.elc
hyperbole: emacspeak-hyperbole.elc
kotl: emacspeak-kotl.elc
bbdb: emacspeak-bbdb.elc
dmacro: emacspeak-dmacro.elc 
wrolo: emacspeak-wrolo.elc
oo-browser: emacspeak-oo-browser.elc
tempo: emacspeak-tempo.elc
tcl: emacspeak-tcl.elc
perl: emacspeak-perl.elc
vm: emacspeak-vm.elc  
w3: emacspeak-w3.elc  
ispell: emacspeak-ispell.elc  
eterm: emacspeak-eterm.elc
ediff: emacspeak-ediff.elc
gnus: emacspeak-gnus.elc  
#
# Rules for deleting previous builds 
#
clean:
	rm -f *.elc  emacspeak.log  play emacspeak.sh
#
# Copy files to a new directory
#
copy:	$(DISTFILES)
	if [ ! -d $(DESTDIR) ] ; then mkdir $(DESTDIR); fi
	cp -f *.el       $(DESTDIR)/.
	cp -f *.def      $(DESTDIR)/.
	cp -f HELP       $(DESTDIR)/.
	cp -f Makefile   $(DESTDIR)/.
	cp -f dtk-mme    $(DESTDIR)/.
	@echo "Copied files to $(DESTDIR)"
	@echo " "
	@echo "To continue, please cd over to $(DESTDIR) and type:"
	@echo "   make config"
	@echo " "
