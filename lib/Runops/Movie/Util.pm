package Runops::Movie::Util;
use strict;
use warnings;
use Exporter qw( import );
our @EXPORT_OK = qw( pretty_size );

use constant { GIGABYTE => 1<<30, MEGABYTE => 1<<20, KILIBYTE => 1<<10 };
sub pretty_size {
    my ( $bytes ) = @_;

    if ( $bytes > GIGABYTE ) {
        return sprintf '%0.2fGB', $bytes / GIGABYTE;
    }
    elsif ( $bytes > MEGABYTE ) {
        return sprintf '%0.2fMB', $bytes / MEGABYTE;
    }
    elsif ( $bytes > KILIBYTE ) {
        return sprintf '%0.2fKB', $bytes / KILIBYTE;
    }
    else {
        return "$bytes bytes";
    }
}


1;
