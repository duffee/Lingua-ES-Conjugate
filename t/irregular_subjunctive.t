#use Test::More qw( no_plan );
#use Test::More tests => 24;
use Test::More;
use Lingua::ES::Conjugate;

$tense = 'subjunctive';

diag("Need more verbs to test");

is( conjugate('conducir', $tense, 1, 1), 'conduzca', 'First person singular');
is( conjugate('conducir', $tense, 2, 1), 'conduzcas', 'Second person singular');
is( conjugate('conducir', $tense, 3, 1), 'conduzca', 'Third person singular');
is( conjugate('conducir', $tense, 1, 2), 'conduzcamos', 'First person plural');
is( conjugate('conducir', $tense, 2, 2), 'conduzcáis', 'Second person plural');
is( conjugate('conducir', $tense, 3, 2), 'conduzcan', 'Third person plural');

is( conjugate('tener', $tense, 1, 1), 'tenga', 'First person singular');
is( conjugate('tener', $tense, 2, 1), 'tengas', 'Second person singular');
is( conjugate('tener', $tense, 3, 1), 'tenga', 'Third person singular');
is( conjugate('tener', $tense, 1, 2), 'tengamos', 'First person plural');
is( conjugate('tener', $tense, 2, 2), 'tengáis', 'Second person plural');
is( conjugate('tener', $tense, 3, 2), 'tengan', 'Third person plural');

is( conjugate('salir', $tense, 1, 1), 'salga', 'First person singular');
is( conjugate('salir', $tense, 2, 1), 'salgas', 'Second person singular');
is( conjugate('salir', $tense, 3, 1), 'salga', 'Third person singular');
is( conjugate('salir', $tense, 1, 2), 'salgamos', 'First person plural');
is( conjugate('salir', $tense, 2, 2), 'salgáis', 'Second person plural');
is( conjugate('salir', $tense, 3, 2), 'salgan', 'Third person plural');


is( conjugate('faltar', 'subjunctivo', 1, 1), 'falte', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 2, 1), 'faltes', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 3, 1), 'falte', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 1, 2), 'faltemos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 2, 2), 'faltéis', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 3, 2), 'falten', 'Third person plural - tense name in Spanish');

#is( conjugate('ser', $tense, 1, 1), 'sea', 'First person singular');           # Fix this one
#is( conjugate('estar', $tense, 2, 1), 'estés', 'Second person singular');          # Fix this one
#is( conjugate('ir', $tense, 3, 1), 'vaya', 'Third person singular');           # Fix this one
is( conjugate('tener', $tense, 1, 2), 'tengamos', 'First person plural');
is( conjugate('caber', $tense, 2, 2), 'quepáis', 'Second person plural');
is( conjugate('caer', $tense, 3, 2), 'caigan', 'Third person plural');

is( conjugate('conducir', $tense, 1, 1), 'conduzca', 'First person singular');
is( conjugate('decir', $tense, 2, 1), 'digas', 'Second person singular');
#is( conjugate('dar', $tense, 3, 1), 'dé', 'Third person singular');            # Fix this one
#is( conjugate('haber', $tense, 1, 2), 'hayamos', 'First person plural');           # Fix this one
is( conjugate('hacer', $tense, 2, 2), 'hagáis', 'Second person plural');
is( conjugate('oír', $tense, 3, 2), 'oigan', 'Third person plural');

is( conjugate('oler', $tense, 1, 1), 'huela', 'First person singular');
#is( conjugate('oler', $tense, 1, 2), 'olamos', 'First person plural');         # Fix this one
is( conjugate('poder', $tense, 2, 1), 'puedas', 'Second person singular');
is( conjugate('poner', $tense, 3, 1), 'ponga', 'Third person singular');
#is( conjugate('querer', $tense, 1, 2), 'queramos', 'First person plural');         # Fix this one
#is( conjugate('saber', $tense, 2, 2), 'sepáis', 'Second person plural');           # Fix this one
is( conjugate('salir', $tense, 3, 2), 'salgan', 'Third person plural');

is( conjugate('satisfacer', $tense, 1, 1), 'satisfaga', 'First person singular');
is( conjugate('traducir', $tense, 2, 1), 'traduzcas', 'Second person singular');
is( conjugate('valer', $tense, 3, 1), 'valga', 'Third person singular');
is( conjugate('venir', $tense, 1, 2), 'vengamos', 'First person plural');
is( conjugate('ver', $tense, 2, 2), 'veáis', 'Second person plural');
is( conjugate('yacer', $tense, 3, 2), 'yazcan', 'Third person plural');

done_testing();
