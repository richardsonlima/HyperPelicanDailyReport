# Hyper Pelican Daily Report
Collect and report Linux System Activity Information with Hyper Pelican Linux Daily Report

Hyper Pelican helps you create html reports for your Linux virtual machines across different
clouds , using any device that can access the web. It is provided under the 
GNU AGPL v3.0 License. Created by Richardson Lima at http://blog.richardsonlima.com.br

Installation
------------

Hyper Pelian is written in Shell Script and Html5. Currently it is tested and developed using
Bash 4.3. The only system wide requirements are Bash interpreter. Git is used for revision control. 

Clone the repository
------------
To install the basic requirements to cloning in a Debian based distro do::

    sudo aptitude install git
    git clone https://github.com/richardsonlima/HyperPelicanDailyReport.git

Create Hyper Pelican Environment
------------

    cd ~/HyperPelicanDailyReport
    mkdir -p /home/hyperpelican/scripts/html/dailyreport
    cp -R html/stylebase /home/hyperpelican/scripts/html/dailyreport/
    cp -R html/sendmail /home/hyperpelican/scripts/html/dailyreport/
    cp hyperpelian-sendmail.sh /home/hyperpelian/scripts/
    mkdir -p /home/hyperpelian/scripts/serverlist/
    touch /home/hyperpelian/scripts/serverlist/servers.txt
    ssh-keygen -t rsa -C "HyperPelican"
    export EDITOR="vim"
    export VISUAL="vim"
    Ctrl+x+e
    [ vim command ] Esc+i
    
    #!/bin/bash
    user="hyperpelican"
    for i in $(cat /home/hyperpelican/scripts/serverlist/servers.txt);
    do 
     ssh-copy-id -p 22 $user@$i;
    done
    
    [ vim command ] :wq!
    
Scheduling
------------
run crontab -e and add this lines below

For example, you can run a report at 9 a.m every week with:

0 9 * * 1 /home/hyperpelican/scripts/dailyreport/hyperpelican.sh |tee -a /tmp/hyperpelican-debug.log

Send reports to e-mail
------------
Run:
    bash /home/hyperpelian/scripts/hyperpelian-sendmail.sh 
