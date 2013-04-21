#!/usr/bin/perl
#ver 1.0 2013-04-21 first version

#Begin of html page
print "Content-type: text/html\n\n";

#Title
print "<font size=+4>System info</font>\n<br><br>";

#Environment section
print "<font size=+1>Environment</font><br>\n";
print "<pre>";
foreach (sort keys %ENV)
{
  print "$_: $ENV{$_}\n";
}
print "</pre>";  


#CPU info section
print "<br><hr><br>";  
print "<font size=+1>CPU info</font>\n";
$tmp = `cat /proc/cpuinfo`; 
print "<pre>";
print "$tmp\n";
print "</pre>";

#Users logged in section
print "<br><hr><br>";  
print "<font size=+1>Users logged in</font>\n";
$tmp = `w`; 
print "<pre>";
print "$tmp\n";
print "</pre>";

#Running processes section
print "<br><hr><br>";  
print "<font size=+1>Running processes</font>\n";
$tmp = `ps -ef`; 
print "<pre>";
print "$tmp\n";
print "</pre>";

#Open files section
print "<br><hr><br>";  
print "<font size=+1>Open files</font>\n";
$tmp = `lsof`; 
print "<pre>";
print "$tmp\n";
print "</pre>";

#End titles
print "<br><hr><br>";
print "Created for testing purposes by Tomas Antos, 2013"



