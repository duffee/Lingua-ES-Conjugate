#use Test::More qw( no_plan );
use Test::More tests => 36;
use Lingua::ES::Conjugate;

$tense = 'conditional';

is( conjugate('hablar', $tense, 1, 1), 'hablaría', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acabarías', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajaría', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlaríamos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejaríais', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantarían', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'comería', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprenderías', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'bebería', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprenderíamos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'correríais', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'deberían', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'viviría', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadirías', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asistiría', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumpliríamos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidiríais', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufrirían', 'Third person plural');


is( conjugate('faltar', 'condicional', 1, 1), 'faltaría', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'condicional', 2, 1), 'faltarías', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'condicional', 3, 1), 'faltaría', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'condicional', 1, 2), 'faltaríamos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'condicional', 2, 2), 'faltaríais', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'condicional', 3, 2), 'faltarían', 'Third person plural - tense name in Spanish');

#### irregular conditional forms ####

is( conjugate('salir', $tense, 1, 1), 'saldría', 'First person singular');
is( conjugate('decir', $tense, 2, 1), 'dirías', 'Second person singular');
is( conjugate('haber', $tense, 3, 1), 'habría', 'Third person singular');
is( conjugate('hacer', $tense, 1, 2), 'haríamos', 'First person plural');
is( conjugate('poder', $tense, 2, 2), 'podríais', 'Second person plural');
is( conjugate('poner', $tense, 3, 2), 'pondrían', 'Third person plural');

is( conjugate('querer', $tense, 1, 1), 'querría', 'First person singular');
is( conjugate('saber', $tense, 2, 1), 'sabrías', 'Second person singular');
is( conjugate('caber', $tense, 3, 1), 'cabría', 'Third person singular');
is( conjugate('tener', $tense, 1, 2), 'tendríamos', 'First person plural');
is( conjugate('valer', $tense, 2, 2), 'valdríais', 'Second person plural');
is( conjugate('venir', $tense, 3, 2), 'vendrían', 'Third person plural');
