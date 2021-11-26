#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
int main() {
 pid_t pid;
 int n;
 pid=getpid();
 printf("\nThe Process ID is:%d",pid);
 printf("\nEnter the time in seconds for which you want to hibernate this 
process:");
 scanf("%d",&n);
 printf("\nThe Process will now sleep for %d second(s)",n);
 sleep(n);
 char str[3];
 sprintf(str,"%d",pid);
 char addr[]="cat /proc/";
 char ess[]="/status";
strcat(addr,str);
 int r = system(addr);
 sleep(1);
 return 0;
}
