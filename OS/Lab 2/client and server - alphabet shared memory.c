//SERVER
#include <iostream>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
using namespace std;
int main()
{
    key_t my_key = ftok("shmfile",65); // ftok function is used to generate unique key
    int shmid = shmget(my_key,1024,0666|IPC_CREAT); // shmget returns an ide in shmid
    char *str = (char*) shmat(shmid,(void*)0,0); // shmat to join to shared memory
    cout<<"Write Data : ";
    fgets(str, 50, stdin);
    printf("Data written in memory: %s\n",str);
    //detach from shared memory
    shmdt(str);

    return 0;
}



//CLIENT
#include<bits/stdc++.h>
#include <iostream>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>
#include <cstring>
using namespace std;
int main()
{
    key_t my_key = ftok("shmfile",65); // ftok function is used to generate unique key
    int shmid = shmget(my_key,1024,0666|IPC_CREAT); // shmget returns an ide in shmid
    char *str = (char*) shmat(shmid,(void*)0,0); // shmat to join to shared memory
    printf("Data read from memory:");
    for (int x=0; x<strlen(str); x++)
        putchar(toupper(str[x]));
    shmdt(str);
    shmctl(shmid,IPC_RMID,NULL); // destroy the shared memory

    return 0;
}

