#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
/* #line 109 */
#include <Judy.h>

int
_sum(Pvoid_t const vertex_size, Pvoid_t const edge, Word_t const x, Pvoid_t *sums) {
    PWord_t pyedge;
    PWord_t psum, psize;
    Word_t y, sum;
    int found_y;

    /* Already computed? */
    psum = 0;
    JLI( psum, *sums, x );
    if ( ! psum ) {
        croak("Can't allocate");
    }

    if ( *psum ) {
        return *psum;
    }
    else {
        /* size(X) + sum(size(children)) */
        psize = 0;
        JLG( psize, vertex_size, x );
        sum = psize ? *psize : 128;

        /* Fetch children */
        pyedge = 0;
        JLG( pyedge, edge, x );
        if ( ! pyedge ) {
            return *psum = sum;
        }

        /* Sum children */
        y = 0;
        J1F( found_y, (Pvoid_t)*pyedge, y );
        while ( found_y ) {
            sum += _sum( vertex_size, edge, y, sums );

            J1N( found_y, (Pvoid_t)*pyedge, y );
        }

        /* Refetch sum because *sums likely has changed */
        JLG(psum,*sums,x);
        return *psum = sum;
    }
}

void*
calc_sum( void* vertex_size, void* edge, int x ) {
    Pvoid_t *sums = malloc(sizeof(Pvoid_t));
    *sums = 0;
    _sum( vertex_size, edge, x, sums );
    return *sums;
}

MODULE = frame_sum_size_c89e	PACKAGE = main	

PROTOTYPES: DISABLE


void *
calc_sum (vertex_size, edge, x)
	void *	vertex_size
	void *	edge
	int	x

