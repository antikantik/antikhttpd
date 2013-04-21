# Class: antikhttpd
#
# This class installs httpd server, configures it to permit running cgi
# scripts in /var/html/www, starts the server and prepares cgi script
# /var/html/www/index.cgi that can is executed when user opens ip of
# node in browser.
#
# v1.0 2013-04-21 Script created by Tomas Antos

class antikhttpd {
  package { "httpd":
    ensure => latest
  }
define configfile(owner = root, group = root, mode = 644, source, 
                  backup = false, recurse = false, ensure = file) {
    file { $name:
            mode => $mode,
            owner => $owner,
            group => $group,
            backup => $backup,
            recurse => $recurse,
            ensure => $ensure,
            source => "puppet://$server/modules/antikhttpd/$source"
    }
}
  configfile { "/etc/httpd/conf/httpd.conf":
    source => "/config/httpd.conf",mode => 644,
    require => Package["httpd"]}

  configfile { "/var/www/html/index.cgi":
    source => "/scripts/index.cgi",mode => 755,
    require => Package["httpd"]}

  group { apache: gid => 48 }

  user { apache: 
   comment => "Apache",
   uid => 48,
   gid => 48,
   home => "/var/www",
   shell => "/sbin/nologin"
  }

  service { httpd:
    ensure => running,
    subscribe => [ File["/etc/httpd/conf/httpd.conf"],
                   Package["httpd"] ]
  }
}