#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <string.h>
#include "fann.h"
#include <math.h>
#include <time.h>

#define PATH_TO_RESULTS "results/results.rst"
#define PATH_TO_NETWORKS "networks/network"

void run_network(char * path_to_network,int num_iterations, FILE * results, int n);

void run_network(char * path_to_network,int num_iterations, FILE * results, int n){
    FANN_EXTERNAL fann_type input[] = {M_PI};
    FANN_EXTERNAL fann_type * output;
    int i;
	double time;
//	clock_t start, end, t;
	struct timeval start, end;
	suseconds_t elapsed_utime;	    
	long int elapsed_time, usec_diff, sec_diff;
	struct fann *ann = fann_create_from_file(path_to_network);

//	t = clock();
	gettimeofday(&start, NULL);
	for(i=0; i<num_iterations; i++){
		output = fann_run(ann, input);
	}
//	t=clock() - t;
	gettimeofday(&end, NULL);
	usec_diff = end.tv_usec - start.tv_usec;
	sec_diff = end.tv_sec - start.tv_sec;
	elapsed_time = sec_diff == 0 ? end.tv_usec - start.tv_usec : (end.tv_usec+ sec_diff*1000000) - start.tv_usec ;

//	fprintf(results, "%d\t%lf\t%lf\n",n,output[0], ((float)t)/CLOCKS_PER_SEC);
	fprintf(results, "%d\t%lf\t%ld\n",n,output[0], elapsed_time);

}

int main(int argc, char * args[]){
    char data[50]; //Arbitrary length
	char path[100];
	char settings[100] = "networks/settings.cfg";
	int num_networks, i, num_iterations=10000;
	FILE * settingsFile, * results;
	char network[100];

	settingsFile = fopen(settings, "r");
	fscanf(settingsFile, "networks:%d", &num_networks);
	fclose(settingsFile);

	results = fopen(PATH_TO_RESULTS, "w");
	fprintf(results, "#Hidden Units\tresult\ttime (useconds)\n");
	for(i=0; i<num_networks; i++){
		printf("Testing network%d\n", i+1);
		sprintf(network, "%s%d.net", PATH_TO_NETWORKS, i+1);
		run_network(network, num_iterations, results, i+1);
	}
	fclose(results);
}
