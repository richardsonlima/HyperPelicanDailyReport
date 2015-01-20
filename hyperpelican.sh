#!/bin/bash
#title           :hyperpelican.sh
#description     :This script will helps you to create a html reports for your Linux virtual machines across different clouds.
#author	     :Richardson Lima
#email           :contatorichardsonlima@gmail.com
#date            :20150102
#version         :0.1    
#usage	     :bash hyperpelican.sh
#notes           :
#bash_version    :4.3-1-release
#==============================================================================

# Enable for debug
# set -x 

user='hyperpelican'
sshport='22'   

timestamp=$(date +"%d-%m-%Y")
stylebase="/home/hyperpelican/scripts/html/dailyreport/stylebase"
base="/home/hyperpelican/scripts/dailyreport"
container="/home/hyperpelican/DailyReports"
ssh='ssh -T -p' 

createbase(){
      if [ ! -d "$container" ]; then
         mkdir -p $container
      fi
      mkdir -p $container/$timestamp
      cp -R $stylebase $container/$timestamp/
}

minion(){
      for server in $(cat /home/hyperpelican/serverlist/servers.txt) ; 
      do 
       $ssh $sshport $user@$server < $base/minion.sh \
       | grep -vE "System load|System information as of|Documentation|Welcome to Ubuntu|Linux ubuntu-pangolim|SMP|\+\-\+\-\+\-" > $container/$timestamp/$server-DailyReport-$timestamp.html; 
      done
}

compact(){
      cd $container && /usr/bin/zip -P $DFGddfgE##@!!!#aD -r DailyReport-$timestamp.zip $timestamp
}

createbase
minion
compact

exit 0

