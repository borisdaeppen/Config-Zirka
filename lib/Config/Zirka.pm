package Config::Zirka;

our $VERSION = 0.1;

use strict;
use warnings;

# Constructor of this class
sub new {
    my $self=shift;
    my $ref={
                stack => {}
            };

    bless($ref, $self);

    return $ref;
}

sub from_string {
             shift;
    my $in = shift;

    print "->$in<-\n";

    #
    while ( $in =~ /(.)/g) {
        print "- '$1'\n";
    }

    #return $out;
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

