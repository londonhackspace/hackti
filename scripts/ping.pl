#!/usr/bin/perl

open(F,'>>ping.log');
print F $ARGV[0], "\n";
close(F);

# take care for tcp:hostname or TCP:ip@
$host = $ARGV[0];
$host =~ s/tcp:/$1/gis;

open(PROCESS, "ping -c 1 $host | grep icmp_seq | grep time |");
$ping = <PROCESS>;
close(PROCESS);
$ping =~ m/(.*time=)(.*) (ms|usec)/;

if ($2 == "") {
	print "U"; 		# avoid cacti errors, but do not fake rrdtool stats
}elsif ($3 eq "usec") {
	print $2/1000;	# re-calculate in units of "ms"
}else{
	print $2;
}
