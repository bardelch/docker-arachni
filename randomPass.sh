#!/bin/bash
#https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/

function randpw()
{
	cat /dev/urandom | tr -dc [:alnum:] | head -c16; echo
}

result=$(randpw)
echo $result
