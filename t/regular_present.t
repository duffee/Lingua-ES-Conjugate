#use Test::More qw( no_plan );
use Test::More tests => 24;
use Lingua::ES::Conjugate;

$tense = 'present';

is( conjugate('hablar', $tense, 1, 1), 'hablo', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabas', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'baja', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlamos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejáis', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantan', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'como', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprendes', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'bebe', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprendemos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'corréis', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'deben', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'vivo', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añades', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asiste', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumplimos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidís', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufren', 'Third person plural');


is( conjugate('faltar', 'presente', 1, 1), 'falto', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'presente', 2, 1), 'faltas', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'presente', 3, 1), 'falta', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'presente', 1, 2), 'faltamos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'presente', 2, 2), 'faltáis', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'presente', 3, 2), 'faltan', 'Third person plural - tense name in Spanish');
