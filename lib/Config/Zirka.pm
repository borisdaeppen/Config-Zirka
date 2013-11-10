package Config::Zirka;

our $VERSION = 0.1;

use strict;
use warnings;

use Marpa::R2;

#########################################
# HERE ALL THE PARSING LOGIC IS DEFINED #
#########################################

my $data_structure = ''

# we will have name-value pairs
.'
:start              ::= config_data
config_data         ::= data_set+
data_set            ::= name_value_pair | list
'
# LISTS
.'
list                ::= name assignation list_opener config_data list_closer
list_opener         ~   [{]
list_closer         ~   [}]
'
# of which each pair has this structure
.'
name_value_pair     ::= name assignation value terminator
'
# VARIABLE NAME:
.'
name                ~   name_start name_end
name_start          ~   [\w]
name_end            ~   [\w\d]*
'
# ASSIGNATION
.'
assignation         ~   assignation_start assignation_end
assignation_start   ~   [=\-:]
assignation_end     ~   [>]*
'
# VALUE
.'
value               ~   val | single_quoted_val | double_quoted_val
val                 ~   [^\n\s;{]+
single_quoted_val   ~   single_quote val_singleq_content single_quote
double_quoted_val   ~   double_quote val_doubleq_content double_quote
'
# QUOTES
."
single_quote        ~   [']
val_singleq_content ~   [^']+
"
.'
double_quote        ~   ["]
val_doubleq_content ~   [^"]+
'
# TERMINATOR
.'
terminator          ~   [;\n\s]*
'
# discard whitespace
.'
:discard            ~   ws
ws                  ~   [\s]+
'
;

###########
# METHODS #
###########

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
            source         => \$data_structure,
    });

    my $re = Marpa::R2::Scanless::R->new({ grammar => $g });

    $re->read(\$in);

    my $value = ${$re->value};

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

