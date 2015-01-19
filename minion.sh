#!/bin/bash
#title           :minion.sh
#description     :This script will helps you to create a html reports for your Linux virtual machines across different clouds.
#author		 :Richardson Lima
#email           :contatorichardsonlima@gmail.com
#date            :20150102
#version         :0.1    
#notes           :bash hyperpelican.sh
#bash_version    :4.3-1-release
#==============================================================================

# Enable for debug
# set -x 
        
LSB=/usr/bin/lsb_release

cat << HEAD

<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>Hyper Pelican - Linux Daily Report</title>

	<link href="./stylebase/css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="./stylebase/normalize.css" type="text/css" media="screen">
	<link rel="stylesheet" href="./stylebase/style.css" type="text/css" media="screen">
	<link rel="stylesheet" href="./stylebase/revslider.css" type="text/css" media="screen">
	<link rel="stylesheet" href="./stylebase/responsive.css" type="text/css" media="screen">

	<link rel="stylesheet" href="./stylebase/teal.css" type="text/css" media="screen"> <!-- Change Skin here -->

	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	
	<script async="" src="./stylebase/analytics.js"></script><script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48988720-3', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body class="wide">
	<!-- Wrap -->
	<div id="wrap">
		<!-- Header -->
		<header id="header" class="clearfix">
			<div class="container clearfix">
				<div id="top-bar" class="clearfix">
					<div class="info clearfix">
						<span><img alt="" src="./stylebase/phone-icon.png"> +xx xx xxxx-xxxx </span>
						<span style="padding-left: 90px; color: #0db0bf;"> <a href="#" target="_blank" title=""></a></span><a href="#" target="_blank" title="">
					
					
					</a></div><a href="#" target="_blank" title="">
					
					
					<div class="flags clearfix">
						<!--<a href="#" class="active"><img alt="" src="images/flags/br.png"></a>
						<a href="#"><img alt="" src="images/flags/uk.png"></a>-->
					</div>
					
					</a><div class="icone_rede_social clearfix"><a href="#" target="_blank" title="">
						</a><a href="https://www.facebook.com/pages/hyperpelian" target="_blank" title="Facebook Page at Hyper Pelican"><img alt="" src="./stylebase/facebook.png"></a>
						<a href="https://twitter.com/HyperPelian" target="_blank" title="Twitter at Hyper Pelian"><img alt="" src="./stylebase/twitter.png"></a>
						<a href="http://www.linkedin.com/company/hyperpelian?trk=top_nav_home" target="_blank" title="Linkedin at Hyper Pelian"><img alt="" src="./stylebase/linkedin-icon.png"></a>
					</div>
				</div>

				<div id="logo">
					<a href="#"><img alt="" src="./stylebase/logo_hyperpelian.png"></a>
				</div>

				<nav id="nav">
					<ul id="navlist" class="sf-menu clearfix sf-js-enabled sf-shadow">
					
               </ul>
			</div>
		</header>
		<!-- End Header -->

		<!-- Page Title -->
		<section id="page-title">
	    	<div class="container clearfix">
	            <h1>Hyper Pelican - Linux System Report </h1>
	            <nav id="breadcrumbs">
	                <ul>
	                   <!--  <li><a href="#"> </a> / </li> -->
	                   <!--  <li><a href="#"> </a> / </li> -->
	                    <li> </li>
	                </ul>
	            </nav>
	        </div>
	    </section>
	    <!-- End Page Title -->

		<!-- Content -->
		<section id="content">
			<div class="container clearfix">			
				<div class="row">
					<!-- Main -->
					<div id="main" class="eight column">
						
				

						
						<!-- Posts Items -->
						<div class="post-items ver-2 row">
							
							
							<div class="post-item twelve column">
								<div class="post-image">
									<!--- <img src="./stylebase/banner_logo_hyperpelican.jpg"> -->
								</div>

								<div>
HEAD

cat << HOSTNAME1
									<h3 class="post-title">System Report for
HOSTNAME1

echo `hostname`
cat << HOSTNAME2
</h3>  
HOSTNAME2

cat << TODAY
									<div>
										<p>

