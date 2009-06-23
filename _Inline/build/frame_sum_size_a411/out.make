/opt/perl-5.10.0/bin/perl /opt/perl-5.10.0/lib/5.10.0/ExtUtils/xsubpp  -typemap /opt/perl-5.10.0/lib/5.10.0/ExtUtils/typemap   frame_sum_size_a411.xs > frame_sum_size_a411.xsc && mv frame_sum_size_a411.xsc frame_sum_size_a411.c
cc -c  -I/Users/jbenjore/src/runops-movie/bin -fno-common -DPERL_DARWIN -no-cpp-precomp -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -I/opt/local/include -g   -DVERSION=\"0.00\" -DXS_VERSION=\"0.00\"  "-I/opt/perl-5.10.0/lib/5.10.0/darwin-2level/CORE"   frame_sum_size_a411.c
frame_sum_size_a411.xs: In function ‘read_edge’:
frame_sum_size_a411.xs:93: warning: passing argument 1 of ‘Judy1Set’ from incompatible pointer type
Running Mkbootstrap for frame_sum_size_a411 ()
chmod 644 frame_sum_size_a411.bs
rm -f blib/arch/auto/frame_sum_size_a411/frame_sum_size_a411.bundle
env MACOSX_DEPLOYMENT_TARGET=10.3 cc  -bundle -undefined dynamic_lookup -L/usr/local/lib -L/opt/local/lib -fstack-protector frame_sum_size_a411.o  -o blib/arch/auto/frame_sum_size_a411/frame_sum_size_a411.bundle 	\
	     	\
	  
chmod 755 blib/arch/auto/frame_sum_size_a411/frame_sum_size_a411.bundle
cp frame_sum_size_a411.bs blib/arch/auto/frame_sum_size_a411/frame_sum_size_a411.bs
chmod 644 blib/arch/auto/frame_sum_size_a411/frame_sum_size_a411.bs
