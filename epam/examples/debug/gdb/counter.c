#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

void usage(const char *reason){
    fprintf(stderr,"Ошибка:%s\n",reason);
    fprintf(stderr,"Использование %s [howmany]\n","counter");
    exit(1);
}    


int main(int argc, char *argv[]){
  long howmany=100;
  char *leak;

  if(argc>2 || argc<2){
    usage("Неправильное число аргументов");
  }else if(argc==2){
    errno=0;
    howmany=strtol(argv[1],NULL,10);
    if(errno != 0 || howmany<=0 || howmany>=LONG_MAX){
      usage("Неправильное начальное число");
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


