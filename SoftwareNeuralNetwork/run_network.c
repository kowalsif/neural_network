#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <string.h>
#include "fann.h"
#include <math.h>

#define PATH_TO_WII_PIPE "wiiuse/wiidata"
#define PATH_TO_NETWORK "test.net"
#define PATH_TO_SAMPLES "wiiuse/samples/advanced/"
#define PATH_TO_NEW_SAMPLES "samples/"
#define NUM_INPUTS 6
#define NUM_OUTPUTS 4

int main(int argc, char * args[]){
    char data[50]; //Arbitrary length
	char path[100];
    char * token;
    FANN_EXTERNAL fann_type input[] = {M_PI};
    FANN_EXTERNAL fann_type * output;
    int num_samples, i;
	    
	struct fann *ann = fann_create_from_file(PATH_TO_NETWORK);
	printf("Output is: %f\n", fann_run(ann, input)[0]);
//	output = fann_run(ann, input); //run input through network
}
