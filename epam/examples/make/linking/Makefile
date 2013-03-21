LDFLAGSLIB= -shared
CFLAGSLIB= -fPIC

CFLAGS = -I.
LDFLAGS = -L. -Wl,-rpath,. -Wl,--no-as-needed

LIBS= libtesta.so libtestb.so

TARGETS = main-A_B main-B_A

all: $(TARGETS)

main-A_B: main.o $(LIBS)
	$(CC) $(LDFLAGS) $< -ltesta -ltestb -o $@

main-B_A: main.o $(LIBS)
	$(CC) $(LDFLAGS) $< -ltestb -ltesta -o $@

%.o: %.c
	$(CC) -c $(CFLAGSLIB) $< -o $@

%.so: %.o
	$(CC) $(LDFLAGSLIB) $< -o $@

.PHONY: clean
clean:
	@rm -f *.o $(LIBS) $(TARGETS)
