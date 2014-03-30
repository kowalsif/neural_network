#include "fann.h"
#include <math.h>
#include <stdio.h>

void create_training_file(int num_inputs, int num_outputs){
	int i;
	FILE * training_file;
	char * file_name ="training_file";
	int num_data = 100;

	training_file = fopen(file_name, "w");
	fprintf(training_file, "%d %d %d\n", num_data, num_inputs, num_outputs);
	for(i=0; i<num_data; i++){
		fprintf(training_file,"%d\n", i);
		fprintf(training_file,"%f\n", sin(i));
	}
	fclose(training_file);
}

int main()
{
	int i;
    const float desired_error = (const float) 0.01;
    const unsigned int max_epochs = 50000;
    const unsigned int epochs_between_reports = 10;
	int num_inputs = 1;
	int num_outputs = 1;

    unsigned int layers []= {num_inputs, 100, num_outputs};
    struct fann * ann = fann_create_standard_array(3, layers);
//	struct fann_train_data * train_data= fann_create_train(100, 1, 1);

    fann_set_activation_function_layer(ann, FANN_SIGMOID_SYMMETRIC, 1);
    fann_set_activation_function_layer(ann, FANN_SIGMOID_SYMMETRIC, 2);
//    fann_set_activation_function_layer(ann, FANN_SIGMOID_SYMMETRIC, 3);
	create_training_file(num_inputs, num_outputs);
    fann_train_on_file(ann, "./training_file", max_epochs,
       epochs_between_reports, desired_error);

    fann_save(ann, "test.net");

    fann_destroy(ann);

    return 0;
}

