# Docker-Arachni
Docker build for Arachni scanner; forked from "treadie/docker-arachni"

## Arachni
Arachni is a feature-full, modular, high-performance Ruby framework aimed towards helping penetration testers and administrators evaluate the security of modern web applications. see the good work here: www.arachni-scanner.com

## Why
The default sqlite deployment has many limitations as described on the arachni webui landing page. This image has been preconfigured to used postgres as the dateabase to overcome these limitations.

<!---
## versions
`bardelch/arachni:latest` - arachni framework v1.5.1 & webui v0.5.12
`bardelch/arachni:1.4-0.5.10` - arachni framework v1.4 & webui v0.5.10
--->

## How

### TL;DR
`./run.sh`

First run / reset database
Seperate terminal: 
`./resetDB.sh`


### Prereqs: setup.sh (runs if 'password.txt' is not present from 'run.sh')
This image relies on a seperate and running postgres instance. The easiest way of doing this is using the official postgres Docker image

Pull postgres

`docker pull postgres`

Configure postgres for arachni

setup.sh generates a password file that can be sourced for the password to be in the environment variable

### Database Connection (database.yml)
The database configuration settings for Arachni are configured by environment variables. By default they have been preconfigured with what comes out of the box from the Arachni developers. The variables of interest for this image are (with their default values):

Dockerfile (match name of postgres docker image?): 
`POSTGRES_HOST postgres`

password.txt (generated from setup.sh):
These variables are used by both 'postgres' and 'arachni'; they conform to postgres Docker image var naming convention
`POSTGRES_PASSWORD arachni_production`
`POSTGRES_USER arachni`
`POSTGRES_DB secret`

### Run: run.sh

if the 'password.txt' file is not present, it is created.  If there are 'arachni' or 'postgres' docker images running they are stopped and deleted.

Feel free to manipulate and modify the above command for production environments as you see fit. I plan to create a compose file to automate this whole process, but not there yet.


The docker containers are started with the generated environment vars
`docker run --name postgres --env-file password.txt -d postgres`

The arachni container is started and linked to existing 'postgres' container
`docker run -t --name arachni --env-file password.txt --link postgres:db -p 9292:9292 bardelch/arachni`

If this is the first time it has been run then starup will throw a warning as the `arachni_production` database has not been setup using `arachni_web_task db:setup` this also means the webui will not load. to resolve this issue, run the following command: 

`./resetDB.sh`
<!--- `docker exec -i arachni /opt/arachni/bin/arachni_web_task db:setup` --->

_Note: Use the command above with caution. It's designed to setup a clean and default database. if you have scan data in your database and run this command it will be removed!_

<!---
Manipulate as required by starting the image using `-e` for example:

`docker run --name arachni --link postgres -e POSTGRES_HOST=server.com -p 9292:9292 bardelch/arachni`
--->
