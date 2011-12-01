#use Test::More qw( no_plan );
use Test::More tests => 36;
use Lingua::ES::Conjugate;

$tense = 'future';

is( conjugate('hablar', $tense, 1, 1), 'hablaré', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabarás', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajará', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlaremos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejaréis', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantarán', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'comeré', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprenderás', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'beberá', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprenderemos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'correréis', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'deberán', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'viviré', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadirás', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asistirá', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumpliremos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidiréis', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufrirán', 'Third person plural');


is( conjugate('faltar', 'futuro', 1, 1), 'faltaré', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'futuro', 2, 1), 'faltarás', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'futuro', 3, 1), 'faltará', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'futuro', 1, 2), 'faltaremos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'futuro', 2, 2), 'faltaréis', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'futuro', 3, 2), 'faltarán', 'Third person plural - tense name in Spanish');

#### irregular future forms ####

is( conjugate('salir', $tense, 1, 1), 'saldré', 'First person singular');
is( conjugate('decir', $tense, 2, 1), 'dirás', 'Second person singular');
is( conjugate('haber', $tense, 3, 1), 'habrá', 'Third person singular');
is( conjugate('hacer', $tense, 1, 2), 'haremos', 'First person plural');
is( conjugate('poder', $tense, 2, 2), 'podréis', 'Second person plural');
is( conjugate('poner', $tense, 3, 2), 'pondrán', 'Third person plural');

is( conjugate('querer', $tense, 1, 1), 'querré', 'First person singular');
is( conjugate('saber', $tense, 2, 1), 'sabrás', 'Second person singular');
is( conjugate('caber', $tense, 3, 1), 'cabrá', 'Third person singular');
is( conjugate('tener', $tense, 1, 2), 'tendremos', 'First person plural');
is( conjugate('valer', $tense, 2, 2), 'valdréis', 'Second person plural');
is( conjugate('venir', $tense, 3, 2), 'vendrán', 'Third person plural');
