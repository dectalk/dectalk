OBJS=par_c2.o par_cbin.o par_char.o par_ambi.o
CFLAGS=-g

all: par_c2

par_c2: $(OBJS)

compile: ../../dapi/src/cmd/par_rule2.par par_c2
	./par_c2 $<

clean:
	-rm -f $(OBJS) par_c2

.PHONY: all clean compile
