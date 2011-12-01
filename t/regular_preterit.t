#use Test::More qw( no_plan );
use Test::More;
#use Test::More tests => 15;
use Lingua::ES::Conjugate;

$tense = 'preterit';

is( conjugate('hablar', $tense, 1, 1), 'hablé', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabaste', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajó', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlamos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejasteis', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantaron', 'Third person plural');


is( conjugate('faltar', 'preterito', 1, 1), 'falté', 'First person singular - spanish tense name');
is( conjugate('faltar', 'pretérito', 1, 1), 'falté', 'First person singular - spanish tense name with accent');

is( conjugate('comer', $tense, 1, 1), 'comí', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprendiste', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'bebió', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprendimos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'corristeis', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'debieron', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'viví', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadiste', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asistió', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumplimos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidisteis', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufrieron', 'Third person plural');

done_testing;

#is( conjugate('faltar', 'presente', 1, 1), 'falto', 'First person singular - tense name in Spanish');
#is( conjugate('faltar', 'presente', 2, 1), 'faltas', 'Second person singular - tense name in Spanish');
#is( conjugate('faltar', 'presente', 3, 1), 'falta', 'Third person singular - tense name in Spanish');
#is( conjugate('faltar', 'presente', 1, 2), 'faltamos', 'First person plural - tense name in Spanish');
#is( conjugate('faltar', 'presente', 2, 2), 'faltáis', 'Second person plural - tense name in Spanish');
#is( conjugate('faltar', 'presente', 3, 2), 'faltan', 'Third person plural - tense name in Spanish');
