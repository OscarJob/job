RESULT.PL
#!/usr/bin/perl
#assignment1- login.pl

use warnings;
use strict;
use CGI qw( :standard );

our  $calltime= param ("calltime");
our  $country= param ("countrySelect");
our $country_name;
our $abbreviation= param ("abbreviation");
our $countryCode= param ("countryCheckbox");


#calculate total fee
my $totalfee= 0;
if ($country eq "CAN"){
        $totalfee= $calltime * 1;
        $country_name= "CANADA";
}
if($country eq "USA"){
        $totalfee= $calltime * 2;
        $country_name= "USA";
}
if($country eq "FRA"){
        $totalfee= $calltime * 3;
        $country_name= "FRANCE";
}

print header(), start_html( "results.pl") ;

if ($abbreviation){
        print "abbreviation!","$country: $totalfee", br();
}
if ($countryCode){
        print "country name!", "$country_name: $totalfee", br();
}
print "Call Time: $calltime";
print "Country: $country";
print "Abbreviation: $abbreviation";
print "Total fee: $totalfee";
print end_html();

