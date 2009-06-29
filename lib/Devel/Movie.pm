package Devel::Movie;
package DB;
use strict;
use feature ':5.10';
use Internals::DumpArenas ();
sub tracer {
    state $Frame = 0;
    local $, = ' ';
    print STDERR 'Runops::Movie frame ', ++$Frame, @_
        or warn "Can't write to STDERR: $!";
    Internals::DumpArenas::DumpArenas();
}

sub DB {}
sub sub {
    no strict;
    tracer $sub;
    goto &$sub;
}

q(Go drinking with mst);
