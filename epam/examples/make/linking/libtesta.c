#include <stdio.h>
#include "libtest.h"

void test(void){
    printf("Lib A used\n" );
}

void init(void){
    printf("Lib A loaded\n" );
}

void fini(void){
    printf("Lib A unloaded\n" );
}
