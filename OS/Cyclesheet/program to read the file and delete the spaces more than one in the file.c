#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
void remSpace(char *str,char *retstr){
 int i;
 int counter=0;
 for (i=0;str[i];i++){
 if (str[i]!=' '){
 retstr[counter]=str[i];
 counter++;
 }
 else if (str[i]==' '){
 retstr[counter]=' ';
 while(str[i+1]==' '){
 i++;
 }
 counter++;
 }
 }
}
int main() {
 int fd;
 char buffer[80];
 char retbuffer[80];
 fd=open("t.txt",O_RDWR);
printf("fd=%d",fd);
 if (fd!=-1){
 printf("\nt.txt opened with read and write access.\n");
 lseek(fd,0,SEEK_SET);
 read(fd,buffer,50);
 printf("\nText inside the Document is:%s",buffer);
 remSpace(buffer,retbuffer);
 lseek(fd,0,SEEK_SET);
 write(fd,retbuffer,sizeof(retbuffer));
 lseek(fd,0,SEEK_SET);
 read(fd,buffer,sizeof(retbuffer));
 printf("\nReading text from the file after removing more than one spaces: 
%s",buffer);
 printf("\n\n");
 close(fd);
 }
 return 0;
}
