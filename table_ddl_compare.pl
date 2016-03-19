#!/usr/bin/perl

use v5.10;
use strict;
use DBI;

my $text1="CREATE TABLE PERL.TEST
       (ID INT, FNAME CHAR(20),
         LNAME VARCHAR(20));";

my $text2="CREATE TABLE PERL.TEST
        (ID INT, FNAME CHAR(20),
         LNAME VARCHAR(20));";

# Strip out the owner names from the procedure definition.
# Replace one or more white spaces followed by one or more word characters followed by a dot with empty string.
say $& if $text1 =~ s/(\s+\w+?\.)//g;
say $1 if $text2 =~ s/(\s+\w+?\.)//g;

say;

$text1 =~ s/\s+//g;
$text2 =~ s/\s+//g;

say $text1;
say $text2;

say "Strings are equal" if ( $text1 eq $text2 );
