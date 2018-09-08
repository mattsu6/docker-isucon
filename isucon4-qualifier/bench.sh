#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: ./bench <target language> <target hostname or ip>"
    exit 1
fi
docker-compose --file "docker-compose-${1}.yml" build bench; 
docker-compose --file "docker-compose-${1}.yml" run --entrypoint "sudo -u isucon -i ./benchmarker bench --host ${2}" bench;