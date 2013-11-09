package Config::Zirka;

our $VERSION = 0.1;

use strict;
use warnings;

use Marpa::R2;
use Data::Printer;

# Constructor of this class
sub new {
    my $self=shift;
    my $ref={
            };

    bless($ref, $self);

    return $ref;
}

sub from_string {
    my $self = shift;
    my $in   = shift;

    my $g = Marpa::R2::Scanless::G->new({
            default_action => '::array',
            source         => \(<<'END_OF_SOURCE'),
    
:start        ::= name_value_pairs
name_value_pairs ::= name_value_pair+
name_value_pair ::= name zuweiser value terminator
name            ~ [\w]+
zuweiser        ~ [=]
value           ~ [\d\w]+
terminator      ~ [;\n\s]
:discard        ~ ws
ws              ~ [\s]+

END_OF_SOURCE
    });
    
    my $re = Marpa::R2::Scanless::R->new({ grammar => $g });
    
    print "Trying to parse:\n$in\n\n";
    $re->read(\$in);

    my $value = ${$re->value};
    p $value;


}

1;

__END__

=encoding utf8

=head1 NAME

Config::Zirka - Read config files, as long they make any sence.

=head1 SYNOPSIS

Not yet sure...
Just thinking loud.

 use Config::Zirka;
 my $cz = Config::Zirka->new();

 my $h = {};

 $h = $cz->from_filename('/home/app/conf/app.cfg');
 $h = $cz->from_string('name=Miau;version=1.2');

=head1 METHODS

=head2 new

=head2 from_filename

=head2 from_string

=head1 COPYRIGHT & LICENSE

Copyright 2013 Boris Däppen, all rights reserved.

This program is free software; you can redistribute it and/or modify it under the same terms of Artistic License 2.0.

=head1 AUTHOR

Boris Däppen E<lt>boris_daeppen@bluewin.chE<gt>

=cut

