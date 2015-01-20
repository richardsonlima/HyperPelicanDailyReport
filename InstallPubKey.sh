#!/bin/bash
user="hyperpelican"
  for i in $(cat /home/hyperpelican/serverlist/servers.txt);
    do 
      ssh-copy-id -p 22 $user@$i;
    done
    
