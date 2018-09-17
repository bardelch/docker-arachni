#!/bin/bash

docker stop arachni

echo docker run -t --name arachni --env-file password.txt --link postgres:db -p 9292:9292 bardelch/arachni
docker run -t --name arachni --env-file password.txt --link postgres:db -p 9292:9292 bardelch/arachni


