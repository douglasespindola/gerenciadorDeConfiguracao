#!/bin/bash

volume="$1"
url="$2"
hInicio=$(date +%s)
contador=0

echo "
URL: $2
TAXA: $1 requisições/seg"

get () {
  curl -s -v "$1" 2>&1 | tr '\r\n' '\\n' | awk '{print $0"\n------------------"}' >> /tmp/teste-conexao.log
}

while true
do
  echo Volume de requisições: $contador

  for i in `seq 1 $1`
  do	  
    get $2 &
    ((contador++))
  done
done 
