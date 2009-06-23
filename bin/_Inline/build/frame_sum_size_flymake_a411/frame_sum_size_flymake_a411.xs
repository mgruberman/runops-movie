#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 74
#include <Judy.h>
void*
read_edge(PerlIO *fh) {
    SV *line_sv;
    char *line;
    STRLEN line_len;
    Pvoid_t edge = 0;
    PWord_t pyedge;
    Word_t x, y;
    int Rc_int;

    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,fh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 2 != sscanf(line,"edge(%x,%x).",&x,&y) ) {
            croak(line);
        }

        JLI(pyedge,edge,x);
        J1S(Rc_int,*pyedge,y);
    }
    SvREFCNT_dec(line_sv);

    return edge;
}

MODULE = frame_sum_size_flymake_a411	PACKAGE = main	

PROTOTYPES: DISABLE


void *
read_edge (fh)
	PerlIO *	fh

