use Test::More;
#use Test::More tests => 1;
use Lingua::ES::Conjugate;

#plan skip_all => "Reflexive verbs haven't been implented yet";

is( conjugate('lavarse', 'present', 1, 1), 'me lavo', 'First person singular reflexive');
#is( conjugate('avergonzarse', 'present', 2, 1), 'te avergüenzas', 'Second person singular reflexive');     # fix this one
is( conjugate('avergonzarse', 'present', 2, 2), 'os avergonzáis', 'Second person plural reflexive');

done_testing();
