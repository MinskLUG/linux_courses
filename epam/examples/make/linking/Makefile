CFLAGS = -I.
LDFLAGS = -L.

SOVERSION=0.1.0

LDFLAGSLIB= -shared -Wl,-init,init -Wl,-fini,fini
CFLAGSLIB= -fPIC $(CFLAGS)

LIBS= libtesta.so libtestb.so

TARGETS = main-A_B main-B_A main-A_B-as-needed main-B_A-as-needed

all: $(TARGETS)

main-A_B: main.o $(LIBS)
	$(CC) $(LDFLAGS) -Wl,--no-as-needed $< -ltesta -ltestb -o $@
	$(CC) $(LDFLAGS) -Wl,--as-needed $< -ltesta -ltestb -o $@-as-needed

main-B_A: main.o $(LIBS)
	$(CC) $(LDFLAGS) -Wl,--no-as-needed $< -ltestb -ltesta -o $@
	$(CC) $(LDFLAGS) -Wl,--as-needed $< -ltestb -ltesta -o $@-as-needed

%.o: %.c
	$(CC) -c $(CFLAGSLIB) $< -o $@

%.a: %.o
	$(CC) -c $(CFLAGSLIB) $< -o $@

%.so: %.o
	$(CC) $(LDFLAGSLIB) $< -o $@

main-classic: main.o libtesta.o

main-static: libtesta.a

.PHONY: clean
clean:
	@rm -f *.o $(LIBS) $(TARGETS)
