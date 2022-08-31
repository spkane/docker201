#!/bin/bash

set -e
set -u

source ./bin/ip_vars.sh 1> /dev/null

ssh -o "IdentitiesOnly=yes" -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  -i ~/.ssh/oreilly_aws ubuntu@${primary_manager_ip}

echo
echo "Test your setup with:"
echo
echo "docker -H ${primary_manager_ip}:2375 node list"
echo
