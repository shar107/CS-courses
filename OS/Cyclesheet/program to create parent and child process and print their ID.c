#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
int main(void)
{
 int pid;
 pid=fork();
 if (pid<0)
 {
 printf("can'nt excecute");
 }
 else if (pid==0)
 {
 printf("Child process is %d \n",getpid());
 printf("Parent id child block is %d \n",getppid());
 }
 else
 {
 printf("Parent process is %d \n",getpid());
 printf("Parent id of parent process is %d \n",getppid());
 }
 return 0;
}
