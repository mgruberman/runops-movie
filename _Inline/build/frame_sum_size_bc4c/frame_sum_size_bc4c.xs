#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 36 "/Users/jbenjore/src/runops-movie/bin/frame-sum-size"
#include <Judy.h>
void*
read_size(PerlIO *fh) {
    SV *line_sv;
    char *line;
    Pvoid_t size = 0;
    STRLEN line_len;
    int x;
    PWord_t pxsize;
    Word_t xsize;

    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,fh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 2 != sscanf(line,"size(%x,%d).",&x,&xsize) ) {
            croak(line);
        }

        JLI(pxsize,size,x);
        *pxsize = xsize;
    }
    SvREFCNT_dec(line_sv);

    return size;
}

MODULE = frame_sum_size_bc4c	PACKAGE = main	

PROTOTYPES: DISABLE


void *
read_size (fh)
	PerlIO *	fh

