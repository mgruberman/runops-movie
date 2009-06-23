#!perl
use strict;
use warnings;
use Test::More tests => 1;
use IPC::Run qw( run );
use File::Temp qw( tempdir tempfile );

my $moviedir = tempdir( CLEANUP => 0 );
my $log_nm = "$moviedir/movie.log";
diag( "movie.log = $log_nm" );

run(
  [ $^X, '-MRunops::Movie', '-e', 'print "Hiii!!!\n"' ],
  '1>', $log_nm,
  '2>&1',
);

open my $log_fh, '<', $log_nm
  or die "Can't open $log_nm for reading: $!";
my $frames = 0;
while ( my $line = <$log_fh> ) {
    ++$frames if $line =~ /^Runops::Movie frame (\d+)/;
}

cmp_ok( $frames, '>', 4, 'Caught a reasonable number of frames' );
diag( "frames = $frames" );



