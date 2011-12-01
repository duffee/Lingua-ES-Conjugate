#use Test::More qw( no_plan );
use Test::More tests => 24;
use Lingua::ES::Conjugate;

$tense = 'subjunctive';

is( conjugate('hablar', $tense, 1, 1), 'hable', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabes', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'baje', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlemos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejéis', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encanten', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'coma', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprendas', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'beba', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprendamos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'corráis', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'deban', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'viva', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadas', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asista', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumplamos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidáis', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufran', 'Third person plural');


is( conjugate('faltar', 'subjunctivo', 1, 1), 'falte', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 2, 1), 'faltes', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 3, 1), 'falte', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 1, 2), 'faltemos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 2, 2), 'faltéis', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'subjunctivo', 3, 2), 'falten', 'Third person plural - tense name in Spanish');
