#!/usr/bin/perl

use strict;
use warnings;

#######################
# TESTING starts here #
#######################
use Test::More tests => 4;

###########################
# General module tests... #
###########################

my $module = 'Config::Zirka';
use_ok( $module );

my $obj = $module->new();

isa_ok($obj, $module);

can_ok($obj, 'new');
can_ok($obj, 'from_string');

########
# done #
########
1;

