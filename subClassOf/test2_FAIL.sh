#!/bin/bash

CWD=$(pwd)
CWDRE=$(pwd | sed -e 's/\//\\\//g')

cat premise.ttl | sed -e "s/%CWD%/${CWDRE}/" > _p.ttl
cat conclusion_false.ttl | sed -e "s/%CWD%/${CWDRE}/" > _c.ttl

java -jar ${HOME}/bin/Hermit.jar \
    --premise="file://${CWD}/_p.ttl" \
    --conclusion="file://${CWD}/_c.ttl" \
    --checkEntailment

rm _*.ttl