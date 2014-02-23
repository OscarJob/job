#!/usr/bin/perl
#assignment3
#create 2 tables by following SQL
#CREATE TABLE USER(USERNAME VARCHAR(30), PASSWORD VARCHAR(30), EMAIL VARCHAR(30), PHONE VARCHAR(30));
#INSERT INTO USER USERNAME, PASSWORD, EMAIL, PHONE VALUES ('administrator', 'Admin123', 'intassn3@senecac.on.ca', '(416)491-5050');
#CREATE TABLE TOLL (COUNTRY VARCHAR(30), ABBREVIATION VARCHAR(30), TOLL INT);
#INSERT INTO TOLL (COUNTRY, ABBREVIATION, TOLL) VALUES ('USA','USA',2.0);

package update;
use Exporter;
our @ISA = qw (Exporter);
our @Export= qw (update check userupdate updateRecord save getdropbox);

use strict;
use CGI qw( :standard );
use DBI;

our $userupdate=param("userupdate");

sub update{
#       print header(), start_html("assignment3");
#content
print start_form (-action => "http://zenit.senecac.on.ca/~int322_121sa14/cgi-bin/assn3/login.pl"), br();
        	print "UPDATE TABLE USER", br();
        	print "Password:", textfield("userpassword"), br();
        	print "Email:", textfield("useremail"), br();
        	print "Phone:", textfield("userphone"), br();
        	print "User:", textfield("userupdate"), br();
        	print hidden({-name=>"last", -value=>"updatetable", -override=>1});
        	print submit ("Submit"), reset("Reset");
        	end_form();
}

sub check{
#check the fields to be updated
        	#print "debug3 $userupdate";
if ($userupdate !~/^\w+/){
       		print "User input is mandatory!Go back to Main page now", br();
        	}
}

sub updateRecord{
#start updateRecord
my $serverName = "db-mysql";
my $serverPort = "zenit.senecac.on.ca:3306";
my $serverUser = "int322_121sa14";
my $serverPass = "ddZH5427";
my $serverDb = "int322_121sa14";

my ($dbh, $sth, @row);

my $temp1= param("userupdate");
my $temp2= param("userpassword");
my $temp3= param("useremail");
my $temp4= param("userphone");

my $dbh = DBI->connect("DBI:mysql:database=$serverDb;host=$serverName;port=$serverPort", $serverUser, $serverPass);
my $string = "INSERT INTO USER (USERNAME, PASSWORD, EMAIL, PHONE) VALUES('$temp1', '$temp2', '$temp3', '$temp4' )";
$dbh->do( $string );
print "update successfully";
print "<a href =\"http://zenit.senecac.on.ca/~int322_121sa14/cgi-bin/assn3/login.pl\">Back to login page </a>";
}

sub save{
        	print "saving signup information!";
my $serverName = "db-mysql";
my $serverPort = "zenit.senecac.on.ca:3306";
my $serverUser = "int322_121sa14";
my $serverPass = "ddZH5427";
my $serverDb = "int322_121sa14";

my ($dbh, $sth, @row);

my $s_temp1= param("signupdate");
my $s_temp2= param("signpassword");
my $s_temp3= param("signemail");
my $s_temp4= param("signphone");

my $dbh = DBI>connect("DBI:mysql:database=$serverDb;host=$serverName;port=$serverPort", $serverUser, $serverPass);
print "connect ok", br();
my $string = "INSERT INTO USER (USERNAME, PASSWORD, EMAIL, PHONE) VALUES('$s_temp1', '$s_temp2', '$s_temp3', '$s_temp4' )";
$dbh->do( $string );
print "insert ok",br();
}

sub getdropbox{
#       print "getting drop box elements from mysql";
my $serverName = "db-mysql";
my $serverPort = "zenit.senecac.on.ca:3306";
my $serverUser = "int322_121sa14";
my $serverPass = "ddZH5427";
my $serverDb = "int322_121sa14";
 
my ($dbh, $sth, @row);
my $dbh = DBI->connect("DBI:mysql:database=$serverDb;host=$serverName;port=$serverPort", $serverUser, $serverPass);
#print "connected";
$sth=$dbh->prepare("SELECT ABBREVIATION FROM TOLL");
#print "prepare successfully";
$sth->execute();
#print "execute successfully and store ABBREVIATION for search";
#search
our @array;
my $i=0;
while(  @array= $sth->fetchrow_array() ) {
print "<option>$array[0]<option/>";
}
print"<select/>";
}

return 1;


