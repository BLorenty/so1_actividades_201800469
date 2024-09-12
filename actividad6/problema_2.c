#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid;
    pid = fork();
    if (pid > 0) {
        printf("Proceso PADRE. 60 segundos para PID hijo: %d\n", pid);
        sleep(60);
        wait(NULL); 
        printf("Proceso ZOMBIE Recolectado.\n");
    } else if (pid == 0) {
        printf("Proceso HIJO. PID: %d\n", getpid());
        exit(0);
    } else {
        printf("Error al crear el proceso\n");
        return 1;
    }
    return 0;
}
