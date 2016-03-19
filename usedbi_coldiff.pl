#!/usr/bin/perl
use strict;
use diagnostics;
use warnings;
use DBI;

my $dbh=DBI->connect("dbi:DB2:TEST", "traveler", "TraVeler");
my $sth=$dbh->prepare("SELECT TABSCHEMA,TABNAME,COLNAME FROM SYSCAT.COLUMNS WHERE TABSCHEMA='PERL'");

$sth->execute();

while ( my $row = $sth->fetchrow_hashref()) {
   print "TABSCHEMA:    $row->{TABSCHEMA}\n";
   print "TABNAME:      $row->{TABNAME}\n";
   print "COLNAME:      $row->{COLNAME}\n\n";
}
