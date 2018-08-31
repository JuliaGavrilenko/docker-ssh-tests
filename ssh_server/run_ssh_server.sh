#!/bin/sh
docker build --rm -t ssh_server .
docker run -itd \
	--privileged \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--name ssh_server \
	--net swarm_overlay_ssh \
	--ip 10.0.1.10 \
	ssh_server
