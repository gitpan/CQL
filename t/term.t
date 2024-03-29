use strict;
use warnings;
use Test::More qw( no_plan );

use_ok( "CQL::TermNode" );
use_ok( "CQL::Relation" );

NO_RELATION: {
    my $node = CQL::TermNode->new( term => 'george' );
    isa_ok( $node, 'CQL::TermNode' );
    is( $node->getTerm(), 'george', 'term()' );
    is( $node->toCQL(), 'george', 'toCQL()' );
}

QUALIFIER_AND_RELATION: {
    my $node = CQL::TermNode->new(
        qualifier   => 'dc.creator',
        relation    => CQL::Relation->new( '>' ),
        term        => 'george' );
    is( $node->getQualifier(), 'dc.creator', 'getQualifier()' );
    is( $node->getRelation()->getBase(), '>', 'getRelation()' );
    is( $node->getTerm(), 'george', 'getTerm()' );
    is( $node->toCQL(), 'dc.creator > george', 'toCQL()' );
}

SPACES_IN_TERM: {
    my $node = CQL::TermNode->new(
        qualifier   => 'dc.creator',
        relation    => CQL::Relation->new( '>' ),
        term        => 'george clinton' );
    is( $node->getQualifier(), 'dc.creator', 'getQualifier()' );
    is( $node->getRelation()->getBase(), '>', 'getRelation()' );
    is( $node->getTerm(), 'george clinton', 'getTerm()' );
    is( $node->toCQL(), 'dc.creator > "george clinton"', 'toCQL()' );
}


