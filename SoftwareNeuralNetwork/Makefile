TOOLS_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
		   -W -Wundef -Wmissing-prototypes -g
#
# Programs
#

all:	 cneural.out run_network.out

cneural.out:  cneural.o
	$(CC) $(LDFLAGS) -o $@ $^ -lm -lfann

run_network.out:  run_network.o
	$(CC) $(LDFLAGS) -o $@ $^ -lm -lfann


#
# Objects
#

%.o: %.c
	$(CC) $(CFLAGS) $(TOOLS_CFLAGS) -c $< -o $@ -lm -lfann

clean:
	rm run_network.o cneural.o run_network.out cneural.out
