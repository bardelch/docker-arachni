#!/bin/bash

# just in case we forgot to build the docker container on this server
pushd .
cd ..
docker build -t "bardelch/arachni" .
popd

#resume building rpcd build 


