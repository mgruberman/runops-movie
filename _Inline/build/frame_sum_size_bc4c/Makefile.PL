use ExtUtils::MakeMaker;
my %options = %{       
{
  'TYPEMAPS' => [
    '/opt/perl-5.10.0/lib/5.10.0/ExtUtils/typemap'
  ],
  'NAME' => 'frame_sum_size_bc4c',
  'INC' => '-I/Users/jbenjore/src/runops-movie/bin',
  'VERSION' => '0.00',
  'OPTIMIZE' => ' -g'
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
