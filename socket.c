#include <stdio.h>
#include <stdlib.h>

#include <time.h>

#include <sys/types.h>
#include <sys/socket.h>

#include <netinet/in.h>

#define LOOP_ITERATIONS 1000000  

int benchmark();

int main(){

    //create a socket
    int network_socket;
    network_socket = socket(AF_INET, SOCK_STREAM, 0);

    //specify the address for the socket
    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(9002);
    server_address.sin_addr.s_addr = INADDR_ANY;

    int connection_status = connect(network_socket, (struct sockaddr * ) &server_address, sizeof(server_address));
    if(connection_status == -1){
        printf("There is an error making a connection to the remote socket \n\n");
    }


    int server_response = benchmark();
    recv(network_socket, &server_response, sizeof(server_response), 0);

    printf("The time taken to complete the computation in seconds was: %d\n", server_response);

    

    close(network_socket);


    return 0;
}


int benchmarkIntOperation(){

  clock_t start_time, end_time;
  double elapsed_time;
  long long sum = 0; 

  // Start time measurement
  start_time = clock();

  for (int i = 0; i < LOOP_ITERATIONS; i++) {
    sum += i * 2;
  }

  // End time measurement
  end_time = clock();

  // Calculate elapsed time in seconds
  elapsed_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

  return elapsed_time;
}


int benchmarkQuicksort(){

    clock_t start_time, end_time;
    double elapsed_time;

    //generate a random array of size 10000 to sort
    int random_array[10000];
    int range_width = 20001;
  
    for (int j = 0; j < 10000; j++) {
        random_array[j] =  rand() % range_width;
    }

    // Start time measurement
    start_time = clock();

    int piviot = sizeof(random_array) - 1;
    for(int k = 0; k < 9999; k++){
        
    }



}

