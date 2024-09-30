#!/bin/bash

CWD=$(pwd)
CWDRE=$(pwd | sed -e 's/\//\\\//g')

cat conflict1.ttl | sed -e "s/CWD/${CWDRE}/" > _temp.ttl

java -jar ${HOME}/bin/Hermit.jar -k "file://${CWD}/_temp.ttl" 

rm _*.ttl