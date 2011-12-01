#use Test::More qw( no_plan );
use Test::More tests => 18;
use Lingua::ES::Conjugate;

$tense = 'imperfect_subjunctive';

is( conjugate('hablar', $tense, 1, 1), 'hablara', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabaras', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajara', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charláramos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejarais', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantaran', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'comiera', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprendieras', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'bebiera', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprendiéramos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'corrierais', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'debieran', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'viviera', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadieras', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asistiera', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumpliéramos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidierais', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufrieran', 'Third person plural');


#is( conjugate('faltar', 'subjunctivo', 1, 1), 'falte', 'First person singular - tense name in Spanish');
#is( conjugate('faltar', 'subjunctivo', 2, 1), 'faltes', 'Second person singular - tense name in Spanish');
#is( conjugate('faltar', 'subjunctivo', 3, 1), 'falte', 'Third person singular - tense name in Spanish');
#is( conjugate('faltar', 'subjunctivo', 1, 2), 'faltemos', 'First person plural - tense name in Spanish');
#is( conjugate('faltar', 'subjunctivo', 2, 2), 'faltéis', 'Second person plural - tense name in Spanish');
#is( conjugate('faltar', 'subjunctivo', 3, 2), 'falten', 'Third person plural - tense name in Spanish');
