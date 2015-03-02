CFLAGS = -g -Wall 
.PHONY: all
all: counter segfault

.PHONY: all dist
all: counter segfault

counter: counter.c

segfault: segfault.c
	gcc -g -o segfault segfault.c

dist: counter.c segfault.c Makefile
	mkdir -p gdb-example
	cp $^ gdb-example/
	tar zcvf gdb-example.tgz gdb-example/*
clean:
	rm -rf counter segfault
