#!/bin/bash

BASE="${HOME}/docker-workshop"

echo "This will reset all the class data under ${BASE} !!!"
echo
echo "Are you sure this is what you want to do?"
read -p "You must type 'yes' to confirm: " -r
echo
if [[ $REPLY == "yes" ]]; then
  rm -rf ${BASE}/layout/postgres/data/data
  rm -rf ${BASE}/layout/registry/data/docker
  rm -rf ${BASE}/layout/jenkins/data/*
  rm -rf ${BASE}/layout/jenkins/data/.groovy
  rm -rf ${BASE}/layout/jenkins/data/.java
  rm -rf ${BASE}/layout/gogs/data/git
  rm -rf ${BASE}/layout/gogs/data/gogs
  rm -rf ${BASE}/layout/gogs/data/ssh
  echo "completed"
else
  echo "aborted"
fi

