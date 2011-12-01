use Test::More qw( no_plan );
#use Test::More tests => 1;
use Lingua::ES::Conjugate;

TODO: {
    local $TODO = 'spelling changes not implemented yet';

is( conjugate('brincar', 'present', 1, 1), 'brinco', 'c > qu/e');
is( conjugate('brincar', 'preterit', 1, 1), 'brinqué', 'c > qu/e');
is( conjugate('dedicar', 'present', 1, 1), 'dedico', 'c > qu/e');
is( conjugate('dedicar', 'preterit', 1, 1), 'dediqué', 'c > qu/e');


is( conjugate('brincar', 'presente', 1, 1), 'brinco', 'First person singular - spanish tense name');
is( conjugate('brincar', 'preterito', 1, 1), 'brinqué', 'c > qu/e');
is( conjugate('brincar', 'pretérito', 1, 1), 'brinqué', 'c > qu/e');

is( conjugate('conocer', 'subjunctive', 1, 1), 'conozca', 'First person singular');
is( conjugate('conocer', 'subjunctive', 2, 1), 'conozcas', 'Second person singular');
is( conjugate('conocer', 'subjunctive', 3, 1), 'conozca', 'Third person singular');
is( conjugate('conocer', 'subjunctive', 1, 2), 'conozcamos', 'First person plural');
is( conjugate('conocer', 'subjunctive', 2, 2), 'conozcáis', 'Second person plural');
is( conjugate('conocer', 'subjunctive', 3, 2), 'conozcan', 'Third person plural');

}
