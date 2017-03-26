CFLAGS = -g -O0
TARGETS = inv_ptr leaks huge_size inv_type uninit_var dbl_free uninit_access segfault
SOURCES = inv_ptr.c leaks.c huge_size.c inv_type.c uninit_var.c dbl_free.c uninit_access.c segfault.c


all: $(TARGETS)
	
dist: $(SOURCES) Makefile
	mkdir -p valgrind_example
	cp $^ valgrind_example/
	tar zcvf valgrind_example.tgz valgrind_example/

.PHONY: clean
clean:
	@rm -f *.o $(TARGETS)
