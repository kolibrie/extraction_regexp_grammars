use 5.010;
use warnings;
use Test::More;
use Test::Deep;

{ package Talk;

    use Moose;

    has 'id'         => (is => 'rw', isa => 'Num');
    has 'title'      => (is => 'rw', isa => 'Str');
    has 'presenter'  => (is => 'rw', isa => 'Presenter');
    has 'duration'   => (is => 'rw', isa => 'Num');
    has 'attendance' => (is => 'rw', isa => 'Num');

    sub emit_order {
        qw(id title presenter duration attendance);
    }
}

{ package Presenter;

    use Moose;

    has 'name'  => (is => 'rw', isa => 'Str');
    has 'alias' => (is => 'rw', isa => 'Str');
    has 'id'    => (is => 'rw', isa => 'Num');

    sub emit_order {
        qw(id name alias);
    }
}

{ package Emit::XML;

    use Moose::Role;

    requires 'emit_order';

    sub emit {
        my $self = shift;
        my $xml = '';
        foreach my $key ($self->emit_order) {
            $xml .= "<$key>";
            my $value = $self->$key();
            if (ref($value)) {
                $xml .= $value->emit;
            } else {
                $xml .= defined($value) ? $value : '';
            }
            $xml .= "</$key>";
        }
        return $xml;
    }
}

my @data = (
    {
        id => 3356,
        title => 'Practical Extraction with Regexp::Grammars',
        duration => 50,
        presenter => {
            id => 1613,
            name => 'Nathan Gray',
            alias => 'kolibrie',
        },
    },
);
my %expected = (
    'Emit::XML' => {
        3356 => q{<id>3356</id><title>Practical Extraction with Regexp::Grammars</title><presenter><id>1613</id><name>Nathan Gray</name><alias>kolibrie</alias></presenter><duration>50</duration><attendance></attendance>},
    },
);
plan tests => scalar(keys %expected) * scalar(@data) * 2;

foreach my $entry (@data) {
    my %compare = (%$entry, presenter => methods(%{$entry->{presenter}}));
    foreach my $emitter ('Emit::XML') {
        my $talk = Talk->new(%$entry, presenter => Presenter->new($entry->{presenter}));
        cmp_deeply(
            $talk,
            methods(%compare),
            "object created successfully: " . $talk->id,
        );
        use Moose::Util qw(apply_all_roles);
        apply_all_roles($talk, $emitter);
        apply_all_roles($talk->presenter, $emitter);
        my $expected = $expected{$emitter}{$talk->id};
        is($talk->emit, $expected, "emit " . $talk->id);
    }
}

