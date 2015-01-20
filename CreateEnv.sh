#!/bin/bash

htmldir="/home/hyperpelican/scripts/html/dailyreport"
reportdir="/home/hyperpelican/scripts/dailyreport"
serverlistdir="/home/hyperpelian/scripts/serverlist"

create_htmldir(){
      if [ ! -d "$htmldir"] ;then 
         mkdir -p $htmldir
      fi
}

create_reportdir(){
      if [ ! -d "$reportdir"] ;then 
        mkdir -p $reportdir
      fi
}

create_serverlistdir(){
      if [ ! -d "$serverlistdir"] ;then 
         mkdir -p $serverlistdir
      fi
}

create_htmldir
create_reportdir
create_serverlistdir

cp -R html/stylebase $htmldir && cp -R html/sendmail $htmldir && cp hyperpelian-sendmail.sh $reportdir && cp minion.sh $reportdir
touch $serverlistdir/servers.txt
