package CQL::Node;

use strict;
use warnings;
use Carp qw( croak );

=head1 NAME

CQL::Node - Base class for nodes in a CQL parse tree

=head1 SYNOPSIS

    n/a

=head1 DESCRIPTION

All the CQL node classes inherit from CQL::Node. CQL::Node
essentially gurantees that its children implement the toCQL()
method.

=cut

sub toCQL {
    my $self = shift;
    ## poor mans interface
    croak( ref($self) . " forgot to implement toCQL()!!!" );
}

1;