- Date Range Processed and Processing Initiated :
echo "Today's date is `date`, this is week `date +"%V"`"
</p>
TODAY

cat << DATE

<B> Processing Initiated : </B> 
DATE

DATE=$(date +"%m-%d-%Y-%T")
echo $DATE

cat << END1


										</p>
									</div>
								</div>
END1
						 
				
cat << BLK1
			 
			 <!-- Content -->
		<section id="content" style="padding-top: 0;">
			<div class="container clearfix">			
				<div class="row">
					<!-- Main -->
					<div id="main" class="eight column">
						
						<h3 class="title-3">General System Information</h3>
						
					<!-- One FAQ-->
					<div class="toggle open">
						<a href="#" class="toggle-title">System information: </a>
						<div class="toggle-content" style="overflow: hidden; display: block;">
							<p>

BLK1

#################################################################
cat << SYSINFO
<P>
<B> </B> 
<DL><DD>
<SMALL>
<PRE>
SYSINFO
	[ -x $LSB ] && $LSB -a || echo "$LSB command is not insalled (set \$LSB variable)"
	echo "Operating system : $(uname)"
	dnsips=$(sed -e '/^$/d' /etc/resolv.conf | awk '{if (tolower($1)=="nameserver") print $2}')
	echo " Hostname and DNS information "
	echo "Hostname : $(hostname -s)"
	echo "DNS domain : $(hostname -d)"
	echo "Fully qualified domain name : $(hostname -f)"
	#echo "Network address (IP) :  $(hostname -I)"
	echo "DNS name servers (DNS IP) : ${dnsips}"
cat <<SYSINFOEND
</PRE>
</SMALL>
</DL>
<P>
SYSINFOEND

#################################################################

cat << BLK2

							</p>
						</div>
					</div>
					<!-- End One FAQ -->
					
					<!-- One FAQ-->
					<div class="toggle open">
						<a href="#" class="toggle-title">General Information:</a>
						<div class="toggle-content" style="overflow: hidden; display: block;">
						<p>
BLK2

#################################################################
#info about uptime, using uptime command
cat << UPTIME
<P>
<B>This is the uptime information: </B> 
<DL><DD>
<SMALL>
<PRE>
UPTIME
uptime
cat << UPTIMEEND
</PRE>
</SMALL>
</DL>
<P>
UPTIMEEND

echo

#info about free memory via free command
cat << FREE
<P>
<B>Free memory:  </B> 
<DL><DD>
<SMALL>
<PRE>
FREE
free -m
cat << FREEEND
</PRE>
</SMALL>
</DL>
<P>
FREEEND
# Purpose - Display used and free memory info
cat << SYSTEM
<P>
<B>More system information:  </B> 
<DL><DD>
<SMALL>
<PRE>
SYSTEM
echo 
        echo "*********************************"
	echo "*** Virtual memory statistics ***"
        echo "*********************************"
	vmstat
echo
        echo "***********************************"
	echo "*** Top 5 memory eating process ***"
        echo "***********************************"
echo	
	ps auxf | sort -nr -k 4 | head -5	
 
cat <<SYSTEMEND
</PRE>	
</SMALL>
</DL>
<P>
SYSTEMEND
cat << CPUUSE
<P>
<B>Find Out top 10 CPU Consuming Process</B> 
<DL><DD>
<SMALL>
<PRE>
CPUUSE
ps -auxf | sort -nr -k 3 | head -10
cat << CPUUSEEND
</PRE>
</SMALL>
</DL>
<P>
CPUUSEEND

cat << MEMUSE
<P>
<B>Find Out The Top 10 Memory Consuming Process</B> 
<DL><DD>
<SMALL>
<PRE>
MEMUSE
ps -auxf | sort -nr -k 4 | head -10
cat << MEMUSEEND
</PRE>
</SMALL>
</DL>
<P>
MEMUSEEND

#info about disk usage
cat << DF
<H3>Report file system:</H3>
<B> Disk space usage: </B>
<DL><DD>
<SMALL>
<PRE>
DF

