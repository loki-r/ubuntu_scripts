#!/bin/bash
arg1=$1
arg2=$2
if [ -z "$1" ]
  then 
   echo "cse_username not provided"
   echo "target_machine_hostname not provided"
   exit
fi
if [ -z "$2" ]
  then
    echo "target_machine_hostname not provided"
    exit
fi
ssh -oBatchMode=yes ${arg1}@${arg2} exit
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | ssh ${arg1}@${arg2} " cat >> ~/.ssh/authorized_keys;"
ssh ${arg1}@${arg2} "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
