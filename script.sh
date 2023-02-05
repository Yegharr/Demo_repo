#!/bin/bash 
container_name="test_container"

if docker ps -a | grep -q $container_name; then
  # Remove the container
  docker rm -f $container_name
fi
