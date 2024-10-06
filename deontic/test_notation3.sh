#!/bin/bash

WHAT=$1
QUERY=$2

if [ "${WHAT}" == "" ]; then
   echo "usage: $0 policy [query]"
   exit 1
fi

if [ "${QUERY}" == "" ]; then
   eye --nope --quiet compiler.n3 ${WHAT} --pass
else
   eye --nope  --quiet compiler.n3 ${WHAT} ${QUERY} --pass
fi
