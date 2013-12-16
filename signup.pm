#!/usr/bin/perl
#assignment2- signup.pm



package signup;
use Exporter;
our @ISA = qw (Exporter);
our @Export= qw (signup);

use strict;
use CGI qw( :standard );

#if ((param("last")) eq "signed"){
#       print "signup info has submitted!", br();
#}
#else{
#       print "signup info has not submitted";
#       signup();
#}
sub signup{
print "signing",br();
        	print start_form(-action => "http://zenit.senecac.on.ca/~int322_121sa14/cgi-bin/assn3/checkform.pl"), br();
       	 print "SIGN UP FORM", br();
       	 print "Password:", textfield("signpassword"), br();
        	print "Email:", textfield("signemail"), br();
        	print "Phone:", textfield("signphone"), br();
        	print "User:", textfield("signupdate"), br();
        	print hidden({-name=>"last", -value=>"signed", -override=>1});
        	print submit("Submit"), reset("Reset");
        	end_form();
        	print "finished checking",br();
}
return 1;












