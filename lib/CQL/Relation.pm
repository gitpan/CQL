package CQL::Relation;

use strict;
use warnings;
use Class::Accessor;
use CQL::ModifierSet;
use base qw( CQL::Node );

=head1 NAME

CQL::Relation - Object for CQL Relations

=head1 SYNOPSIS

=head1 DESCRIPTION

CQL::Relation represents the common CQL relation operations ( =, E<gt>, 
E<lt>, any, all and exact. In addition modifiers may be applied (stem, 
relevant, fuzzy, phonetic). The operators are passed into the constructor
as the base relation.

=head1 METHODS

=head2 new()

Creates a new CQL::Relation object with the specified base relation.

=cut

sub new {
    my ($class,$base) = @_;
    my $ms = CQL::ModifierSet->new( $base );
    return bless { modifierSet => $ms }, ref($class) || $class;
}

=head2 getBase()

Returns the base relation with which the CQL::Relation object was originally
created.

=cut

sub getBase {
    return shift->{modifierSet}->getBase();
}

=head2 addModifier()

Adds a new relation modifier to the specified CQLRelation.
Typical relation modifiers include relevant, fuzzy stem and phonetic.  
On the whole, these modifiers have a meaningful interpretation
only for the text relations.

=cut

sub addModifier {
    my ($self,$modifier) = @_;
    $self->{modifierSet}->addModifier( undef, $modifier );
}

=head2 getModifiers()

Returns a list of modifiers associated with a CQL relation.

=cut

sub getModifiers {
    return shift->{modifierSet}->getModifiers();
}

=head2 toCQL() 

=cut

sub toCQL {
    return shift->{modifierSet}->toCQL();
}

1;
