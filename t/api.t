use Test::More;
#use Test::More tests => 36;
use Lingua::ES::Conjugate;

ok(is_tense_available('present'), 'is tense available');
ok(! is_tense_available('hypothetical'), 'bogus tense');


ok( @t = tenses_available(), 'tenses_available()');
%tenses = map { $_ => 1 } @t;
ok( exists $tenses{present}, 'present tense');
ok( exists $tenses{preterit}, 'preterit tense');
ok( exists $tenses{future}, 'future tense');
ok( exists $tenses{conditional}, 'conditional tense');
ok( exists $tenses{imperfect}, 'imperfect tense');

TODO: {
    local $TODO = "haven't added perfect tenses yet";

    ok( exists $tenses{perfect}, 'perfect tense');
    ok( exists $tenses{pluperfect}, 'pluperfect tense');
}

done_testing();
