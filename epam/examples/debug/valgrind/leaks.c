#include <stdlib.h>

main(void)
{
	char *array;
	int i;

	for( i=0; i<100; i++)
	    array = malloc(10*sizeof(char));
	free( array);
	exit(0);
}
