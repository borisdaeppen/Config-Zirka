#!/usr/bin/perl

use strict;
use warnings;

#######################
# TESTING starts here #
#######################
use Test::More tests => 3;

###########################
# General module tests... #
###########################

my $module = 'Config::Zirka';
use_ok( $module );

my $obj = $module->new();

isa_ok($obj, $module);

can_ok($obj, 'new');
my $data = 'ab = 3;cd = 88  ;   ef  = abcdf;'
. 'ab = rrrr;';
my $res = $obj->from_string($data);
#my $res = $obj->from_string('name = "Name"; version = 1.2');

print "\n---\n$res\n---\n";

########
# done #
########
1;

