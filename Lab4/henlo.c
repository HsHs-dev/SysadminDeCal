/*
 *
 * Number of processes is 2^n where n is the number of forks.
 *
*/


#include <stdio.h>
#include <unistd.h>

int main(void) {

	fork();
	printf("henlo: %d\n", getpid());


}
