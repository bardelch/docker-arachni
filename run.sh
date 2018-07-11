#!/bin/bash

if [ ! -e password.txt ]
then
	./setup.sh
fi

./stopDockerImages.sh
./cleanImages.sh

#docker run --name postgres -e POSTGRES_PASSWORD=$POSTGRES_PASS -e POSTGRES_USER=arachni -e POSTGRES_DB=arachni_production -d postgres
#docker run -t --name arachni -e POSTGRES_PASSWORD=$POSTGRES_PASS --link postgres:db -p 9292:9292 bardelch/arachni
#docker exec -i arachni /opt/arachni/bin/arachni_web_task db:setup


echo docker run --name postgres --env-file password.txt -d postgres
docker run --name postgres --env-file password.txt -d postgres

echo docker run -t --name arachni --env-file password.txt --link postgres:db -p 9292:9292 bardelch/arachni
docker run -t --name arachni --env-file password.txt --link postgres:db -p 9292:9292 bardelch/arachni

#echo docker exec -i arachni /opt/arachni/bin/arachni_web_task db:setup
#docker exec -i arachni /opt/arachni/bin/arachni_web_task db:setup

