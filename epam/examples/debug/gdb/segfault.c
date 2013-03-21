#include <stdio.h>
#include <stdlib.h>

#define BUF_SIZE 1000

void fill_random_ascii_buffer(char *buffer,size_t size){
  int i;
  for(i=0;i<size;i++){
    buffer[i]=32+(int)(drand48()*(127.0-32.0));
  }
}

int main(int argc, char *argv[]){
  char *buf;
  int j=0;
  char *message = "Program finished";

  buf=malloc(BUF_SIZE*sizeof(char));

  if(buf=NULL){
    printf("Buffer allocation failed!\n");
    exit(1);
  }

  fill_random_ascii_buffer(buf,BUF_SIZE);

  for(j=0;j<BUF_SIZE;j++){
    putchar(buf[j]);
    if(j%50==0 && j>0){
      putchar('\n');
    }
  }
  putchar('\n');
  puts(message);
  return(0);
}

