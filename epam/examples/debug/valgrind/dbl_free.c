#include <stdlib.h>

main(void)
{
	char *array;

	array = malloc((unsigned short)(~0));
	free( array);
	free( array);
	exit(0);
}
