#include <stdio.h>

int SomeFunction (int* a) 
{
	return *a++;
}

/**
* This is an example of incorrect GCOV behaviour!
*
* GCOV shows 100% code coverage, but in reallity we miss 
* branch with call SomeFuction(NULL). 
* And in this part of code is BROKEN!
*
*/
int main(int argc, char *argv[])
{
	int value = atoi(argv[1]);
	int result = value == 1 ? 100 : SomeFunction(NULL);
	int a = 10;
	SomeFunction( &a );
	return 0;
}
