#include "core.h"
#include <stdio.h>

void Calc1()
{
	printf("This is long Calc1\n");
}

int Calc2(int a, int b)
{
	printf("This is long Calc2(int a, int b)");

	int i = 10;
	

	while( i >= 0)
	{
		i--;
		int result = a + b + i;
		printf("%d", result);
	}

	return 0;
}

int Calc3(int a, int b)
{
	int someValue = a % b;
	int otherValue = a / b + 1;

	return a + b;
}
