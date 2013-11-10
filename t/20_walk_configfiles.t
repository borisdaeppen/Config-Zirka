#!/usr/bin/perl

use strict;
use warnings;

use Test::More;
use Config::Zirka;
use File::Slurp;

my $count_of_tests = 0;

my $parse = Config::Zirka->new();

my @files = read_dir ('t/configfiles_to_pass');

for my $file ( @files ) {

    $count_of_tests++;

    my $text = read_file( 't/configfiles_to_pass/' . $file ) ;

    my $res = $parse->from_string($text);

    my $testname = "parse $file";
    if ($res) {
        pass($testname)
    }
    else {
        fail($testname);
    }
}

done_testing( $count_of_tests );

1;

