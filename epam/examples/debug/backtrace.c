// For better backtrace implementation
#define __USE_GNU
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <execinfo.h>


#define BUF_SIZE 1000
#define TRACEDEPTH 16

void builtin_gcc_trace( void){
    printf("Builtin gcc return addresses:\n");
    printf("Frame 0: PC=%p\n", __builtin_return_address(0));
    printf("Frame 1: PC=%p\n", __builtin_return_address(1));
    printf("Frame 2: PC=%p\n", __builtin_return_address(2));
    printf("Frame 3: PC=%p\n", __builtin_return_address(3));
}

static void signal_error(int sig, siginfo_t *si, void *ptr){

	void *trace[TRACEDEPTH];
	size_t trace_size, i;
	char **trace_msg;

	builtin_gcc_trace();

	trace_size = backtrace(trace, TRACEDEPTH);

	printf("Backtrace symbols with backtrace_symbols_fd():\n");

	backtrace_symbols_fd( trace, trace_size, STDERR_FILENO);

	/* May not work with memory corruption due internal malloc() */
	printf("Backtrace symbols with backtrace_symbols():\n");

	trace_msg = backtrace_symbols( trace, trace_size);

	for( i=0; i<trace_size; i++)
		printf("%s\n", trace_msg[i]);

	free( trace_msg);
	exit( 1);
}


void fill_random_ascii_buffer(char *buffer,size_t size){
  int i;
  for(i=0;i<size;i++){
    buffer[i]=32+(int)(drand48()*(127.0-32.0));
  }
  free( buffer);
}

int main(int argc, char *argv[]){
  char *buf;
  int j=0;
  char *message = "Program finished";
  struct sigaction sigact;
  sigset_t         sigset;

  sigact.sa_flags = SA_SIGINFO;
  sigact.sa_sigaction = signal_error;
  sigemptyset(&sigact.sa_mask);
  sigaction(SIGSEGV, &sigact, 0);
  sigemptyset(&sigset);

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
  free( buf);
  puts(message);
  return(0);
}

