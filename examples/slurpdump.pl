#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Config::Zirka;
use File::Slurp;
use Data::Printer;

my $parse = Config::Zirka->new();

die 'File as argument needed' unless scalar @ARGV;

my $text = read_file( $ARGV[0] ) ;

my $res = $parse->from_string($text);

p $res;

1;

