#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 38
#include <Judy.h>
void*
read_rulledge(PerlIO *fh) {
    SV *line_sv;
    char *line;
    Pvoid_t rulledge = 0;
    Pvoid_t *pxedge;
    STRLEN line_len;
    int Rc_int, x, y;

    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,fh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 2 != sscanf(line,"rdge(%x,%x).",&y,&x) ) {
            croak(line);
        }

        /* Upsert rulledge[y] //= yedge */
        JLI(pxedge,rulledge,y);

        /* rulledge[y][x] = 1 */
        J1S(Rc_int,*pxedge,x);
    }
    SvREFCNT_dec(line_sv);

    return rulledge;
}

MODULE = frame_deparent_d96e	PACKAGE = main	

PROTOTYPES: DISABLE


void *
read_rulledge (fh)
	PerlIO *	fh

