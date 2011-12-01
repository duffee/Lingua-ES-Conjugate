#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Lingua::ES::Conjugate' );
}

diag( "Testing Lingua::ES::Conjugate $Lingua::ES::Conjugate::VERSION, Perl $], $^X" );
