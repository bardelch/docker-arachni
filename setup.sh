#!/bin/bash

docker pull postgres

#https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/

function randpw()
{
	cat /dev/urandom | tr -dc [:alnum:] | head -c16; echo
}

#postgres
echo POSTGRES_PASSWORD=$(randpw) > password.txt
echo POSTGRES_USER=arachni >> password.txt
echo POSTGRES_DB=arachni_dev >> password.txt

chmod 700 password.txt
#change name of file

docker build -t "bardelch/arachni" .
docker history bardelch/arachni
#docker build -t "bardelch/arachni:latest" -t "bardelch/arachni:1.4-0.5.10" .
