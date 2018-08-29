#!/bin/bash
echo "Configuring container"
/usr/sbin/init
chmod 600 /root/.ssh/authorized-keys
ssh-keygen -A 
/usr/sbin/sshd
sleep infinity
