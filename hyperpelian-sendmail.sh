#!/bin/bash
#title           :hyperpelian-sendmail.sh
#description     :This script will helps you to create a html reports for your Linux virtual machines across different clouds.
#author		      :Richardson Lima
#email           :contatorichardsonlima@gmail.com
#date            :20150102
#version         :0.1
#usage		       :bash hyperpelian-sendmail.sh
#notes           :
#bash_version    :4.3-1-release
#==============================================================================

# Enable for debug
# set -x 
timestamp=$(date +"%d-%m-%Y")
export MAILFROM="dailyreport@hyperpelicanserver"
export MAILTO="sysadmin1@zyz.com,sysadmin2@zyz.com"
export SUBJECT="[ Hyper Pelican ] Linux Daily Reports"
export BODY="/home/hyperpelican/scripts/dailyreport/sendmail/html/body/build.html"
export ATTACH="/home/hyperpelican/DailyReports/DailyReport-$timestamp.zip"
export MAILPART=`uuidgen` ## Generates Unique ID
export MAILPART_BODY=`uuidgen` ## Generates Unique ID

(
 echo "From: $MAILFROM"
 echo "To: $MAILTO"
 echo "Subject: $SUBJECT"
 echo "MIME-Version: 1.0"
 echo "Content-Type: multipart/mixed; boundary=\"$MAILPART\""
 echo ""
 echo "--$MAILPART"
 echo "Content-Type: multipart/alternative; boundary=\"$MAILPART_BODY\""
 echo ""
 echo "--$MAILPART_BODY"
 echo "Content-Type: text/plain; charset=ISO-8859-1"
 echo "You need to enable HTML option for email"
 echo "--$MAILPART_BODY"
 echo "Content-Type: text/html; charset=ISO-8859-1"
 echo "Content-Disposition: inline"
 cat $BODY
 echo "--$MAILPART_BODY--"

 echo "--$MAILPART"
 echo 'Content-Type: application/pdf; name="'$(basename $ATTACH)'"'
 echo "Content-Transfer-Encoding: uuencode"
 echo 'Content-Disposition: attachment; filename="'$(basename $ATTACH)'"'
 echo ""
 uuencode $ATTACH $(basename $ATTACH)
 echo "--$MAILPART--"
) | /usr/sbin/sendmail $MAILTO
