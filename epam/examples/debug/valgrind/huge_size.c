#include <stdlib.h>

void fill( char *array)
{
	array[10000] = 0;
}

main(void)
{
	char *array;

	array = (char *) malloc((unsigned long)(~0));
	fill( array);
	free( array);
	exit(0);
}
