package CQL::BooleanNode;

use strict;
use warnings;
use base qw( CQL::Node );

=head1 NAME

CQL::BooleanNode - represents a boolean node in a CQL parse tree

=head1 SYNOPSIS
    
    n/a

=head1 DESCRIPTION

Base class for boolean nodes in a CQL parse tree. See CQL::AndNode
and CQL::OrNode. CQL::BooleanNode inherits from CQL::Node. Typically
you'll want to use CQL::AndNode or CQL::OrNode to instantiate the 
object.

=head1 METHODS

=head2 new()

You must pass in both a left and right parameter, which should be
CQL::Node objects.

=cut

sub new {
    my ( $class, %args ) = @_;
    return bless { left => $args{left}, right => $args{right} }, 
        ref($class) || $class;
}

=head2 left()

=cut

sub left {
    return shift->{left};
}

=head2 right()

=cut

sub right {
    return shift->{right};
}

=head2 toCQL()

=cut

sub toCQL {
    my $self = shift;
    my $left = $self->left();
    my $right = $self->right();
    ## return: (left) op (right)
    return 
        '(' . $left->toCQL() . ') ' .
        $self->op() .
        ' (' . $right->toCQL() . ')';
}

1;
