use Test::More qw( no_plan );
#use Test::More tests => 18;
use Lingua::ES::Conjugate;

$tense = 'imperfect_subjunctive';

is( conjugate('ser', $tense, 1, 1), 'fuera', 'First person singular');
TODO: { 
    local $TODO = 'fix this later';
    is( conjugate('estar', $tense, 2, 1), 'estuvieras', 'Second person singular'); 
}
is( conjugate('ir', $tense, 3, 1), 'fuera', 'Third person singular');
is( conjugate('tener', $tense, 1, 2), 'tuviéramos', 'First person plural');
is( conjugate('caber', $tense, 2, 2), 'cupierais', 'Second person plural');
is( conjugate('caer', $tense, 3, 2), 'cayeran', 'Third person plural');

is( conjugate('conducir', $tense, 1, 1), 'condujera', 'First person singular');
TODO: { 
    local $TODO = 'fix this later';
    is( conjugate('dar', $tense, 2, 1), 'dieras', 'Second person singular');
}
is( conjugate('decir', $tense, 3, 1), 'dijera', 'Third person singular');
is( conjugate('haber', $tense, 1, 2), 'hubiéramos', 'First person plural');
is( conjugate('hacer', $tense, 2, 2), 'hicierais', 'Second person plural');
is( conjugate('oír', $tense, 3, 2), 'oyeran', 'Third person plural');

is( conjugate('oler', $tense, 1, 1), 'oliera', 'First person singular');
is( conjugate('poder', $tense, 2, 1), 'pudieras', 'Second person singular');
is( conjugate('poner', $tense, 3, 1), 'pusiera', 'Third person singular');
is( conjugate('querer', $tense, 1, 2), 'quisiéramos', 'First person plural');
is( conjugate('saber', $tense, 2, 2), 'supierais', 'Second person plural');
is( conjugate('salir', $tense, 3, 2), 'salieran', 'Third person plural');

TODO: { 
    local $TODO = 'fix this later';
    is( conjugate('satisfacer', $tense, 1, 1), 'satisficiera', 'First person singular');
}
is( conjugate('traducir', $tense, 2, 1), 'tradujeras', 'Second person singular');
is( conjugate('valer', $tense, 3, 1), 'valiera', 'Third person singular');
is( conjugate('venir', $tense, 1, 2), 'viniéramos', 'First person plural');
is( conjugate('ver', $tense, 2, 2), 'vierais', 'Second person plural');
is( conjugate('yacer', $tense, 3, 2), 'yacieran', 'Third person plural');

done_testing();

#is( conjugate('atraer', $tense, 1, 1), 'atrajera', 'First person singular');
#is( conjugate('convenir', $tense, 2, 1), 'convinieras', 'Second person singular');
#is( conjugate('contener', $tense, 3, 1), 'contuviera', 'Third person singular');
#is( conjugate('detener', $tense, 1, 2), 'detuviéramos', 'First person plural');
#is( conjugate('XXXX', $tense, 2, 2), 'decidierais', 'Second person plural');
#is( conjugate('XXXX', $tense, 3, 2), 'sufrieran', 'Third person plural');


#is( conjugate('mantener', 'subjunctivo', 1, 1), 'falte', 'First person singular - tense name in Spanish');
#is( conjugate('obtener', 'subjunctivo', 2, 1), 'faltes', 'Second person singular - tense name in Spanish');
#is( conjugate('prevenir', 'subjunctivo', 3, 1), 'falte', 'Third person singular - tense name in Spanish');
#is( conjugate('oponerse', 'subjunctivo', 1, 2), 'faltemos', 'First person plural - tense name in Spanish');
#is( conjugate('sostener', 'subjunctivo', 2, 2), 'faltéis', 'Second person plural - tense name in Spanish');
#is( conjugate('suponer', 'subjunctivo', 3, 2), 'falten', 'Third person plural - tense name in Spanish');
