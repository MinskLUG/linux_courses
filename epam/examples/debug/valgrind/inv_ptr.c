#include <stdlib.h>

main(void)
{
	char *array;
	char array1[10];

	array = malloc(10*sizeof(char));
	array[10] = 'x'; // detected
	array1[10] = 'x'; // not detected
	free( array);
	exit(0);
}
