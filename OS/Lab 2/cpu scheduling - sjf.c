SJF:

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>

struct Process {
    int p_id;
    int AT;
    int BT;
    int CT;
    int TAT;
    int WT;
    int flag;
};

void display(struct Process Process_Array[], int n){
    for (int i=0; i<n;i++) {
        int Pno=i+1;
        printf("\n\nProcess %d\n",Pno);
        printf("p_id=%d\n",Process_Array[i].p_id);
        printf("AT=%d\n",Process_Array[i].AT);
        printf("BT=%d\n",Process_Array[i].BT);
        printf("CT=%d\n",Process_Array[i].CT);
        printf("TAT=%d\n",Process_Array[i].TAT);
        printf("WT=%d\n",Process_Array[i].WT);
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
        Process_Array[i].flag=0;
    }
}
int MinBT(struct Process Process_Array[],int n){
    int min=0;
    for (int i=0; i<n; i++){
        if (Process_Array[i].BT<Process_Array[min].BT && Process_Array[i].flag==0){
            min=i;
        }
    }
    return min;
}
void calcCT(struct Process Process_Array[], struct Process Ready[], int n){
    int timeline=0;
    int counter=0;
    int min=0;
    int j=0;
    while (counter!=n){
        j=0;
        for (int i=0; i<n; i++){
            if(Process_Array[i].AT<=timeline&& Process_Array[i].flag==0){
                Ready[j]=Process_Array[i];
                j++;
            }
        }
        if (j==0){
            timeline++;
        }
        else{
            min=MinBT(Ready,j);
            for(int i=0; i<n; i++){
                if (Process_Array[i].p_id==Ready[min].p_id){
                    timeline=timeline+Process_Array[i].BT;
                    Process_Array[i].CT=timeline;
                    Process_Array[i].flag=1;
                    counter++;
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
    int n;
    printf("\nEnter the number of processes in the system");
    scanf ("%d",&n);
    struct Process Process_Array[100];
    struct Process Ready[100];
    getStats(Process_Array, n);
    calcCT(Process_Array, Ready, n);
    calcTAT(Process_Array, n);
    calcWT(Process_Array, n);
    display(Process_Array, n);
    calcAvgTAT(Process_Array, n);
    calcAvgWT(Process_Array, n);
    return 0;
}
