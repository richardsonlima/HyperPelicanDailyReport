#!/bin/bash

dir1="/home/hyperpelican/scripts/html/dailyreport"
dir2="/home/hyperpelican/scripts/html/dailyreport"
dir3="/home/hyperpelian/scripts/serverlist"

cd ~/HyperPelicanDailyReport

create_dir1(){
      if [ ! -d "$dir1"] ;then 
         mkdir -p $dir1
      fi
}

create_dir2(){
      if [ ! -d "$dir2"] ;then 
        mkdir -p $dir2
      fi
}

create_dir3(){
      if [ ! -d "$dir3"] ;then 
         mkdir -p $dir3
      fi
}

create_dir1
create_dir2
create_dir3

cp -R html/stylebase $dir1 && cp -R html/sendmail $dir1 && cp hyperpelian-sendmail.sh $dir2 && cp minion.sh $dir2
touch $dir3/servers.txt
