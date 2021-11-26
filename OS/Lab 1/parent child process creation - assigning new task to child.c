#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
int main() {
        pid_t pid;
        pid=fork();
        if(pid<0) {
                printf("Child process not created");
        }
        else if(pid==0) {
                printf("This is child process with Process ID : %d",getpid());
                printf("\n");
        }
        else {
                printf("This is Parent Process with Process ID : %d",getpid());
                printf("\n");
        }
}
