#!/bin/bash

set -e
set -u

source ./bin/ip_vars.sh 1> /dev/null

for i in "${secondary_manager_ips[@]}"
do
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  -o "BatchMode=yes" -i ~/.ssh/oreilly_aws ubuntu@${i} "sudo docker swarm join --token ${SWARM_MANAGER_TOKEN} ${primary_manager_ip}:2377"
done

echo
echo "Test your setup with:"
echo
echo "docker -H ${primary_manager_ip}:2375 node list"
echo
