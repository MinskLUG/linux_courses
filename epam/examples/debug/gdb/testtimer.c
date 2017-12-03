#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void){
  time_t t;
  t=time(NULL);
  if(t>1425895656){
    printf("So late, my friend, so late!\n");
    exit(1);
  }
  printf("Слушаюсь и повинуюсь!\n");
  return(0);
}
