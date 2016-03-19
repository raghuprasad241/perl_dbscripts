#!/usr/bin/perl
use v5.10;

%TV = (
flintstones => {
series => "flintstones",
nights => [ "monday", "thursday", "friday" ],
members => [
{ name => "fred", role => "husband", age => 36, },
{ name => "wilma", role => "wife", age => 31, },
{ name => "pebbles", role => "kid", age => 4, },
],
},
jetsons => {
series => "jetsons",
nights => [ "wednesday", "saturday" ],
members => [
{ name => "george", role => "husband", age => 41, },
{ name => "jane", role => "wife", age => 39, },
{ name => "elroy", role => "kid", age => 9, },
],
},
simpsons => {
series => "simpsons",
nights => [ "monday" ],
members => [
{ name => "homer", role => "husband", age => 34, },
{ name => "marge", role => "wife", age => 37, },
{ name => "bart", role => "kid", age => 11, },
],
},
);

for $family (keys %TV) {
my $rec = $TV{$family}; # temporary pointer
@kids = ();
for $person (@{$rec->{members}}) {
if ($person->{role} =~ /kid|son|daughter/) {
push @kids, $person;
}
}
# $rec and $TV{$family} point to same data!
$rec->{kids} = [@kids];
}

$TV{simpsons}{kids}[0]{age}++;

say $TV{simpsons}{members}[2]{age};
say $TV{simpsons}{kids}[0]{age};

for $family ( keys %TV ) {
print "the $family";
print " is on ", join (" and ", @{ $TV{$family}{nights} }), "\n";
print "its members are:\n";
for $who ( @{ $TV{$family}{members} } ) {
print "$who->{name} ($who->{role}), age $who->{age}\n";
}
print "children: ";
print join (", ", map{$_->{name}} @{ $TV{$family}{kids} } );
print "\n\n";
}
