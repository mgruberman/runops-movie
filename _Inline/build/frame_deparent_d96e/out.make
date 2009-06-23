/opt/perl-5.10.0/bin/perl /opt/perl-5.10.0/lib/5.10.0/ExtUtils/xsubpp  -typemap /opt/perl-5.10.0/lib/5.10.0/ExtUtils/typemap   frame_deparent_d96e.xs > frame_deparent_d96e.xsc && mv frame_deparent_d96e.xsc frame_deparent_d96e.c
cc -c  -I/Users/jbenjore/src/runops-movie/bin -fno-common -DPERL_DARWIN -no-cpp-precomp -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -I/opt/local/include -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\"  "-I/opt/perl-5.10.0/lib/5.10.0/darwin-2level/CORE"   frame_deparent_d96e.c
Running Mkbootstrap for frame_deparent_d96e ()
chmod 644 frame_deparent_d96e.bs
rm -f blib/arch/auto/frame_deparent_d96e/frame_deparent_d96e.bundle
env MACOSX_DEPLOYMENT_TARGET=10.3 cc  -bundle -undefined dynamic_lookup -L/usr/local/lib -L/opt/local/lib -fstack-protector frame_deparent_d96e.o  -o blib/arch/auto/frame_deparent_d96e/frame_deparent_d96e.bundle 	\
	     	\
	  
chmod 755 blib/arch/auto/frame_deparent_d96e/frame_deparent_d96e.bundle
cp frame_deparent_d96e.bs blib/arch/auto/frame_deparent_d96e/frame_deparent_d96e.bs
chmod 644 blib/arch/auto/frame_deparent_d96e/frame_deparent_d96e.bs
