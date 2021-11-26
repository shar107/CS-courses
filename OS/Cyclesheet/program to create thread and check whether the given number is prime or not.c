#include<stdio.h>
#include<string.h>
#include<pthread.h>
#include<stdlib.h>
#include<unistd.h>
void*prime(int n)
{
 if (n==0)
 printf("It is neither prime nor composite\n");
 else
 {
 int i,m=0,flag=0;
 m=n/2;
 for(i=2;i<=m;i++)
 {
 if(n%i==0)
 {
 printf("Number is not prime\n");
 flag=1;
 break;
 }
 }
 if(flag==0)
 printf("Number is prime\n");
 return NULL;
 }
}
void* hello(void*arg)
{
 printf("Enter the number\n");
 int n;
 scanf("%d",&n);
 prime(n);
 return NULL;
}
int main()
{
 pthread_t new_t;
 pthread_create(&new_t,NULL,hello,NULL);
 pthread_join(new_t,NULL);
 return 0;
}
