#include <pthread.h>
#include <unistd.h>

#define NUM_THREADS 5

void *wait(void *t) {
    int i;
    long tid;
    tid = (long)t;
    sleep(1);
    printf("Sleeping \n");
    printf("Thread id : %d\n" ,tid);
    pthread_exit(NULL);
}

int main () {
    int rc;
    int i;
    pthread_t threads[NUM_THREADS];
    pthread_attr_t attr;
    void *status;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
    for( i = 0; i < NUM_THREADS; i++ ) {
        printf("parent creating thread, %d\n",i);
        rc = pthread_create(&threads[i], &attr, wait, (void *)i );
        if (rc) {
            printf("Error:unable to create thread, %d\n",rc);
            exit(-1);
        }
    }
    pthread_attr_destroy(&attr);
    for( i = 0; i < NUM_THREADS; i++ ) {
        rc = pthread_join(threads[i], &status);
        if (rc) {
            printf ("Error:unable to join, %d\n" ,rc);
            exit(-1);
        }
        printf("Parent Process: completed thread id :%d",i) ;
        printf("  exiting with status :%d\n",status);
    }
    printf ("Parent: program exiting.\n");
    pthread_exit(NULL);
}
