#!/usr/bin/perl

use Time::HiRes qw(gettimeofday tv_interval);

open(F,'>>tcp.log');
print F join(' ', @ARGV[0, 1]), "\n";
close(F);

# take care for tcp:hostname or TCP:ip@
$host = $ARGV[0];
$host =~ s/tcp:/$1/gis;

$port = $ARGV[1];

$start = [gettimeofday];
$ret = `nc -z -w5 $host $port`;

if ($? == 0) {
  $elapsed = tv_interval($start, [gettimeofday]);
  print $elapsed;
} else {
  print 'U';
}