# 
# set alert level 90% is default
ALERT=80
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  #echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "<font color="red">Running out of space on \"$partition ($usep%)\" - $(hostname) as on $(date) </font>" 
    echo "<font color="red">Alert: Almost out of disk space $usep% </font>" 
	 else
	 echo "<font color="green">Still enough space on \"$partition ($usep%)\" - $(hostname) as on $(date) </font>" 
     echo "<font color="green"> Notification: Still enough disk space $usep% </font>"
  fi
done
cat << DFEND
</PRE>
</SMALL>
</DL>
<P>
DFEND

cat << NETINFO
<P>
<B>Network General information:  </B> 
<DL><DD>
<SMALL>
<PRE>
NETINFO
	echo "*** Network information ***"
	devices=$(netstat -i | cut -d" " -f1 | egrep -v "^Kernel|Iface|lo")
	#echo "Total network interfaces found : $(wc -w << ${devices})"
  echo
	echo "********************************"
	echo "*** IP Addresses Information ***"
	echo "********************************"
	ip -4 address show
  echo 
	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	netstat -nr
  echo 
	echo "*************************************"
	echo "*** Interface traffic information ***"
	echo "*************************************"
	netstat -i
 
echo  

cat << NETINFOEND
</PRE>
</SMALL>
</DL>
<P>
NETINFOEND
#################################################################

cat << BLK3
						</p>	
						</div>
					</div>
					<!-- End One FAQ -->
					
					<!-- One FAQ-->
					<div class="toggle open">
						<a href="#" class="toggle-title">Web Server Information:</a>
						<div class="toggle-content" style="overflow: hidden; display: block;">
						<p>
BLK3

#################################################################
echo "<P><HR><P>"
echo "<H3> Check Web Server is running :</H3>"

cat << CHECKWEBSERVERCONNECTIONS
<P>
<B>Display Web Server Connections</B> 
<DL><DD>
<SMALL>
<PRE>
CHECKWEBSERVERCONNECTIONS

echo "<font color="black"> Check the number of connection from webserver port </font>"
sudo netstat -an | grep :80 | sort

cat << CHECKWEBSERVERCONNECTIONSEND
</PRE>
</SMALL>
</DL>
<P>
CHECKWEBSERVERCONNECTIONSEND

cat << CHECKJBOSS
<P>
<B> Check JBoss is running </B> 
<DL><DD>
<SMALL>
<PRE>
CHECKJBOSS
if [ -z "$(ps -ef | grep 'jboss' |grep -v grep)" ]
then 
 echo "<font color="red"> JBoss is NOT running </font>"
else
  echo "JBoss is running"
  echo "Opening Jboss log files and check for faults:"

  sudo find /usr/local/jboss/server/default/ -name '*.[log]' -mtime +2 -print0 | xargs -0 egrep -Ri "Error|error|ERROR|OutOfMemory|GRAVE|WARN" | grep -v -E "Richardson|richardson|RICHARDSON"
  sudo find /usr/local/jboss/server/all/ -name '*.[log]' -mtime +2 -print0 | xargs -0 egrep -Ri "Error|error|ERROR|OutOfMemory|GRAVE|WARN" | grep -v -E "Richardson|richardson|RICHARDSON" 
fi

cat << CHECKJBOSSEND
</PRE>
</SMALL>
</DL>
<P>
CHECKJBOSSEND

cat << CHECKTOMCAT
<P>
<B> Check Tomcat is running </B> 
<DL><DD>
<SMALL>
<PRE>
CHECKTOMCAT

if [ -z "$(ps -ef | grep 'tomcat' |grep -v grep)" ]
then 
 echo "<font color="red"> Tomcat is NOT running </font>"
else
  echo "Tomcat is running"

fi

cat << CHECKTOMCATEND
</PRE>
</SMALL>
</DL>
<P>
CHECKTOMCATEND

cat << CHECKAPACHE
<P>
<B> Check Apache is running </B> 
<DL><DD>
<SMALL>
<PRE>
CHECKAPACHE

if [ -z "$( ps -ef | grep 'apache2\|apache\|httpd\|http' |grep -v grep)" ]
then 
 echo "<font color="red"> Apache is NOT running </font>"
