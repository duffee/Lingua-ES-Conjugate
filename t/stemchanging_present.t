#use Test::More;
use Test::More tests => 6;
use Lingua::ES::Conjugate;

#plan skip_all => "Stem-changing verbs haven't been implented yet";

#e_ie = qw( cerrar perder comenzar sentir );
#o_ue = qw( volver acostar dormir mostrar llover );
#u_ue = qw( jugar );
#e_i  = qw( pedir reír seguir servir vestir );

my $tense = 'present';

is( conjugate('volver', $tense, 1, 1), 'vuelvo', 'First person singular');
is( conjugate('volver', $tense, 2, 1), 'vuelves', 'Second person singular');
is( conjugate('volver', $tense, 3, 1), 'vuelve', 'Third person singular');
is( conjugate('volver', $tense, 1, 2), 'volvemos', 'First person plural');
is( conjugate('volver', $tense, 2, 2), 'volvéis', 'Second person plural');
is( conjugate('volver', $tense, 3, 2), 'vuelven', 'Third person plural');

diag('Need more stem-changing tests');

