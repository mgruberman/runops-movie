package Runops::Movie;
use Runops::Trace ();
use Internals::DumpArenas ();

our $Frame;
sub tracer {
    $Frame = 1 unless defined $Frame;

    print STDERR "Runops::Movie frame $Frame\n";
    ++ $Frame;
    Internals::DumpArenas::DumpArenas();
}

sub import {
    my ( $class, %options ) = @_;

    # mask_op
    if ( exists $options{mask_op} ) {
	if ( defined $options{mask_op} ) {
	    Runops::Trace::mask_op( @{ $options{mask_op} } );
	}
	else {
	    # User passed undef so do nothing.
	}
    }
    else {
	# Apply the default mask.
	Runops::Trace::mask_op( @{ $options{mask_op} } );	
    }
    
    # frame => #
    if ( exists $options{frame} ) {
	if ( defined $options{frame} ) {
	    $Frame = $options{frame};
	}
	else {
	    # User passed undef so do nothing.
	}
    }
    else {
	# Apply the default frame
	$Frame = 1;
    }

    # STDERR should be buffered if I'm going to use it as a target for a movie
    # script.
    if ( exists $options{unbuffer}
	 ? $options{unbuffer}
	 : 1 ) {
	my $old = select STDERR;
	$| = 0;
	select $old;
    }

    # Runops::Trace tracer
    if ( exists $options{tracer} ) {
	if ( defined $options{tracer} ) {
	    Runops::Trace::set_tracer( $options{tracer} );
	}
	else {
	    # Do nothing, I guess
	}
    }
    else {
	Runops::Trace::set_tracer( \ &Runops::Movie::tracer );
    }

    # Roll movie!
    if ( exists $options{run}
	 ? $options{run}
	 : 1 ) {
	Runops::Trace::enable_tracing();
    }
}

1;

__END__

=head1 NAME

Runops-Movie - blah blah

=head1 DESCRIPTION

The README is used to introduce the module and provide instructions on
how to install the module, any machine dependencies it may have (for
example C compilers and installed libraries) and any other information
that should be provided before the module is installed.

A README file is required for CPAN modules since CPAN extracts the
README file from a module distribution so that people browsing the
archive can use it get an idea of the modules uses. It is usually a
good idea to provide version information here so that people can
decide whether fixes for the module are worth downloading.

INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

DEPENDENCIES

This module requires these other modules and libraries:

  blah blah blah

COPYRIGHT AND LICENCE

Put the correct copyright and licence information here.

Copyright (C) 2009 by josh

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.
