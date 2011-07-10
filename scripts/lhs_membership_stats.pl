#!/usr/bin/perl
 
use strict;
use LWP::Simple;
    
eval {
  my $file = get("http://london.hackspace.org.uk/member_stats.php");
  print $file;
  1;
} or do {
  print "NaN";
}
