#!perl
use strict;
use warnings;
use Test::More tests => 4;
use IPC::Run qw( run );
use File::Temp qw( tempdir tempfile );

my $moviedir = tempdir( CLEANUP => 1 );
my $log_nm = "$moviedir/movie.log";
diag( "movie.log = $log_nm" );

$ENV{PATH} = "blib/script:$ENV{PATH}";

# Capture a movie log
ok(
    run(
        [ $^X, '-Mblib', '-MRunops::Movie', '-e', 'print "Hiii!!!\n"' ],
        '1>', $log_nm,
        '2>&1',
    ),
    'Created a movie log'
);


# Is it a reasonable sized log?
open my $log_fh, '<', $log_nm
  or die "Can't open $log_nm for reading: $!";
my $frames = 0;
while ( my $line = <$log_fh> ) {
    ++$frames if $line =~ /^Runops::Movie frame (\d+)/;
}
cmp_ok( $frames, '>', 4, 'Caught a reasonable number of frames' );
diag( "frames = $frames" );

# Make a movie
seek $log_fh, 0, 0;
ok(
    run(
        [ 'pm-frame-runner', '--dir', $moviedir, '--movie', "$moviedir/movie.mp4" ],
        '<', $log_fh
    ),
    'Rendered the movie log to a set of pngs'
);

# Movie is ok?
ok( -e "$moviedir/movie.mp4", "Movie $moviedir/movie.mp4 exists" );
