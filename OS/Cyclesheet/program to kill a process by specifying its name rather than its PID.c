#include <stdio.h>
#include <sys/types.h>
#include<string.h>
#include <unistd.h>
#include <stdlib.h>
int main()
{
 printf("\nList of processes:\n");
 system("ps -aux");
 char command[]="pkill -9 ";
 char process_name[100];
 printf("\nEnter the name of the process to be killed:");
 scanf("%s",&process_name);
 char P[100];
 strcpy (P,process_name);
 strcat(command,process_name);
 printf("\n");
 system (command);
 printf("\nList of processes after killing '%s' process.\n",P);
 system("ps -aux");
 return 0;
}
