#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
int main() {
 pid_t pid;
 pid=fork();
 if (pid==0){
 printf("Background Process is now killed");
 sleep(10);
 exit(0);
 }
 else{
 printf("\nThis is Parent process working in foreground.\n " "Child Process is 
working in background for 10s.");
 printf("\nForeground Process Killed\n");
 sleep(1);
 kill(getpid());
 }
 return 0;
}