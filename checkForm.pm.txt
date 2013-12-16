#!/usr/bin/perl
#check

use warnings;
use strict;
use CGI qw( :standard );
use signup;
use update;

our $signuser= param("signupdate");
our $signpassword= param("signpassword");
our $signphone= param("signphone");
our $signemail= param("signemail");

print header(), start_html("checkup");
print "checking", br();
print $signuser, br();
print $signpassword, br();
print $signemail, br();
print $signphone, br();

if( checkname() && checkpwd() && checkphone() && checkemail() ) {
        	print "all ok!";
        	update::save();
       	print "please log in using sign up info now";
}
else{
        	print "not valid";
       	signup::signup();
}

sub checkname{
if ( ($signuser =~ /[0-9]/) && ($signuser =~ /[a-z]|[A-Z]/)&& ($signuser =~ /_/) ){
        print "ok username", br();
        return 1;
}
else{
        print "not username", br();
        return 0;
}
}

#Must consist of at least one digit and one uppercase letter, which means it must have at least two placements.
sub checkpwd{
if ( ($signpassword =~ /[0-9]/) && ($signpassword =~ /[A-Z]/) ){
        		print "ok password", br();
        		return 1;
}
else{
        		print "not password", br();
       		return 0;
}
}

#phone number
sub checkphone{
if ( ($signphone =~ /^[2-9]/) &&
($signphone =~ /^(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*(\d)\D*$/)){
  		$signphone= "$1$2$3-$4$5$6-$7$8$9$10";
        		print "ok phone number", br();
       		 print $signphone;
       		 return 1;
}
else{
        		print "not phone number", br();
        		return 0;
}
}
#email
#user@domainname.com Where:user is the mailbox / account name of the user;The 'user' value consists of any number of alphanumeric characters and underscores. domain name is a fully-qualified hostname or domain name; The 'domain name' value is an opaque string consisting of at least two groups of letters, digits, and underscores. At the end must be followed by ".com".
sub checkemail{
if ($signemail =~ /^\w*@.*\.com$/){
        print "ok email", br();
        return 1;
}
else{
        print "not email", br();
        return 0;
}
}

print end_html();






