package Lingua::ES::Conjugate;

use Carp;
use Storable qw(dclone);

require Exporter;
our @ISA = qw(Exporter);

use warnings;
use strict;

my @AR_present = qw( o as a amos áis an );
my @ER_present = qw( o es e emos éis en );
my @IR_present = qw( o es e imos ís en );

my @AR_preterit = qw( é aste ó amos asteis aron );
my @ER_preterit = qw( í iste ió imos isteis ieron );
my @IR_preterit = @ER_preterit;

my @AR_imperfect = qw( aba abas aba ábamos abais aban );
my @ER_imperfect = qw( ía ías ía íamos íais ían );
my @IR_imperfect = @ER_imperfect;

my @AR_subjunctive = qw( e es e emos éis en );
my @ER_subjunctive = qw( a as a amos áis an );
my @IR_subjunctive = @ER_subjunctive;

my @future = qw( é ás á emos éis án );
my @conditional = qw( ía ías ía íamos íais ían );

my $AR_pastparticiple = 'ado';
my $ER_pastparticiple = 'ido';
my $IR_pastparticiple = $ER_pastparticiple;

my $AR_gerund = 'ando';
my $ER_gerund = 'iendo';
my $IR_gerund = $ER_gerund;

my @AR_imperitive = qw( a ad ); # tu habla, vosostros hablad, need formal and negative
my @ER_imperitive = qw( e ed ); # tu habla, vosostros hablad, need formal and negative
my @IR_imperitive = qw( e id ); # tu habla, vosostros hablad, need formal and negative

my @AR_imperfect_subjunctive = qw( ara aras ara áramos arais aran );
my @ER_imperfect_subjunctive = qw( era eras era éramos erais eran );
my @IR_imperfect_subjunctive = @ER_imperfect_subjunctive;

my $endings = { present => { AR => \@AR_present,
                             ER => \@ER_present,
                             IR => \@IR_present },
                preterit    => { AR => \@AR_preterit,
                                 ER => \@ER_preterit,
                                 IR => \@IR_preterit },
                imperfect   => { AR => \@AR_imperfect,
                                 ER => \@ER_imperfect,
                                 IR => \@IR_imperfect },
                subjunctive => { AR => \@AR_subjunctive,
                                 ER => \@ER_subjunctive,
                                 IR => \@IR_subjunctive },
                imperfect_subjunctive   => { AR => \@AR_imperfect_subjunctive,
                                             ER => \@ER_imperfect_subjunctive,
                                             IR => \@IR_imperfect_subjunctive },
                future   => { AR => \@future,
                                             ER => \@future,
                                             IR => \@future },
                conditional   => { AR => \@conditional,
                                             ER => \@conditional,
                                             IR => \@conditional },

              };
# names of tenses in Spanish
$endings->{presente} = $endings->{present};
$endings->{preterito} = $endings->{preterit};
$endings->{'pretérito'} = $endings->{preterit}; # needs quotes around key with accent
$endings->{imperfecto} = $endings->{imperfect};
#$endings->{perfecto} = $endings->{perfect};
$endings->{futuro} = $endings->{future};
$endings->{condicional} = $endings->{conditional};
$endings->{subjunctivo} = $endings->{subjunctive};

my %irregular_verb = map { $_ => 1 } qw( ser estar ir traer decir bendecir caber caer conducir 
                                        tener venir dar 
    );

# stem changing verbs cannot be predicted
# the stem change is stored in the anonymous array ref
my %stemchanging_verb = ( jugar   => [qw(u ue)],
            # O -> UE verbs
            map { $_ => [qw(o ue)] } qw( volver acordarse acostarse aprobar colgar comprobar
                                        conmover contar demostrar devolver
                                       ),
            # E -> IE verbs
            map { $_ => [qw(e ie)] } qw( acertar atender atravesar calentar cerrar confesar
                                        defender despertarse encender encerrar
                                       ),
            # E -> I verbs
            map { $_ => [qw(e ie)] } qw( competir concebir despedir
                                        pedir
                                       ),
    );

my @reflexive_pronouns = qw( me te se nos os se );

=head1 NAME

Lingua::ES::Conjugate - The great new Lingua::ES::Conjugate!

=head1 VERSION

Version 0.01

=head1 PLAN

