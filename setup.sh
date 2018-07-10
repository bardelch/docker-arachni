#!/bin/bash
#https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/

function randpw()
{
	cat /dev/urandom | tr -dc [:alnum:] | head -c16; echo
}

#arachni vars in yaml
#echo POSTGRES_PASSWORD=$(randpw) > password.txt
#echo POSTGRES_DATABASE=arachni_dev >> password.txt
#echo POSTGRES_USERNAME=arachni >> password.txt

#postgres
echo POSTGRES_PASSWORD=$(randpw) > password.txt
echo POSTGRES_USER=arachni arachni_dev >> password.txt
echo POSTGRES_DB=arachni_dev >> password.txt

docker build -t "bardelch/arachni" .
docker history bardelch/arachni
#docker build -t "bardelch/arachni:latest" -t "bardelch/arachni:1.4-0.5.10" .
