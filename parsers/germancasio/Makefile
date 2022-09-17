# BACHUS MAKE FILE
# This makefile generates bachus, given bachus.y, bachus.l and bachus.h.
# The file bachus.y is converted by bison (or yacc) to bachus.tab.c
# Note that if yacc is used, the output file witll be y.tab.c
# meaning the make file has to be changed more than just redefining 
# the symbol YACC.
# The file bachus.l is converted by lex (flex) into lex.yy.c
# Author and learner Reiner Wilhelms-Tricarico
# This make file format was grabbed from sox and simplified to my needs
 
# Paths

srcdir = .
prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
libdir = ${exec_prefix}/lib
mandir = ${prefix}/man
includedir = ${prefix}/include

# Shell commands.

CC	= gcc
YACC    = bison -d --debug
LEX	= flex
RANLIB	= ranlib
INSTALL	= /usr/bin/install -c
AR	= ar r
SED	= sed
TAR	= tar
RM	= rm -f
LN_S    = ln -s

# Build macros. 
# (LIBS: for lex: -ll, for flex: -lfl)

CFLAGS	= -g -Wunused-variable -I$(srcdir)
LDFLAGS	= -L.
LIBS	= 

# Other macros.

# Objects.

FOBJ	= 

EOBJ	= bachus.tab.o lex.yy.o wherelex.o ltrie.o builder.o walker.o allorules.o

LIBOBJS = $(EOBJ) handlers.o misc.o util.o

all: bachus

allorules.o: bachusfeatures.h

lex.yy.c:  bachus.l bachus.h
	$(LEX) bachus.l

bachus.tab.c:  bachus.y bachus.h
	$(YACC) bachus.y

bachus: $(EOBJ)
	$(CC) $(LDFLAGS) -o bachus $(EOBJ) $(LIBS)
clean:
	$(RM) *.o
	$(RM) *.tab.c
	$(RM) lex.yy.c

distclean:
	$(RM) *~ *.o bachus

tar:	
	tar zcvf BachusPathMethod.gz Makefile README *.l *.y *.h *.c  *.ger *.txt *.tex *.pho *.ps *.pdf 

doc:	
	latex  bachusdocument.tex
	latex  bachusdocument.tex
	dvips -o bachusdocument.ps bachusdocument.dvi
	ps2pdf bachusdocument.ps
