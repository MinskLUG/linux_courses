#include <stdio.h>
#include "libtest.h"

void test(void){
    printf("Lib B used\n" );
}

void init(void){
    printf("Lib B loaded\n" );
}

void fini(void){
    printf("Lib B unloaded\n" );
}
