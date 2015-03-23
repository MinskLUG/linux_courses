#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int intcmp(const void *aa, const void *bb)
{
	const int *a = aa, *b = bb;
	return (*a < *b) ? -1 : (*a > *b);
}

#define SIZE 1000 

int main()
{
	int data[SIZE];

	unsigned i;
	for (i = 0; i < SIZE; i++)
		data[i] = rand() % 256;

	qsort(data, SIZE, sizeof(unsigned), intcmp);

	long long sum = 0;
	for (i = 0; i < 100000; i++)
	{
		unsigned j ;
		for (j = 0; j < SIZE; j++)
		{
			if (data[j] >= 128)
				sum += data[j];
		}
	}

	printf("sum = %lld\n",sum);

	return 0;
}
