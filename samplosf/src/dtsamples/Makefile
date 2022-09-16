
CC=cc
RM=rm -f
LN=ln

API_DIR=../../../dapi/src/api
INLCUDE_DIR=../../../dapi/src/include

INLCUDES=I$(INCLUDE_DIR) -I$(API_DIR) 

DEFINES = -DDEC 

DEBUGFLAGS= -G3
OTHER_FLAGS=-threads 
LFLAGS=-G3 $(DEBUG_FLAGS)

CFLAGS= $(DEBUGFLAGS) $(OTHER_FLAGS) $(INCLUDES) $(NEWINCLUDES) $(DEFINES) \
           $(DEBUG_FLAGS)

XLIBS= -lMrm -lXm -lXt -lXext -lX11

LIBS= -lmme -lpthreads -lc_r -lmach -lrt -llmf

#DT_LIB=-lttsmme_$(LANG_CODE)
DT_LIB=-lttsmme

SAMPLES_SRC=say.c dtmemory.c aclock.c xmsay.c

SAMPLES_OBJ=$(SAMPLES_SRC:.c=.o)

all: $(OUTPUT_DIR)/say $(OUTPUT_DIR)/dtmemory \
     $(OUTPUT_DIR)/aclock $(OUTPUT_DIR)/xmsay $(OUTPUT_DIR)/xmsay.uid 


$(OUTPUT_DIR)/say:say.o
	$(CC) $(LFLAGS) -o $@ $? $(LIBS) $(DT_LIB)

$(OUTPUT_DIR)/dtmemory:dtmemory.o
	$(CC) $(LFLAGS) -o $@ $? $(LIBS) $(DT_LIB)

$(OUTPUT_DIR)/aclock:aclock.o
	$(CC) $(LFLAGS) -o $@ $? $(LIBS) $(DT_LIB)

$(OUTPUT_DIR)/xmsay.uid:xmsay.uil 
	/usr/bin/X11/uil -o $@ $?

$(OUTPUT_DIR)/xmsay:xmsay.o
	$(CC) $(LFLAGS) -o $@ $? $(LIBS) $(XLIBS) $(DT_LIB)

.c.o:
	$(CC) -c $(CFLAGS) $(NEWCFLAGS) -o $@ $?


clean:
	$(RM) $(OUTPUT_DIR)/* 
	$(RM) ($SAMPLES_OBJ) *~ core 




