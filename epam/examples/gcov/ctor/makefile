PROGRAM_NAME=ctor
CPPFLAGS=--coverage

all:
	g++ $(CPPFLAGS) -o $(PROGRAM_NAME) ctor.cpp 

clean:
	rm -f $(PROGRAM_NAME) *.gcno *.gcda *.gcov *.html *.htm

gcov: clean all
	./$(PROGRAM_NAME)
	clear
	gcov -b $(PROGRAM_NAME)
	
