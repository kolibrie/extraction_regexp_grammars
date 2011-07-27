package Emit::XML;

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

1;
