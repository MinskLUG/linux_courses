CFLAGS = -g -Wall 
.PHONY: all
all: backtrace

backtrace: backtrace.c
	gcc -g -rdynamic -o $@ $<
