#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 34
#include <Judy.h>
void*
read_edge_as_redge(PerlIO *fh) {
    SV *line_sv;
    char *line;
    Pvoid_t redge = 0;
    Pvoid_t *pxedge;
    STRLEN line_len;
    int Rc_int, x, y;

    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,fh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 2 != sscanf(line,"edge(%x,%x).",&x,&y) ) {
            croak(line);
        }

        JLI(pxedge,redge,y);
        J1S(Rc_int,*pxedge,x);
    }
    SvREFCNT_dec(line_sv);

    return redge;
}

void
write_redge( void *redge, PerlIO *ofh ) {
    PWord_t pxedge;
    Word_t x, y;
    int found_x;

    pxedge = y = 0;
    JLF(pxedge,redge,y);
    while ( pxedge ) {
       found_x = x = 0;
       J1F(found_x,(Pvoid_t)*pxedge,x);
       while (found_x) {
           PerlIO_printf(ofh,"redge(%x,%x).\n",x,y);

           J1N(found_x,(Pvoid_t)*pxedge,x);
       }

       JLN(pxedge,redge,y);
    }
}

void
free_redge(void *redge) {
    PWord_t pxedge;
    Word_t y;
    int freed;

    y = 0;
    JLF(pxedge,redge,y);
    while (pxedge) {
        J1FA(freed,(Pvoid_t)*pxedge);
        JLN(pxedge,redge,y);
    }
    JLFA(freed,redge);
}


MODULE = frame_redge_0598	PACKAGE = main	

PROTOTYPES: DISABLE


void *
read_edge_as_redge (fh)
	PerlIO *	fh

void
write_redge (redge, ofh)
	void *	redge
	PerlIO *	ofh
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	write_redge(redge, ofh);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
free_redge (redge)
	void *	redge
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	free_redge(redge);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

