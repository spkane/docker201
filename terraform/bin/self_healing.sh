#!/bin/bash

set -eu

manager_ip=$(terraform output  | grep manager | cut -d " " -f 3)

curl -s -o /dev/null -w "%{http_code}" http://${manager_ip}:80/
echo; echo
docker -H ${manager_ip}:2375 service ls --format "{{.ID}}: {{.Name}} {{.Replicas}}"
echo
set +e
curl -s -o /dev/null -w "%{http_code}" http://${manager_ip}:80/die
set -e
echo; echo
docker -H ${manager_ip}:2375 service ls --format "{{.ID}}: {{.Name}} {{.Replicas}}"
echo
for i in {1..4}; do
  sleep 1
  curl -s -o /dev/null -w "%{http_code}" http://${manager_ip}:80/
  echo; echo
  docker -H ${manager_ip}:2375 service ls --format "{{.ID}}: {{.Name}} {{.Replicas}}"
  echo
done

