#use Test::More;
use Test::More qw( no_plan );
#use Test::More tests => 1;
use Lingua::ES::Conjugate;

#plan skip_all => "Irregular verbs haven't been implented yet";

$tense = 'present';

is( conjugate('ser', $tense, 1, 1), 'soy', 'First person singular');
is( conjugate('ser', $tense, 2, 1), 'eres', 'Second person singular');
is( conjugate('ser', $tense, 3, 1), 'es', 'Third person singular');
is( conjugate('ser', $tense, 1, 2), 'somos', 'First person plural');
is( conjugate('ser', $tense, 2, 2), 'soís', 'Second person plural');
is( conjugate('ser', $tense, 3, 2), 'son', 'Third person plural');

is( conjugate('estar', $tense, 1, 1), 'estoy', 'First person singular');
is( conjugate('estar', $tense, 2, 1), 'estás', 'Second person singular');
is( conjugate('estar', $tense, 3, 1), 'está', 'Third person singular');
is( conjugate('estar', $tense, 1, 2), 'estamos', 'First person plural');
is( conjugate('estar', $tense, 2, 2), 'estáis', 'Second person plural');
is( conjugate('estar', $tense, 3, 2), 'están', 'Third person plural');

is( conjugate('ir', $tense, 1, 1), 'voy', 'First person singular');
is( conjugate('ir', $tense, 2, 1), 'vas', 'Second person singular');
is( conjugate('ir', $tense, 3, 1), 'va', 'Third person singular');
is( conjugate('ir', $tense, 1, 2), 'vamos', 'First person plural');
is( conjugate('ir', $tense, 2, 2), 'váis', 'Second person plural');
is( conjugate('ir', $tense, 3, 2), 'van', 'Third person plural');

is( conjugate('tener', $tense, 1, 1), 'tengo', 'First person singular');
is( conjugate('tener', $tense, 2, 1), 'tienes', 'Second person singular');
is( conjugate('tener', $tense, 3, 1), 'tiene', 'Third person singular');
is( conjugate('tener', $tense, 1, 2), 'tenemos', 'First person plural');
is( conjugate('tener', $tense, 2, 2), 'tenéis', 'Second person plural');
is( conjugate('tener', $tense, 3, 2), 'tienen', 'Third person plural');

