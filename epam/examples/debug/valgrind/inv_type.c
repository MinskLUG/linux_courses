#include <stdio.h>
#include <stdlib.h>

void sum( int *a, int *b)
{
    int c;
    c =  (*a) * (*b);
}

main(void)
{
	int a=4, b=5;

	sum (&a, b);
	exit(0);
}
