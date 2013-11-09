#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;
use Config::Zirka;

my $parse = Config::Zirka->new();

###########################
# General module tests... #
###########################

my $res = $parse->from_string('var = 1; foo = 55; bar = abc; foobar = l33t;');

print "\n---\n$res\n---\n";

pass('parse') if $res;

########
# done #
########
1;

