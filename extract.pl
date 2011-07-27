#!/usr/bin/perl

use strict;
use warnings;
use local::lib 'extlib';
use Getopt::Long;
use File::Slurp qw(slurp);
use Regexp::Grammars;
use Moose::Util qw(apply_all_roles);

my %param = ();
my $grammar;
my $emitter;
BEGIN {
GetOptions(\%param, 'help|h!', 'grammar=s', 'emitter=s');

$grammar = $param{grammar} || 'Grammar::Schedule::YAPC::NA2011';
eval "require $grammar";
$emitter = $param{emitter};
}

if ($emitter) {
    eval "require $emitter";
}

my $source_file = shift(@ARGV);
my $source = slurp($source_file);
print "$source_file is " . length($source) . " characters long\n";

# TODO find out why we cannot '<extends: $grammar>' (gives a runtime error)
my $parser = qr{
    <logfile: extract.log>
    <extends: Grammar::Schedule::YAPC::NA2011>

    <talk>

}xms;

# <a href="/yn2011/user/1613">Nathan Gray (&lrm;kolibrie&lrm;)</a>
#  - <a href="/yn2011/talk/3356"><b>&lrm;Practical Extraction with Regexp::Grammars&lrm;</b></a>
# (50&nbsp;min)
# <span id="starcount-3356" style="white-space:nowrap"><span class="starcount">9</span>

my $count = 0;
while ($source =~ /$parser/g) {
    $count++;
    if ($emitter) {
        # TODO figure out how to make this generic (not 'talk')
        my $talk = $/{talk};
        apply_all_roles($talk, $emitter);
        apply_all_roles($talk->presenter, $emitter);
        print $talk->emit . "\n";
        next;
    }
    print "success\n";
    use Data::Dumper;
    print Dumper(\%/) . "\n";
}
if ($count) {
    print "found $count matches\n";
} else {
    print "failure\n";
}


__END__
if ($source =~ $parser) {
    print "success\n";
    use Data::Dumper;
    print Dumper(\%/) . "\n";
} else {
    print "failure\n";
}

