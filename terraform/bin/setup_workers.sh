#!/bin/bash

export manager=$(terraform output  | grep manager | cut -d " " -f 3)
export workers=$(terraform output  | grep worker | cut -d " " -f 3)
for i in $(echo $workers | sed "s/,/ /g")
do
  ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  -o "BatchMode=yes" -i ~/.ssh/oreilly_aws ubuntu@${i} "sudo docker swarm join --token ${SWARM_TOKEN} ${manager}:2377"
done

echo
echo "Test your setup with:"
echo
echo "docker -H ${manager}:2375 node list"
echo
