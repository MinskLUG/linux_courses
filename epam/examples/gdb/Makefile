CFLAGS = -g -Wall 
.PHONY: all
all: counter segfault backtrace

counter: counter.c

segfault: segfault.c
	gcc -g -o segfault segfault.c

backtrace: backtrace.c
	gcc -g -rdynamic -o $@ $<
