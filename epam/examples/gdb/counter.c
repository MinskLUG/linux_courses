#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

int main(int argc, char *argv[]){
  long howmany=100;
  char *leak;

  if(argc>2){
    printf("Использование %s [howmany]\n",argv[0]);
    exit(1);
  }else if(argc==2){
    errno=0;
    howmany=strtol(argv[1],NULL,10);
    if(errno != 0 || howmany<=0 || howmany>=LONG_MAX){
      printf("Неправильное начальное число %s !\n",argv[1]);
      exit(1);
    }
  }
  long i;
  for(i=0;i<howmany;i++){
    leak=malloc(256*sizeof(char));

    printf("%ld\n",i);
    sleep(2);
  }

  free(leak);

  return(0);
}


