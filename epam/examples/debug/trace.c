#include <stdio.h>

void second(void){
}

void first(void){
  second();
}

int main(void){
  first();
  return 0;
}
