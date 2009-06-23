/opt/perl-5.10.0/bin/perl /opt/perl-5.10.0/lib/5.10.0/ExtUtils/xsubpp  -typemap /opt/perl-5.10.0/lib/5.10.0/ExtUtils/typemap   frame_redge_0598.xs > frame_redge_0598.xsc && mv frame_redge_0598.xsc frame_redge_0598.c
cc -c  -I/Users/jbenjore/src/runops-movie/bin -fno-common -DPERL_DARWIN -no-cpp-precomp -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -I/opt/local/include -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\"  "-I/opt/perl-5.10.0/lib/5.10.0/darwin-2level/CORE"   frame_redge_0598.c
frame_redge_0598.xs: In function ‘write_redge’:
frame_redge_0598.xs:65: warning: assignment makes pointer from integer without a cast
frame_redge_0598.xs: In function ‘free_redge’:
frame_redge_0598.xs:89: warning: argument to '&' not really an lvalue; this will be a hard error in the future
Running Mkbootstrap for frame_redge_0598 ()
chmod 644 frame_redge_0598.bs
rm -f blib/arch/auto/frame_redge_0598/frame_redge_0598.bundle
env MACOSX_DEPLOYMENT_TARGET=10.3 cc  -bundle -undefined dynamic_lookup -L/usr/local/lib -L/opt/local/lib -fstack-protector frame_redge_0598.o  -o blib/arch/auto/frame_redge_0598/frame_redge_0598.bundle 	\
	     	\
	  
chmod 755 blib/arch/auto/frame_redge_0598/frame_redge_0598.bundle
cp frame_redge_0598.bs blib/arch/auto/frame_redge_0598/frame_redge_0598.bs
chmod 644 blib/arch/auto/frame_redge_0598/frame_redge_0598.bs
