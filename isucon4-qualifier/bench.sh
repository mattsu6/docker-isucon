#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Usage: ./bench <target language> <target hostname or ip> <target_branch>"
    exit 1
fi
docker-compose --file "docker-compose-${1}.yml" build --build-arg target_branch=${3} bench;
docker-compose --file "docker-compose-${1}.yml" run --entrypoint "sudo -u isucon -i ./benchmarker bench --host ${2}" bench;