should be able to call with a quick set of arguments that in turn calls the
real function with a proper hash ref of arguments like
    { person => [123],
        number => [12],
        tense  => [ present presente
                    preterit preterito
                    imperfect ....
                  ]
        (type => [ regular | stem-changing => [ 'o', 'ue' ] | irregular ]
     }

use Lingua::Stem::Es to make the stem and apply changes to the stem and add the endings 

detect reflexive verbs and add the pronoun

use a lookup table for irregular verbs

It's starting to get to the point where I'm thinking of going Object Oriented

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This module conjugates the infinitive form of Spanish verbs.  If I get fancy,
I might start using Lingua::Stem::Es

Perhaps a little code snippet.

    use Lingua::ES::Conjugate;

    print conjugate('hablar', 'present', 3, 2); # prints "hablan"
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

conjugate is_tense_available tenses_available

=cut

our @EXPORT = qw( conjugate is_tense_available tenses_available);

=head1 FUNCTIONS

=head2 conjugate

You can either call conjugate( \%verb_description ) or 
conjugate( $verb, $tense, $person, $number ) or
conjugate( $verb, \%tense )

=cut

sub conjugate {

    my ($verb, $conj, $tense, $person, $number, );
    if ( @_ == 1 && ref $_[0] eq 'HASH' ) {
        $conj = shift;
    }
    elsif ( ref $_[1] eq 'HASH' ) {
        ($verb, $conj) = @_;
        $conj->{'verb'} = lc $verb;
    }
    elsif ( ref $_[0] ne 'HASH' && ref $_[1] ne 'HASH' ) {
        ($verb, $tense, $person, $number) = @_;
        carp "Undefined verb in function conjugate\n" unless defined $verb;
        carp "Undefined tense in function conjugate\n" unless defined $tense;
        carp "Undefined person in function conjugate\n" unless defined $person;
        carp "Undefined number in function conjugate\n" unless defined $number;
        $conj = { verb => lc $verb, tense => $tense, person => $person, number => $number };
    }
    else {
        croak "conjugate called with ", scalar @_, " arguments.  It wants either 4 arguments or a hashref.\n";
    }

    catch_reflexive_ending($conj);
    if ( is_irregular($conj) ) {
        return $conj->{irregular_form};
    }
    my $verb_class = get_class($conj);
    my $stem = get_stem($conj);
    my $ending = $endings->{$conj->{tense}}->{$verb_class}->[ _get_ending_index($conj) ]
                    or carp "No ending found for $conj->{tense} tense of $conj->{verb} in conjugate( @_ )\n";

    if ( my $pronoun = is_reflexive($conj) ) {
        # commands and infinitives can have the pronoun afterwards, which changes the accenting
        return "$pronoun $stem$ending";
    }
    return $stem . $ending;
}

=head2 catch_reflexive_ending

Strips off the trailing -se from any reflexive verb and sets a flag, reflexive,
to be the appropriate reflexive pronoun.  Also strips off any trailing spaces.
Does nothing to non-reflexive verbs.

TODO: 
Should also lower case the verb, but be wary of accented characters and unicode.

=cut

sub catch_reflexive_ending {
    my ($conj) = shift;
    $conj->{verb} =~ s/\s*$//;

    if ( $conj->{verb} =~ s/se$//i ) {
        $conj->{reflexive} = $reflexive_pronouns[ _get_ending_index($conj) ];
    }
}

=head2 get_stem

Gets the stem of the verb, and applies the appropriate spelling changes

The method for the imperfect subjunctive is not entirely correct.  We should just drop
the -ron from the ellos form of the preterit, but to catch the accent in the nosotros
we need the preceeding vowel, which is hopefully just a or e.

=cut

my $consonant = qr/[b-df-hj-np-tv-z]/;
my $ending = qr/[aei]r$/;
sub get_stem {
    my $conj = shift;
    my ($stem, $stemchange, );
    if ( $conj->{tense} eq 'imperfect' ) {
        $stem = get_imperfect_stem($conj);
    }
    elsif ( $conj->{tense} eq 'future' || $conj->{tense} eq 'futuro' 
         || $conj->{tense} eq 'conditional' || $conj->{tense} eq 'condicional' ) { # conditional has same stem as future
        $stem = get_stem_future( $conj->{verb} );
    }
    elsif ( $stemchange = is_stemchanging($conj->{verb}) ) {
        ($stem) = $conj->{'verb'} =~ /(.+)${ending}/i;
        if ( ($conj->{tense} eq 'present' || $conj->{tense} eq 'subjunctive' || $conj->{tense} eq 'imperative')
                && ($conj->{number} == 1 || $conj->{person} == 3) ) {
            change_stem($stem, $stemchange);
        }
    }
    elsif ( $conj->{tense} eq 'subjunctive' ) {
        $stem = conjugate(copy_verb($conj, {person => 1, number => 1, tense => 'present'}) );
        $stem =~ s/o$//o;
    }
    elsif ( $conj->{tense} eq 'imperfect_subjunctive' ) {
        $stem = conjugate(copy_verb($conj, {person => 3, number => 2, tense => 'preterit'}) );
        $stem =~ s/[ae]ron$//o;
    }
    elsif ( $conj->{tense} eq 'perfect' ) {
        my $first_part = conjugate(copy_verb($conj, {verb => 'haber', tense => 'present'}) );
        my $second_part = get_past_participle($conj);
        return join ' ', $first_part, $second_part;
    }
    else {
        $stem = _strip_ending($conj);
    }

    return $stem;
}

=head2 change_stem

This sub hides away the ugly guts of the regex that changes the stem, digging into
the %stemchanging_verbs hash.  The first argument is the stem and the second argument
is a reference to the change.  The sub assumes that the change is in the last vowel
of the stem.  Because we've listed almost all (well, one at least) the stem changing
verbs in the hash along with the change, we don't have to guess.

=cut

sub change_stem {
        # O -> UE stem changing (could use the is_stemchanging sub)
                # volver => [qw(o ue)],
    my $c = $_[1];
    $_[0] =~ s/ $c->[0]         # the last instance of the changing letter
                ([^$c->[0]]+)$  # grab everything after
              /$c->[1]$1/x;     # substitute the change followed by the remainder
}

=head2 get_stem_future

handles the cases when the verb is irregular in the future tense
Put all new cases of irregulars in the hash in the function here.
All regular verbs use the infinitive for the stem of the future tense.

=cut

sub get_stem_future {
    my $verb = shift;

    my %irregular_future_stem = ( salir => 'saldr', decir   => 'dir',   haber   => 'habr',  hacer   => 'har',
                                poder   => 'podr',  poner   => 'pondr', querer  => 'querr', saber   => 'sabr',
                                caber   => 'cabr',  tener   => 'tendr', valer   => 'valdr', venir   => 'vendr',
                                );
    if ( exists $irregular_future_stem{$verb} ) {
        return $irregular_future_stem{$verb};
    }
    else {
        return $verb;
    }
}

=head2 get_class

Gets the class of the verb, AR, ER or IR

=cut

sub get_class {
    my $word = shift;
    my ($class) = $word->{'verb'} =~ /([aeií]r)$/i;
    carp "Couldn't find a verb class for $word\n" unless defined $class;
    $class =~ tr/í/i/;  # catches the case for oír
    $word->{'class'} = $class;
    return uc $class;
}

=head2 is_reflexive

Checks to see if the verb ends in se, returns true if it does

=cut

sub is_reflexive {
    my $word = shift;
    if ( exists $word->{reflexive} ) {
        return $word->{reflexive};
    }
    elsif ( $word->{verb} =~ /se\s*$/ ) {
        $word->{reflexive} = $reflexive_pronouns[ _get_ending_index($word) ];
        return $word->{reflexive};
    }
    return undef;
}

=head2 is_irregular

True if the verb exists in the list of irregular verbs, otherwise false.

use %irregular_verb to hold the verbs based on other verbs

=cut

my $irregular_form = { present  => { 
                                    ser     => [ qw(soy eres es somos soís son) ],
                                    estar   => [ qw(estoy estás está estamos estáis están) ],
                                    ir      => [ qw(voy vas va vamos váis van) ],
                                    tener   => [ qw(tengo tienes tiene tenemos tenéis tienen) ],
                                    caber   => [ qw(quepo cabes cabe cabemos cabéis caben) ],
                                    caer    => [ qw(caigo caes cae caemos caéis caen) ],
                                    conducir    => [ qw(conduzco conduces conduce conducimos conducís conducen) ],
                                    dar     => [ qw(doy das da damos dais dan) ],
                                    decir   => [ qw(digo dices dice decimos decís dicen) ],
                                    haber   => [ qw(he has ha hemos habéis han) ],
                                    hacer   => [ qw(hago haces hace hacemos hacéis hacen) ],
                                    'oír'   => [ qw(oigo oyes oye oímos oís oyen) ],
                                    oler    => [ qw(huelo hueles huele olimos oléis huelen) ],
                                    poder   => [ qw(puedo puedes puede podemos podéis pueden) ],
                                    poner   => [ qw(pongo pones pone ponemos ponéis ponen) ],
                                    querer  => [ qw(quiero quieres quiere queremos queréis quieren) ],
                                    saber   => [ qw(sé sabes sabe sabemos sabéis saben) ],
                                    salir   => [ qw(salgo sales sale salimos salís salen) ],
                                    satisfacer  => [ qw(satisfago satisfaces satisface satisfacemos satisfacéis satisfacen) ],  # like hacer
                                    traducir    => [ qw(traduzco traduces traduce traducimos traducís traducen) ],
                                    traer   => [ qw(traigo traes trae traemos traéis traen) ],
                                    valer   => [ qw(valgo vales vale valemos valéis valen) ],
                                    venir   => [ qw(vengo vienes viene venimos venís vienen) ],
                                    ver     => [ qw(veo ves ve vemos veis ven) ],
                                    yacer   => [ qw(yazco yaces yace yacemos yacéis yacen) ],
                                   },
                       preterit => {
                                    ser     => [ qw(fui fuiste fue fuimos fuisteis fueron) ],
                                    estar   => [ qw(estuve estuviste estuvo estuvimos estuvisteis estuvieron) ],
                                    ir      => [ qw(fui fuiste fue fuimos fuisteis fueron) ],
                                    tener   => [ qw(tuve tuviste tuvo tuvimos tuvistes tuvieron) ],
                                    caber   => [ qw(cupe cupiste cupo cupimos cupisteis cupieron) ],
                                    caer    => [ qw(caí caiste cayó caímos caísteis cayeron) ],
                                    conducir    => [ qw(conduje condujiste condujo condujimos condujisteis condujeron) ],
                                    dar     => [ qw(di diste dio dimos disteis dieron) ],
                                    decir   => [ qw(dije dijiste dijo dijimos dijisteis dijeron) ],
                                    haber   => [ qw(hube hubiste hubo hubimos hubisteis hubieron) ],
                                    hacer   => [ qw(hice hiciste hizo hicimos hicisteis hicieron) ],
                                    'oír'   => [ qw(oí oíste oyó oímos oísteis oyeron) ],
                                    oler    => [ qw(olí oliste olió olimos olisteis olieron) ],
                                    poder   => [ qw(pude pudiste pudo pudimos pudisteis pudieron) ],
                                    poner   => [ qw(puse pusiste puso pusimos pusisteis pusieron) ],
                                    producir    => [ qw(produje produjiste produjo produjimos produjisteis produjeron) ],
                                    querer  => [ qw(quise quisiste quiso quisimos quisisteis quisieron) ],
                                    saber   => [ qw(supe supiste supo supimos supisteis supieron) ],
                                    salir   => [ qw(salí saliste salió salimos salisteis salieron) ],
                                    satisfacer  => [ qw(satisfice satisficiste satisfizo satisficimos satisficimos satisficisteis satisficieron) ],
                                    traducir    => [ qw(traduje tradujiste tradujo tradujimos tradujisteis tradujeron) ],
                                    traer   => [ qw(traje trajiste trajo trajimos trajisteis trajeron) ],
                                    valer   => [ qw(valí valiste valió valimos valisteis valieron) ],
                                    venir   => [ qw(vine viniste vino vinimos vinisteis vinieron) ],
                                    ver     => [ qw(vi viste vio vimos visteis vieron) ],
                                    yacer   => [ qw(yací yaciste yació yacimos yacisteis yacieron) ],
                                   },
                       imperfect => {
                                    ser     => [ qw(era eras era éramos erais eran) ],
                                    ir      => [ qw(iba ibas iba íbamos ibais iban) ],
                                   },
                     };

sub is_irregular {
    my $conj = shift;
    if ( $conj->{tense} eq 'future' 
        || $conj->{tense} eq 'conditional' ) {
                # there are only 12 exceptions in the future and conditional tense
                # which are taken care of in that subroutine
                return undef;
    }
    return $conj->{irregular_form} = $irregular_form->{$conj->{tense}}->{$conj->{verb}}->[ _get_ending_index($conj) ];
}

=head2 is_stemchanging

If the verb is a stemchanging verb it returns a hash ref with the change,
such as { o => 'ue' }.  Otherwise it returns undef.

=cut

sub is_stemchanging {
    my $verb = shift;
    if ( exists $stemchanging_verb{$verb} ) {
        return $stemchanging_verb{$verb};
    }
    else {
        return undef;
    }
}

=head2 get_past_participle

returns the past participle of a verb

=cut

sub get_past_participle {
    my $verb = shift;

    my %irregular_past_participle = ( abrir => 'abierto',   cubrir  => 'cubierto',
                decir   => 'dicho', escribir    => 'escrito',   'freír'   => 'frito',
                hacer   => 'hecho', morir       => 'muerto',    poner   => 'puesto',
                resolver    => 'resuelto',  romper  => 'roto',  ver     => 'visto',
                volver  => 'vuelto',
        );

    if ( exists $irregular_past_participle{$verb} ) {
        return $irregular_past_participle{$verb};
    }
    else {
        return $verb;
    }
}

=head2 _get_ending_index

Endings are stored in lists in standard order.  Giving the conj reference, 
it will work out what index to use.

=cut

sub _get_ending_index {
    my $conj = shift;
    return ($conj->{'person'} -1) + 3 * ($conj->{'number'} - 1);
}

=head2 _strip_ending

Utility function that takes the ending off the verb

=cut

sub _strip_ending {
    my ($conj) = shift;
    my ($stem) = $conj->{'verb'} =~ /(.+)${ending}/i;
    return $stem;
}

=head2 get_imperfect_stem

Gets the stem of the imperfect form of the verb, which luckily only has 3
irregular forms, ser, ir and ver.

ser and ir are handled in is_irregular(), the stem of ver is just 've'

=cut

sub get_imperfect_stem {
    my ($conj) = shift;
    if ( $conj->{verb} eq 'ver' ) {
        return 've';
    }
    return _strip_ending($conj);
}

=head2 copy_verb

returns a copy of the verb for you to play with.  If supplied with a hash ref,
it will modify/update the verb with the elements of the hash.

=cut

sub copy_verb {
    my ($conj, $options) = @_;
    my $new_verb = dclone($conj);
    if (defined $options) {
        foreach my $key (keys %{$options}) {
            $new_verb->{$key} = $options->{$key};
        }
    }
    return $new_verb;
}

=head2 is_tense_available

Do we have this tense in our module?  Returns undef if not found.
    if ( is_tense_available('pluperfect') ) { 
        ...
    }
Not finished yet.  Only pulls out the obvious ones.

=cut

sub is_tense_available {
    my $tense = shift;

    return exists $endings->{$tense};
}

=head2 tenses_available

Lists out all the tenses that this module can handle with their English names.  
If given an argument it will list out the Spanish tense names.

    print join ", ", tenses_available('spanish');
    print join ", ", tenses_available('other');     # tense names missing accents

=cut

my @tenses_english = qw(present preterit imperfect perfect future conditional pluperfect 
                    past_perfect future_perfect conditional_perfect subjunctive
                    perfect_subjunctive imperfect_subjunctive past_perfect_subjunctive
                    progressive past_progressive imperfect_progressive future_progressive
                    conditional_progressive subjunctive_progressive imperitive
                    );
my @tenses_spanish = qw(presente pretérito imperfecto perfecto futuro condicional subjunctivo);

sub tenses_available {
    my $list = shift;

    if ( ! defined $list ) { # skip if block 
    }
    elsif ($list eq 'spanish') {
        return grep is_tense_available($_), @tenses_spanish;
    }
    elsif ($list eq 'other') {
        my %proper_spellings = map { $_ => 1 } tenses_available(), tenses_available('spanish');
        return grep { ! exists $proper_spellings{$_} } keys %{$endings};
    }
    return grep is_tense_available($_), @tenses_english;
}

=head2 function1

=cut

sub function1 {
}

=head1 AUTHOR

Boyd Duffee, Keele University, C<< <b.duffee at isc.keele.ac.uk> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-lingua-es-conjugate at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Lingua-ES-Conjugate>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Lingua::ES::Conjugate


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Lingua-ES-Conjugate>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Lingua-ES-Conjugate>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Lingua-ES-Conjugate>

=item * Search CPAN

L<http://search.cpan.org/dist/Lingua-ES-Conjugate/>

=back

=head1 TODO

I'm not entirely happy with the stem changing method.  It relies on a list of all
verbs and there are some with prefixes, like cerrar and encerrar, that fall into 
the same category.  How do I detect all of these?  Hmmm.

=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2011 Boyd Duffee, Keele University.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Lingua::ES::Conjugate
