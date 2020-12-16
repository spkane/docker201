#!/bin/bash

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  echo "The script ${BASH_SOURCE[0]} is being sourced..."
  echo
else
  echo "You must source this bash script, not run it directly."
  echo
  exit 1
fi

export managers=$(terraform output  | grep manager | cut -d " " -f 3)
export workers=$(terraform output  | grep worker | cut -d " " -f 3)
num=0
for i in $(echo $managers | sed "s/,/ /g" | sed 's/"/ /g' )
do
  all_manager_ips[${num}]=${i}
  echo "\${all_manager_ips[${num}]}: ${all_manager_ips[${num}]}"
  let num+=1
done
export primary_manager_ip=(${all_manager_ips[0]})
export secondary_manager_ips=(${all_manager_ips[@]:1})
export worker_ips=()
num=0
for i in $(echo $workers | sed "s/,/ /g" | sed 's/"/ /g' )
do
  worker_ips[${num}]=${i}
  echo "\${worker_ips[${num}]}: ${worker_ips[${num}]}"
  let num+=1
done

