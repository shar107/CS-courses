#include  <stdio.h>
#include  <sys/types.h>
void  main(void)
{
        pid_t pid;
        pid = getpid();
        printf("The Process ID is: ");
        printf("%d",pid);
        printf("\n");
}
