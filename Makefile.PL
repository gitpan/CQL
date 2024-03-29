use ExtUtils::MakeMaker;
use strict;
use warnings;

## create the Makefile
WriteMakefile(
    'NAME'		=> 'CQL',
    'DISTNAME'		=> 'CQL',
    'ABSTRACT'		=> 'Common Query Language Parser',
    'VERSION_FROM'	=> 'lib/CQL/Parser.pm', 
    'PMLIBDIRS'		=> [ qw( lib/ ) ],
    'AUTHOR'		=> 'Ed Summers <ehs@pobox.com>',
    'PREREQ_PM'		=> { 
                            'String::Tokenizer' => '0.05',
                            'Test::Exception'   => '0.2',
			    },
);
