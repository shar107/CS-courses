#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>
int main()
{
 int pid;
 pid = fork();
 if ( pid==0 )
 {
 printf ("child process is %d \n",getpid());
 }
 if ( pid>0 )
 {
 sleep (60);
 printf("Parent process is %d \n",getpid());
 }
 else
 {
 exit(0);
 }
 return 0;
}