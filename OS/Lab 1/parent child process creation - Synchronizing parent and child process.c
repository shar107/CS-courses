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
                printf("\nAdding Two Numbers: \n");
                int a, b;
                scanf("%d %d",&a,&b);
                printf("Sum is: %d",a+b);
        }
        else {
                wait();
                printf("\nThis is Parent Process with Process ID : %d",getpid());
                printf("\n");
        }
}

