#!perl
use strict;
use warnings;
use Test::More tests => 1;
use IPC::Run qw( run );
use File::Temp qw( tempfile );

# Get a temp file to store the movie in
my ( $tmp_fh, $tmp_nm ) = tempfile( UNLINK => 1 );

run(
  [ $^X, '-MRunops::Movie', '-e', 'print "Hiii!!!\n"' ],
  '1>', $tmp_nm,
  '2>&1',
);

my $frames = 0;
while ( my $line = <$tmp_fh> ) {
    ++$frames if $line =~ /^Runops::Movie frame (\d+)/;
}

cmp_ok( $frames, '>', 4, 'Caught a reasonable number of frames' );
