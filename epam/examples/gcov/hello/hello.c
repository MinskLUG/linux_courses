#include <stdio.h>

int main(int argc, char *argv[])
{
	char param = *argv[1];
	int counter = 0;

	if (param == '1')
	{
		counter++;
	}
	if (param == '2')
	{
		counter++;
	}
	if (param == '3')
	{
		counter++;
	}

	return 0;
}
