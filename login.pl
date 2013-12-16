#!/usr/bin/perl
#assignment1- login.pl
use warnings;
use strict;
use CGI qw( :standard );
use update;
use signup;

our $user= param ("username");
our $pwd= param ("password");
our $hidden= param ("last");

print header(), start_html( "assignment1") ;

if(!param()){
print start_form (), "username", textfield("username"), br();
print "password", '<input type = "password" name="password" />';
print submit("submit form"), end_form();
}

if (param()){
if($hidden ne "updatetable"){
if (($user eq "administrator") && ($pwd eq "Admin123")){
     			update::update();
}
else{
        		if(searchuser() eq "found"){
        			welcome();
        		}
        		else{
        			print "login error! Please log in again";
        			signup::signup();
        			print start_form (), "username", textfield("username"), br();
        			print "password", '<input type = "password" name="password" /> ';
        			print submit("submit form"), end_form();
}
}
}
}

if(param()){
#print "debug1";
if($hidden eq "updatetable"){
#start checking and then updating
       	 #print "debug2";
        	update::check();
        	update::updateRecord();
}
}
print end_html();

sub welcome {
#       my @dropbox;
#       our $count=0;
#       @dropbox=update::getdropbox();
#       while(@dropbox){
#               print "fetching elements";
#               $dropbox[i]=pop(@dropbox);
#               $count++;
#               print "$dropbox[i]";

print "welcome", br();
        	print start_form (-action => "http://zenit.senecac.on.ca/~int322_121sa14/cgi-bin/assn1/result.pl"), "Calling Time", textfield("calltime"), br();

        	print "Country", "<Select type = \"Checkbox\" name=\"countrySelect\" size=3>";#<option>USA<option/><option>CAN<option/><option>FRA<option/><Select/>", br();
        	update::getdropbox();
        	print br();
print "Result Show: Abbreviation", '<input type = "Checkbox" name="abbreviation" />';
        	print "country Code", '<input type = "Checkbox" name="countryCheckbox" />', br();
        	print "Currency Exchange", '<input type = "Radio" name="yes" />', "yes", '<input type = "radio" name="no" />', "no",br();
        print submit("submit form"), end_form();
        print '<input type = "reset" value="Reset"/>';
}

sub searchuser {
print "searching",br();
my $serverName = "db-mysql";
my $serverPort = "zenit.senecac.on.ca:3306";
my $serverUser = "int322_121sa14";
my $serverPass = "ddZH5427";
my $serverDb = "int322_121sa14";

my ($dbh, $sth, @row);
my $dbh = DBI->connect("DBI:mysql:database=$serverDb;host=$serverName;port=$serverPort", $serverUser, $serverPass);
print "connected";
$sth=$dbh->prepare("SELECT USERNAME FROM USER");
print "prepare successfully";
$sth->execute();
print "execute successfully and store USERNAME for search";
#search
my @array;
my $i=0;
while(  @array= $sth->fetchrow_array() ) {
        		if ($array[0] eq $user){
                	print "found", br();
                	return "found";
                	}
        	}
print "not found";
return "not found";
}
# @array= ( row1 col1, row1 col2~E ) and then write the row using format defined later













