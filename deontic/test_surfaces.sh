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
   cat surfaces/query.n3s | sed -e "s/%ACTION%/${2}/g" > surfaces/query.n3s.tmp
   echo "# eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/query.n3s.tmp"
   eye --nope --no-bnode-relabeling --quiet compiler.n3s ${1} surfaces/query.n3s.tmp 
   rm surfaces/query.n3s.tmp
}

if [ "${WHAT}" == "all" ]; then
   echo "[policy1.tt]"
   query policy1.ttl TalkLoudly

   echo

   echo "[policy2.tt]"
   query policy2.ttl UseBathRoom

   echo
   
   echo "[policy3.tt]"
   query policy3.ttl WashDishes

   echo
   
   echo "[policy4.tt]"
   query policy4.ttl PutDishesInCupboard

   echo
   
   echo "[policy5.tt]"
   query policy5.ttl EatLoudly
elif [ "${QUERY}" == "" ]; then
   show ${WHAT}
else
   query ${WHAT} ${QUERY}
fi
