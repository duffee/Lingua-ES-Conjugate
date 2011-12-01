use Test::More tests => 42;
use Lingua::ES::Conjugate;

$tense = 'imperfect';

is( conjugate('hablar', $tense, 1, 1), 'hablaba', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acababas', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajaba', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlábamos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejabais', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantaban', 'Third person plural');

is( conjugate('comer', $tense, 1, 1), 'comía', 'First person singular');
is( conjugate('aprender', $tense, 2, 1), 'aprendías', 'Second person singular');
is( conjugate('beber', $tense, 3, 1), 'bebía', 'Third person singular');
is( conjugate('comprender', $tense, 1, 2), 'comprendíamos', 'First person plural');
is( conjugate('correr', $tense, 2, 2), 'corríais', 'Second person plural');
is( conjugate('deber', $tense, 3, 2), 'debían', 'Third person plural');

is( conjugate('vivir', $tense, 1, 1), 'vivía', 'First person singular');
is( conjugate('añadir', $tense, 2, 1), 'añadías', 'Second person singular');
is( conjugate('asistir', $tense, 3, 1), 'asistía', 'Third person singular');
is( conjugate('cumplir', $tense, 1, 2), 'cumplíamos', 'First person plural');
is( conjugate('decidir', $tense, 2, 2), 'decidíais', 'Second person plural');
is( conjugate('sufrir', $tense, 3, 2), 'sufrían', 'Third person plural');


is( conjugate('faltar', 'imperfecto', 1, 1), 'faltaba', 'First person singular - tense name in Spanish');
is( conjugate('faltar', 'imperfecto', 2, 1), 'faltabas', 'Second person singular - tense name in Spanish');
is( conjugate('faltar', 'imperfecto', 3, 1), 'faltaba', 'Third person singular - tense name in Spanish');
is( conjugate('faltar', 'imperfecto', 1, 2), 'faltábamos', 'First person plural - tense name in Spanish');
is( conjugate('faltar', 'imperfecto', 2, 2), 'faltabais', 'Second person plural - tense name in Spanish');
is( conjugate('faltar', 'imperfecto', 3, 2), 'faltaban', 'Third person plural - tense name in Spanish');

#### irregular imperfect forms ####

is( conjugate('ser', $tense, 1, 1), 'era', 'First person singular');
is( conjugate('ser', $tense, 2, 1), 'eras', 'Second person singular');
is( conjugate('ser', $tense, 3, 1), 'era', 'Third person singular');
is( conjugate('ser', $tense, 1, 2), 'éramos', 'First person plural');
is( conjugate('ser', $tense, 2, 2), 'erais', 'Second person plural');
is( conjugate('ser', $tense, 3, 2), 'eran', 'Third person plural');

is( conjugate('ir', $tense, 1, 1), 'iba', 'First person singular');
is( conjugate('ir', $tense, 2, 1), 'ibas', 'Second person singular');
is( conjugate('ir', $tense, 3, 1), 'iba', 'Third person singular');
is( conjugate('ir', $tense, 1, 2), 'íbamos', 'First person plural');
is( conjugate('ir', $tense, 2, 2), 'ibais', 'Second person plural');
is( conjugate('ir', $tense, 3, 2), 'iban', 'Third person plural');

is( conjugate('ver', $tense, 1, 1), 'veía', 'First person singular');
is( conjugate('ver', $tense, 2, 1), 'veías', 'Second person singular');
is( conjugate('ver', $tense, 3, 1), 'veía', 'Third person singular');
is( conjugate('ver', $tense, 1, 2), 'veíamos', 'First person plural');
is( conjugate('ver', $tense, 2, 2), 'veíais', 'Second person plural');
is( conjugate('ver', $tense, 3, 2), 'veían', 'Third person plural');

