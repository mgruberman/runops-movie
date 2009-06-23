#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#line 119
#include <Judy.h>
void
deparent( PerlIO *ifh, PerlIO *ofh, void *rulledge, void *arity ) {
    SV *line_sv;
    char *line;
    Pvoid_t *pxedge;
    PWord_t pxarity;
    Word_t x,y,best_x,best_x_arity;
    STRLEN line_len;
    int found_x;

    /* for each line */
    line_sv = newSVpv("",0);
    while (sv_gets(line_sv,ifh,0)) {
        line = SvPV(line_sv,line_len);
        if ( 1 != sscanf(line,"vertex(%x).",&y) ) {
            croak(line);
        }

        /* Fetch parents */
        JLG(pxedge,rulledge,y);
        if ( pxedge ) {

            /* For each parent, find the best */
            best_x_arity = -1;
            best_x = -1;
            x = 0;
            J1F(found_x,*pxedge,x);
            while ( found_x ) {

                /* Fetch parent's arity */
                JLG(pxarity,arity,x);
                if ( pxarity ) {
                    /* Choose best parent */
                    if ( -1 == best_x
                         || best_x_arity < *pxarity
                         || ( best_x_arity == *pxarity && x < best_x ) ) {
                        best_x = x;
                        best_x_arity = *pxarity;
                    }
                }

                J1N(found_x,*pxedge,x);
            }

            /* Write best parent */
            PerlIO_printf(ofh,"edge(%x,%x).\n",best_x,y);
        }
        else {
            PerlIO_printf(ofh,"edge(0,%x).\n",y);
        }

    }
    SvREFCNT_dec(line_sv);
}

MODULE = frame_deparent_4d18	PACKAGE = main	

PROTOTYPES: DISABLE


void
deparent (ifh, ofh, rulledge, arity)
	PerlIO *	ifh
	PerlIO *	ofh
	void *	rulledge
	void *	arity
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	deparent(ifh, ofh, rulledge, arity);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

