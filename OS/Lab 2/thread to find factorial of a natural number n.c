#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
void *Factorial(void* var){
    printf("\nThis is thread process with pid:%d\n",getpid());
    int n = (int *)var;
    int fact=1;
    for (int i=n; i>0; i--){
        fact=fact*i;
    }
    printf("Factorial of %d is: %d\n", n, fact);
}
int main() {
    int n; printf("\nThis is parent process with pid:%d",getpid());
    printf("\nBefore Thread Creation.\nThread will now be Created...");
    printf("\nEnter the number whose Factorial you want to calculate: ");
    scanf("%d",&n);
    pthread_t tid;
    pthread_create (&tid,NULL,Factorial,(void*)n);
    pthread_join(tid,NULL);
    pthread_exit(NULL);
    exit(0);
}
