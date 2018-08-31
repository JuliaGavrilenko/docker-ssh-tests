#!/bin/bash
# Create an atachable overlay network
docker network create --driver=overlay --attachable swarm_overlay_ssh
