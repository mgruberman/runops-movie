/opt/perl-5.10.0/bin/perl /opt/perl-5.10.0/lib/5.10.0/ExtUtils/xsubpp  -typemap /opt/perl-5.10.0/lib/5.10.0/ExtUtils/typemap   frame_deparent_5a3d.xs > frame_deparent_5a3d.xsc && mv frame_deparent_5a3d.xsc frame_deparent_5a3d.c
cc -c  -I/Users/jbenjore/src/runops-movie/bin -fno-common -DPERL_DARWIN -no-cpp-precomp -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -I/opt/local/include -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\"  "-I/opt/perl-5.10.0/lib/5.10.0/darwin-2level/CORE"   frame_deparent_5a3d.c
Running Mkbootstrap for frame_deparent_5a3d ()
chmod 644 frame_deparent_5a3d.bs
rm -f blib/arch/auto/frame_deparent_5a3d/frame_deparent_5a3d.bundle
env MACOSX_DEPLOYMENT_TARGET=10.3 cc  -bundle -undefined dynamic_lookup -L/usr/local/lib -L/opt/local/lib -fstack-protector frame_deparent_5a3d.o  -o blib/arch/auto/frame_deparent_5a3d/frame_deparent_5a3d.bundle 	\
	     	\
	  
chmod 755 blib/arch/auto/frame_deparent_5a3d/frame_deparent_5a3d.bundle
cp frame_deparent_5a3d.bs blib/arch/auto/frame_deparent_5a3d/frame_deparent_5a3d.bs
chmod 644 blib/arch/auto/frame_deparent_5a3d/frame_deparent_5a3d.bs
