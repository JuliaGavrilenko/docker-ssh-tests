# Docker CentOS 7 SSH server and SSH client
CentOS 7 containers that work as ssh-server and ssh-client or both, out of the box.

## Pre-requisites
1. 2 machines (let's call them **ssh_server_vm** and **ssh_client_vm**) with Docker > 18 installed (tested on Docker 18.06.1-ce)

## Instructions

1. Setup Docker Swarm
    
    1. On the ssh_server_vm, run
        1. ``` docker swarm init```
    
    This should print a join command for the worker in the form of
    ```docker swarm join --token <your-token> <your-ip-address>:2377```
    
    1. On the ssh_client_vm, run the join commanded generated in previous step

1. Clone this repository on both the machines

1. Setup an overlay network
    1. On the ssh_server_vm, from within the cloned repository's root directory
    ```./network_setup.sh```
1. Build ssh_server image and Start the ssh_server container 
    1. On the ssh_server_vm, run
    ```./ssh_server/run_ssh_server.sh```
1. Build ssh_client image and Start the ssh_client container
    1. On the ssh_client_vm, form the cloned repository's root directory, run
    ```./ssh_client/run_ssh_client.sh```
  
1. ssh into the server from the client
    1. From the ssh_client_vm, log into the ssh_client container
    ```docker exec -it ssh_client bash```
    1. From the container, issue an ssh to the server
    ```ssh root@10.0.1.10```
    (pass: thereisnospoon)
## Images on DockerHub
1. ssh_server: https://hub.docker.com/r/maany/ssh_server/ 
1. ssh_client: https://hub.docker.com/r/maany/ssh_client/
