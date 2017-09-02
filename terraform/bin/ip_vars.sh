#!/bin/bash

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  echo "The script ${BASH_SOURCE[0]} is being sourced..."
  echo
else
  echo "You must source this bash script, not run it directly."
  echo
  exit 1
fi

export manager_ip=$(terraform output  | grep manager | cut -d " " -f 3)
export workers=$(terraform output  | grep worker | cut -d " " -f 3)
num=0
export manager_ips=(${manager_ip})
export worker_ips=()
echo "\${manager_ips[${num}]}: ${manager_ips[${num}]}"
for i in $(echo $workers | sed "s/,/ /g")
do
  worker_ips[${num}]=${i}
  echo "\${worker_ips[${num}]}: ${worker_ips[${num}]}"
  let num+=1
done

