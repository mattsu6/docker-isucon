#!/bin/bash

###
# Usage: $ ./app.sh start <target language> <target branch name for webapp>
# Usage: $ ./app.sh stop <target language>
##

if test $1 = "start"; then
    if [ $# -ne 3 ]; then
      echo "Usage: $ ./app.sh <start or stop> <target language> <target branch name for webapp>。" 1>&2
      exit 1
    fi

    docker-compose --file "docker-compose-${2}.yml" build --build-arg build_branch=${3};
    docker-compose --file "docker-compose-go.yml" up -d nginx;
elif test $1 = "stop"; then
    docker-compose --file "docker-compose-${2}.yml" stop;
else 
    echo "引数はstartかstopのみ許されている.";
    exit 1;
fi
