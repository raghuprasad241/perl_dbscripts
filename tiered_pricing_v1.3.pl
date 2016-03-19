#!/usr/bin/perl
use v5.10; 
use strict;
use warnings;

my @row;

# Logic behind below while loop is that with each number on the line,
# the number along with any trailing spaces will be replaced with blank space
# and then inserted into an array, with the exception of the first element.
# This is needed to compare the elements of the matrix column by column and
# not across the columns. This is a nasty script, is there a better way ?

while(my $line = <DATA>)
{
      my @arr;
      while(my ($elem) = $line =~ /(\s*\d+)/g)
      {
           push @arr, $elem;
           $line =~ s/(\s*$elem)/' ' x length($1)/e;
      }
       #Data 1014          1       10 
       #becomes 3 element "1014", "              1", "                 10"
       push @row, \@arr;
}      

#Sort element with same length, exchange position
foreach my $r1 (0 .. $#row)
{
    #Take 1 row as base, check other rows
    my @remain = grep !/$r1/,(0 .. $#row);
    foreach my $r2 (0..$#remain)
      {
       # Foreach element in row, find element with same length
       # in different row (mean same column) -> check value and exchange if needed
       foreach my $c1 (0..$#{$row[$r1]})
          {
                 foreach my $c2 (0..$#{$row[$r2]})
                 {
                     compare_wrap($row[$r1][$c1], $row[$r2][$c2]);
                 }
            }
      }
}

map {print merge_str(@$_),"\n"} @row;

#SUPPORT FUNCTION

sub compare_wrap
{
    if( length($_[0]) == length($_[1]) && eval($_[0]) < eval($_[1]))  
    {
         @_[0, 1] = @_[1, 0];   # This is a short cut in perl to swap the columns between two rows.
    }
     
} 

# Remember the first while loop mess?? This is where we clean it up and print the strings/arrays properly
sub merge_str
{
      foreach my $i (1 .. $#_)
      { 
            my $temp = ' ' x length($_[$i-1]);
            $_[$i] =~ s/$temp/$_[$i-1]/; 

      }
      $_[-1];
}

# For this script to work all the columns must by right justfied or end at the same offset.
__DATA__
1014      1	 10
1015     51	100
1016     11	 50
1017    101       -
