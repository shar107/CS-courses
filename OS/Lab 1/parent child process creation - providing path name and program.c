path 1:

#include  <stdio.h>
#include  <unistd.h>
#include  <sys/types.h>

int main() {
        printf("This is in program path1.c with Process ID : %d",getpid());
        printf("\n");
        char * arg[] = {"19","BCE","2105",NULL};
        execv("./path2", arg);
        return 0;
}


path 2:

#include  <stdio.h>
#include  <unistd.h>
#include  <sys/types.h>

int main() {
                printf("This is in program path2.c with Process ID : %d",getpid());
                printf("\n");
                return 0;
}
