CFLAGS = -g 
.PHONY: all
all: counter.dbg segfault.dbg backtrace.dbg

counter: counter.c

%.dbg: %
	objcopy --only-keep-debug $< $@
	strip -g $<
	objcopy --add-gnu-debuglink $@ $<

segfault: segfault.c
	gcc -Wall -g -o segfault segfault.c

backtrace: backtrace.c
	gcc -g -rdynamic -o $@ $<
