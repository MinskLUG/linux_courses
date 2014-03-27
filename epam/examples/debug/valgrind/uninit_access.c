#include <stdio.h>
#include <valgrind/memcheck.h>

void dobug(char *addr)
{
    char *local = addr;
    local[4]=32;
}

main(void)
{
    char addr[]="Hello, world!!!";
    printf("%s\n", addr);
    VALGRIND_MAKE_MEM_NOACCESS(addr, sizeof(addr));
    dobug( addr);
    printf("%s\n", addr);
    return (0);
}
