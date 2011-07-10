#!/usr/bin/perl
#based on this web page:
#http://www.perlfect.com/articles/telnet.shtml

#cacti onput shit here:
#http://docs.cacti.net/manual:087:3a_advanced_topics.1_data_input_methods#data_input_methods

#if shit aint updating try looking here:
#http://forums.cacti.net/post-84375.html&highlight=

use strict;
use Net::Telnet;
our %Cfg;
require 'bestatcfg.pl';
my @buffer;
my $telnet;
my @output;
my $null;
my $host = $Cfg{'router'};

#new telnet object, tell it what the prompt looks like
$telnet = new Net::Telnet (Timeout=>50, Errmode=>'die', Prompt=> '/\=\>$/');
#open the telent conenction and login
$telnet->open($host);
$telnet->login($Cfg{'user'}, $Cfg{'password'});

#get inferface throughput stats
@buffer = $telnet->cmd(':ip iflist');
#remove the . . . . . . sepereators
$buffer[2] =~ s/\.//g;
$buffer[3] =~ s/\.//g;

#print out the switch stats
@output = split(/\s+/, $buffer[3]);
print $output[1], "In:", $output[4], " ",$output[1], "Out:" , $output[5], " ";

#print the internet stats
@output = split(/\s+/, $buffer[2]);
print $output[1], "In:", $output[4], " ",$output[1], "Out:" , $output[5], " ";

#load in the adsl data
@buffer = $telnet->cmd(':adsl info expand enabled');


#split the downstream speed data out
#get just the numbers
my @downspeed  = split(/\:/, $buffer[10]);
#split the number by space
@downspeed = split(/\s+/, $downspeed[1]);

my @upspeed = split(/\:/, $buffer[11]);
@upspeed = split(/\s+/, $upspeed[1]);

print "SyncUp:", $upspeed[2], " SyncDown:", $downspeed[2], " ";


#now do the same with the signal to noise ratio
my @signo =  split(/\:/, $buffer[17]);
@signo = split(/\s+/, $signo[1]);
print "snUp:", $signo[2], " snDown:", $signo[1], " ";

#This is the attenuation


@signo =  split(/\:/, $buffer[18]);
@signo = split(/\s+/, $signo[1]);
print "AttUp:", $signo[2], " AttDown:", $signo[1], "\n";






#$telnet->cmd('exit');
