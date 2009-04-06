use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'Runops::Movie',
    VERSION           => '0.01',
    PREREQ_PM         => { 'Runops::Trace' => 0, 'Internals::DumpArenas' => 0 },
    ABSTRACT          => '',
    AUTHOR            => 'josh <josh@hsd1.wa.comcast.net>',
);
