#!/bin/bash
user="hyperpelican"
serverlistdir="/home/hyperpelian/scripts/serverlist"

  for i in $(cat $serverlistdir/servers.txt);
    do 
      ssh-copy-id -p 22 $user@$i;
    done
    
