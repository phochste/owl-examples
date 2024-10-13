#!/bin/bash

WHAT=$1
QUERY=$2

if [ "${WHAT}" == "" ]; then
   echo "usage: $0 policy [query]"
   exit 1
fi

show() {
   echo "# eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/show.n3s"
   eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/show.n3s
}

query () {
   echo "# eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/query.n3s"
   eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/query.n3s
}

if [ "${WHAT}" == "all" ]; then
   for f in policy*.n3s; do
      echo "[$f]"
      show $f
   done
elif [ "${QUERY}" == "show" ]; then
   show ${WHAT}
else
   query ${WHAT}
fi
