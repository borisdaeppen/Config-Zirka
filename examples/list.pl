use strict;
use warnings;

use Config::Zirka;
use Data::Printer;

my $parse = Config::Zirka->new();

###########################
# General module tests... #
###########################

my $res = $parse->from_string( 'list = { var = 3; }');  

p $res;

