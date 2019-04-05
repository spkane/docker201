#!/bin/bash

BASE="${HOME}/class-docker-cicd"

echo "This will reset all the Jenkins data under ${BASE} !!!"
echo
echo "Are you sure this is what you want to do?"
read -p "You must type 'yes' to confirm: " -r
echo
if [[ $REPLY == "yes" ]]; then
  rm -rf ${BASE}/layout/jenkins/data/*
  rm -rf ${BASE}/layout/jenkins/data/.groovy
  rm -rf ${BASE}/layout/jenkins/data/.java
  echo "completed"
else
  echo "aborted"
fi