else
  echo "Apache is running"
        echo "<font color="red"> Number of Active Connections: </font>"
        netstat -an | grep 80 | grep tcp | grep -v 0.0.0.0 | grep -v ::: | wc -l;
        echo;
        #echo "<font color="red"> Current Active IP's: </font>"
        #netstat -an | grep 80 | grep tcp | grep -v 0.0.0.0 | grep -v ::: | cut -d':' -f2 | cut -d' ' -f12 | sort | uniq;       

fi

cat << CHECKAPACHEEND
</PRE>
</SMALL>
</DL>
<P>
CHECKAPACHEEND

echo "<P><HR><P>"
#################################################################

cat << BLK4
						</p>	
						</div>
					</div>
					<!-- End One FAQ -->
					
					<!-- One FAQ-->
					<div class="toggle open">
						<a href="#" class="toggle-title">Firewall Information and System Log:</a>
						<div class="toggle-content" style="overflow: hidden; display: block;">
						<p>
BLK4

#################################################################
cat << FWLOG
<H3>Firewall Log:</H3>
<B> Iptables: </B>
<DL><DD>
<SMALL>
<PRE>
FWLOG
sudo /sbin/iptables -n -L -v --line-numbers
cat << FWLOGEND
</PRE>
</SMALL>
</DL>
<P>
FWLOGEND

echo "<P><HR><P>"
echo "<H3>Opening log files and check for faults:</H3>"

cat << OPENINGLOGFILES
<P>
<B>Display log files faults </B> 
<DL><DD>
<SMALL>
<PRE>
OPENINGLOGFILES

echo "<font color="red"> Checking if today there were errors in log files . </font>"
echo "<font color="red"> Checking for strings ERROR and WARN in log files created 1 day ago (recursive) ... </font>"

time sudo find /var/log -ctime -1 -name "*.log" | xargs sudo grep "ERROR\|WARN" | sudo grep -r -v "richardson\|richardson.lima\|sar\|sar26\|sa\|sudo\|DROP" 
echo;
cat << OPENINGLOGFILESEND
</PRE>
</SMALL>
</DL>
<P>
OPENINGLOGFILESEND
#################################################################

cat << BLK5
						</p>	
						</div>
					</div>

BLK5

cat << BODYEND
					<!-- End One FAQ -->
					
					
					
					
					
					</div>
				</div>
			</div>
		</section>
                        <!-- End One FAQ -->		 
							

								
							</div>
						</div>
					</div>
					<!-- End Main -->

					<!-- Sidebar -->
					<!-- <aside id="sidebar" class="four column">
						<ul class="no-bullet clearfix p0 m0">
							<li class="widget categories clearfix">
								<h3 class="widget-title">MENU</h3>
								<ul class="no-bullet m0 p0">
									<li><a href="./stylebase/index.html">summary</a></li>
									<li><a href="#">y</a></li
									<li><a href="#">y</a></li>
									<li><a href="#">z</a></li>
									<li><a href="#">c</a></li>
									<li><a href="#">b</a></li>
									<li><a href="#">n</a></li></ul>
							</li>
						</ul>  -->
						
						
						
					</li></ul></aside>
					<!-- End Sidebar -->
				</div>
			</div>
		</section>
		<!-- End Content -->

		<!-- Footer -->
		<footer id="footer">
			
		</footer>
		<!-- End Footer -->
	</div>
	<!-- End Wrap -->

	<script type="text/javascript" src="./stylebase/jquery.min.js"></script>
	<script type="text/javascript" src="./stylebase/jquery.fancybox.js"></script>
	<script type="text/javascript" src="./stylebase/jquery.superfish.js"></script>
	<script type="text/javascript" src="./stylebase/script.js"></script>

</body><script type="text/javascript">var new_nav = new function() {};var x;var old_navigator = window.navigator;for (x in navigator) {if (typeof navigator[x] == 'function') {eval("new_nav." + x + " = function() { return old_navigator." + x + "();};");} else {eval("new_nav." + x + " = navigator." + x + ";");}}new_nav.userAgent = " Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2114.2 Safari/537.36";new_nav.vendor = "";new_nav.platform = "Windows";window.navigator = new_nav;</script></html>

BODYEND
