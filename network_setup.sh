#!/bin/bash
# Create an atachable overlay network
docker network create --driver=overlay \
	--attachable \
	--subnet=10.0.1.0/24 \
	swarm_overlay_ssh
