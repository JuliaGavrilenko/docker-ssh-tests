#!/bin/bash
docker build --rm -t ssh_client .
docker run -itd \
	--name ssh_client \
	--privileged \
	--net swarm_overlay_ssh \
	--ip 10.0.1.11 \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	ssh_client
