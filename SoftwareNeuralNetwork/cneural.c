#include "fann.h"
#include <math.h>
#include <stdio.h>

#define MAX_EPOCHS 10000
#define EPOCHS_BETWEEN_REPORTS 1000
#define DESIRED_ERROR .001

void create_training_file(int num_inputs, int num_outputs){
	int i;
	FILE * training_file;
	char * file_name ="training_file";
	int num_data = 100;

	training_file = fopen(file_name, "w");
	fprintf(training_file, "%d %d %d\n", num_data, num_inputs, num_outputs);
	for(i=0; i<num_data; i++){
		fprintf(training_file,"%f\n", ((float)i)*.1);
		fprintf(training_file,"%f\n", sin( ((float)i)*.1 ));
	}
	fclose(training_file);
}

void create_ann(int num_inputs, int num_hidden, int num_outputs, char * path_to_training_file){
	unsigned int layers []= {num_inputs, num_hidden, num_outputs};
    struct fann * ann = fann_create_standard_array(3, layers);
	char fann_path[100];

    fann_set_activation_function_layer(ann, FANN_SIGMOID_SYMMETRIC, 1);
    fann_set_activation_function_layer(ann, FANN_SIGMOID_SYMMETRIC, 2);

    fann_train_on_file(ann, path_to_training_file , MAX_EPOCHS,
       EPOCHS_BETWEEN_REPORTS, DESIRED_ERROR);

	sprintf(fann_path, "networks/network%d.net", num_hidden);

    fann_save(ann, fann_path);

    fann_destroy(ann);
}

int main()
{
	int i;
    const float desired_error = (const float) 0.01;
    const unsigned int max_epochs = 10000;
    const unsigned int epochs_between_reports = 10;
	int num_inputs = 1;
	int num_outputs = 1;
	int num_hidden = 1000;
	int num_networks = 100;
	char settings[100] = "networks/settings";
	FILE * settingsFile;

	create_training_file(num_inputs, num_outputs);

	for(i=0; i<num_networks; i++){
		printf("Creating and training network %d\n", i+1);
		create_ann(num_inputs, i+1, num_outputs, "training_file");
	}

	settingsFile = fopen(settings, 'w');
	fprintf(settingsFile, "networks:%d", num_networks);
	fclose(settingsFile);

    return 0;
}

