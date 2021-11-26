Roundrobin:

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>

struct Process {
    int p_id;
    int AT;
    int BT;
    int rem_BT;
    int CT;
    int TAT;
    int WT;
}buffer;

void SeT(struct Process Ready[], int n){
    buffer.p_id=-1;
    for(int i=0;i<n;i++){
        Ready[i].p_id=-1;
        Ready[i].AT=-1;
        Ready[i].BT=-1;
        Ready[i].rem_BT=-1;
        Ready[i].CT=-1;
        Ready[i].TAT=-1;
        Ready[i].WT=-1;
    }
}

void display(struct Process Process_Array[], int n){
    for (int i=0; i<n;i++) {
        int Pno=i+1;
        printf("\n\nProcess %d\n",Process_Array[i].p_id);
        printf("p_id=%d\n",Process_Array[i].p_id);
        printf("AT=%d\n",Process_Array[i].AT);
        printf("BT=%d\n",Process_Array[i].BT);
        printf("CT=%d\n",Process_Array[i].CT);
        printf("TAT=%d\n",Process_Array[i].TAT);
        printf("WT=%d\n",Process_Array[i].WT);
        printf("Rem_BT=%d\n",Process_Array[i].rem_BT);
    }
}
void getStats(struct Process Process_Array[], int n){
    printf("\nEnter the details of every process in increasing order of their arrival times.\n");
    for (int i=0; i<n;i++) {
        printf("Enter PID of Process %d = ",i+1);
        scanf("%d",&Process_Array[i].p_id);
        printf("Enter Arrival Time of Process %d = ",i+1);
        scanf("%d",&Process_Array[i].AT);
        printf("Enter Burst Time of Process %d = ",i+1);
        scanf("%d",&Process_Array[i].BT);
        Process_Array[i].rem_BT=Process_Array[i].BT;
    }
}

void queue(struct Process Ready[], struct Process Process_Array){
    int i=0;
    while(Ready[i].p_id!=-1){
        i++;
    }
    Ready[i]=Process_Array;
}


struct Process dequeue(struct Process Ready[]){
    struct Process temp=Ready[0];
    int i=0;
    while(Ready[i].p_id!=-1){
        i++;
    }
    int j=0;
    for (j; j<i+1;j++){
        Ready[j]=Ready[j+1];
    }
    return temp;
}

int Ready_No(struct Process Ready[]){
    int i=0;
    while(Ready[i].p_id!=-1){
        i++;
    }
    return i;
}
void calcCT(struct Process Process_Array[], struct Process Ready[], int Time_Quantum, int n){
    int timeline=0;
    int counter=0;
    int Process_counter=0;
    while(counter !=n){
        for(int i=Process_counter;i<n;i++){
            if(Process_Array[i].AT<=timeline){
                queue(Ready, Process_Array[i]);
                Process_counter++;
            }
        }
        int ReadyQueueCheck=Ready_No(Ready);
        if(ReadyQueueCheck==0){
            timeline++;
        }
        else{
            struct Process temp=dequeue(Ready);
            if(temp.rem_BT<=Time_Quantum){
                for(int i=0;i<n;i++){
                    if(Process_Array[i].p_id==temp.p_id){
                        timeline=timeline+Process_Array[i].rem_BT;
                        Process_Array[i].rem_BT=0;
                        Process_Array[i].CT=timeline;
                        counter++;
                    }
                }
            }
            else{
                for(int i=0;i<n;i++){
                    if(Process_Array[i].p_id==temp.p_id){
                        timeline=timeline+Time_Quantum;
                        for(int i=Process_counter;i<n;i++){
                            if(Process_Array[i].AT<=timeline){
                                queue(Ready, Process_Array[i]);
                                Process_counter++;
                            }
                        }
                        Process_Array[i].rem_BT=Process_Array[i].rem_BT-Time_Quantum;
                        queue(Ready, Process_Array[i]);
                    }
                }
            }
        }
    }
}
void calcTAT(struct Process Process_Array[],int n){
    for (int i=0; i<n;i++) {
        Process_Array[i].TAT = Process_Array[i].CT - Process_Array[i].AT;
    }
}
void calcWT(struct Process Process_Array[],int n){
    for (int i=0; i<n;i++) {
        Process_Array[i].WT = Process_Array[i].TAT - Process_Array[i].BT;
    }
}
void calcAvgTAT(struct Process Process_Array[],int n){
    float sumTAT=0;
    for (int i=0; i<n;i++) {
        sumTAT = sumTAT + Process_Array[i].TAT;
    }
    printf("\n\nAverage Turnaround time= %.3f", (sumTAT/n));
}
void calcAvgWT(struct Process Process_Array[],int n){
    float sumWT=0;
    for (int i=0; i<n;i++) {
        sumWT = sumWT + Process_Array[i].WT;
    }
    printf("\n\nAverage Waiting time= %.3f", (sumWT/n));
}
int main(){
    int n, Time_Quantum;
    printf("\nEnter Number of Processes in the system: ");
    scanf ("%d",&n);
    printf("Enter Time Quantum: ");
    scanf("%d",&Time_Quantum);
    struct Process Process_Array[100];
    struct Process Ready[100];
    SeT(Ready, 100);
    struct Process temp=dequeue(Ready);
    getStats(Process_Array, n);
    calcCT(Process_Array,Ready, Time_Quantum, n);
    calcTAT(Process_Array, n);
    calcWT(Process_Array, n);
    display(Process_Array, n);
    calcAvgTAT(Process_Array, n);
    calcAvgWT(Process_Array, n);
    return 0;
}
