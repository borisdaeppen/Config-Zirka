use strict;
use warnings;

use Config::Zirka;
use Data::Printer;

my $parse = Config::Zirka->new();

###########################
# General module tests... #
###########################

my $res = $parse->from_string(
            'var = 1;'
           .'foo = "55";'
           .'bar = abc;'
           .'foo2 = l33t;'
           .'foobar = "abc def";'
           .'key -> value;'
           .'key => value;'
#           .'number:123;'
#           .'number :123;'
           .'number : 123;'
#           ."number ': 123';"
          );  

p $res;

