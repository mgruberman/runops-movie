package TM;
use strict;
use warnings;
use parent 'Exporter';
our @EXPORT_OK = qw( size );

use constant { GIGABYTE => 1<<30, MEGABYTE => 1<<20, KILIBYTE => 1<<10 };
sub size {
    my ( $bytes ) = @_;

    if ( $bytes > GIGABYTE ) {
        sprintf '%0.2fGB', $bytes / GIGABYTE;
    }
    elsif ( $bytes > MEGABYTE ) {
        sprintf '%0.2fMB', $bytes / MEGABYTE;
    }
    elsif ( $bytes > KILIBYTE ) {
        sprintf '%0.2fKB', $bytes / KILIBYTE;
    }
    else {
        "$bytes bytes";
    }
}


1;
