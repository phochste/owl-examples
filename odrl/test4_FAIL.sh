#!/bin/bash

CWD=$(pwd)
CWDRE=$(pwd | sed -e 's/\//\\\//g')

cat conflict3.n3 | sed -e "s/CWD/${CWDRE}/" > _temp.n3

eye --nope --quiet  _temp.n3 test.n3

rm _*.n3