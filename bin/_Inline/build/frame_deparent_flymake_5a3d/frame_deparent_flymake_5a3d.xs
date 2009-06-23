#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 77
#include <Judy.h>
void*
read_arity(PerlIO *fh) {
    SV *line_sv;
    char *line;
    Pvoid_t arity = 0;
    STRLEN line_len;
    int x;
    PWord_t pxarity;
    Word_t xarity;

    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,fh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 2 != sscanf(line,"arity(%x,%d).",&x,&xarity) ) {
            croak(line);
        }

        JLI(pxarity,arity,x);
        *pxarity = xarity;
    }
    SvREFCNT_dec(line_sv);

    return arity;
}

MODULE = frame_deparent_flymake_5a3d	PACKAGE = main	

PROTOTYPES: DISABLE


void *
read_arity (fh)
	PerlIO *	fh

