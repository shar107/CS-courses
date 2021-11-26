#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>
int main()
{
 int pid;
 pid = fork();
 if( pid>0)
 {
 printf ("Parent process is %d \n",getpid());
exit (0);
 }
 else if ( pid==0 )
 {
 sleep (60);
 printf ("Child process is %d \n ",getpid());
 }
 return 0;
}