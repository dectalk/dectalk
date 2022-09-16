#
# 001 MGS 11/03/1998 BATS #764
CC=cc
RM=rm -f
AR=ar cqls
LD=ld
LN=ln

CMD_DIR     = ../../dapi/src/cmd
DIC_DIR     = ../../dapi/src/dic
LTS_DIR     = ../../dapi/src/lts
PH_DIR      = ../../dapi/src/ph
INCLUDE_DIR = ../../dapi/src/include
API_DIR     = ../../dapi/src/api
OSF_DIR     = ../../dapi/src/osf
PROTOS_DIR  = ../../dapi/src/protos
NT_DIR      = ../../dapi/src/nt
DECTALKF_H  = ../../

STD_INCLUDE = /usr/include

MME_DIR     =/usr/include/mme

INCLUDES= -I$(INCLUDE_DIR) -I$(API_DIR) -I$(CMD_DIR) -I$(LTS_DIR) \
             -I$(OSF_DIR) -I$(PH_DIR) -I$(DECTALKF_H) \
             -I$(PROTOS_DIR) -I$(MME_DIR) -I$(NT_DIR) -I$(STD_INCLUDE)


CFLAGS=$(DEBUG_FLAGS) $(INCLUDES)

DEFINES = -DLTSSIM -DTTSSIM -DANSI -DBLD_DECTALK_DLL -D$(LANGUAGE)

DTALK_ML_SRC=dtalk_ml.c init.c

DTALK_ML_OBJ=../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o \
             ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o \
             ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o

all: /usr/shlib/libtts.so /usr/shlib/libttsmme.so

/usr/shlib/libtts.so:../build/$(OS_VERSION)/$(ML_OUT)/libtts.so
	$(LN) -fs `pwd`/$? $@

/usr/shlib/libttsmme.so:../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.so
	$(LN) -fs `pwd`/$? $@

/usr/lib/libtts.a:../build/$(OS_VERSION)/$(ML_OUT)/libtts.a
	$(LN) -fs `pwd`/$? $@

/usr/lib/libttsmme.a:../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a
	$(LN) -fs `pwd`/$? $@

../build/$(OS_VERSION)/$(ML_OUT)/libtts.so:/usr/lib/libtts.a
	$(CP) /usr/shlib/so_locations .
	$(CC) -o testit testit.c
	if ($[ ./testit $(OS_VERSION) V4.0 ]) then \
	( echo Version 4.0 ; \
        $(LD) $(LD_FLAGS) -shared -update_registry ./so_locations \
	-soname libtts.so -o $@ ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o ../build/$(OS_VERSION)/$(ML_OUT)/libtts.a -lc -lots -lpthread ; echo 4.0 built ; ) \
	else \
	(echo Version 3.2; \
	$(LD) $(LD_FLAGS) -shared -update_registry ./so_locations \
	-soname libtts.so -o $@ ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o ../build/$(OS_VERSION)/$(ML_OUT)/libtts.a -lc -lots -lpthreads ; echo 3.2 built; ) \
	fi

../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.so:/usr/lib/libttsmme.a
	$(CP) /usr/shlib/so_locations .
	$(CC) -o testit testit.c
	if ($[ ./testit $(OS_VERSION) V4.0 ]) then \
	(echo Version 4.0; \
        $(LD) $(LD_FLAGS) -shared -update_registry ./so_locations \
        -soname libttsmme.so -o $@ ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o ../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a -lc -lots -lpthread ; echo 4.0 built; ) \
	else \
	( echo Version 3.2; \
	$(LD) $(LD_FLAGS) -shared -update_registry ./so_locations \
        -soname libttsmme.so -o $@ ../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o ../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a -lc -lots -lpthreads ; echo 3.2 built; ) \
	fi

../build/$(OS_VERSION)/$(ML_OUT)/libtts.a:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o 
	$(RM) $@
	$(AR) $@ $?

../build/$(OS_VERSION)/$(ML_OUT)/libttsmme.a:../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o ../build/$(OS_VERSION)/$(ML_OUT)/link/init.o 
	$(RM) $@
	$(AR) $@ $?

../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml.o:dtalk_ml.c
	$(CC) -o testit testit.c
	if ($[ ./testit $(OS_VERSION) V4.0 ]) then \
	( echo Version 4.0 ; \
	$(CC) -c $(CFLAGS) -pthread -DBLD_ML_DLL -o $@ $? \
	; echo 4.0 built; ) \
	else \
	(echo Version 3.2; \
	$(CC) -c $(CFLAGS) -o $@ $? \
	; echo 3.2 built; ) \
	fi

../build/$(OS_VERSION)/$(ML_OUT)/link/dtalk_ml_mme.o:dtalk_ml.c
	$(CC) -o testit testit.c
	if ($[ ./testit $(OS_VERSION) V4.0 ]) then \
	( echo Version 4.0 ; \
	$(CC) -c $(CFLAGS) -pthread -DMME_SERVER -DBLD_ML_DLL -o $@ $? \
	 ; echo 4.0 built; ) \
	else \
	(echo Version 3.2; \
	$(CC) -c $(CFLAGS) -DMME_SERVER  -o $@ $? \
	; echo 3.2 built; ) \
	fi


../build/$(OS_VERSION)/$(ML_OUT)/link/init.o:init.c
	$(CC) -o testit testit.c
	if ($[ ./testit $(OS_VERSION) V4.0 ]) then \
	( echo Version 4.0 ; \
	$(CC) -c $(CFLAGS) $(DEFINES) -DOSF_VERSION_V4.0 -DDEC -DBLD_ML_DLL -G3 -pthread -w1 -DMME_SERVER -DUSE_MME_SERVER -o $@ $? \
	 ; echo 4.0 built; ) \
	else \
	(echo Version 3.2; \
	$(CC) -c $(CFLAGS) $(DEFINES) -DOSF_VERSION_V3.2 -DDEC -G3 -threads -w1 -DMME_SERVER -DUSE_MME_SERVER -o $@ $? \
	 ; echo 3.2 built; ) \
	fi




