#!/usr/bin/perl

use strict;
use LWP::Simple;
use XML::Simple;
 
eval {
  my $file = get("http://wiki.hackspace.org.uk/w/api.php?action=query&meta=siteinfo&siprop=statistics&format=xml");
  my $xs1 = XML::Simple->new();
  my $doc = $xs1->XMLin($file);
  my $first = 1;
              
  foreach my $key (keys (%{$doc->{query}->{statistics}})){
    if ($first eq 1) {
      $first = 0;
    } else {
      print " ";
    }
    print $key . ":" . $doc->{query}->{statistics}->{$key};
  }
  1;
} or do {
  print "NaN";
}

