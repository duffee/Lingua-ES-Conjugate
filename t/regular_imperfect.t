#use Test::More qw( no_plan );
use Test::More tests => 7;
use Lingua::ES::Conjugate;

$tense = 'imperfect';

is( conjugate('hablar', $tense, 1, 1), 'hablaba', 'First person singular');
is( conjugate('acabar', $tense, 2, 1), 'acababas', 'Second person singular');
is( conjugate('bajar', $tense, 3, 1), 'bajaba', 'Third person singular');
is( conjugate('charlar', $tense, 1, 2), 'charlábamos', 'First person plural');
is( conjugate('dejar', $tense, 2, 2), 'dejabais', 'Second person plural');
is( conjugate('encantar', $tense, 3, 2), 'encantaban', 'Third person plural');


is( conjugate('faltar', 'imperfecto', 1, 1), 'faltaba', 'First person singular - spanish tense name');
