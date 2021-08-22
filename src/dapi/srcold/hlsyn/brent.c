/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1997 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  brent.c - general implementation of Brent's algorithm
 *            (and supporting utilities)
 *
 *   6 Oct 1997  reb:  Split off from circuit.c and nasalf1x.c; 
 *               unified the special-purpose Brent routines in 
 *               those files into general-purpose routines.
 *
 *	001	10/10/02	MFG	ifdef out Process.h not supported under WinCE
 */

#include "flavor.h"

#ifdef ARM7
#pragma arm section code="BRENTCODE", rwdata="BRENTRWDATA", rodata="BRENTRODATA", zidata="BRENTDATA"
#endif

#if (defined(DEBUG) && !defined(UNDER_CE)) || (defined(WARNINGS) && !defined(UNDER_CE)) 
#include <stdio.h>	/* for printf on error */
#include <stdlib.h>	/* for exit on error */
#include <process.h>	/* for exit on error */
#endif

#include <math.h>
#include "hlsyn.h"



short
BrentBracket(BrentFunctionType* pF, void* pOtherArgs,
	float *x1, float *x2, float factor, int ntry)

{
  short j;
  float f1,f2;

#ifdef DEBUG
  if( fabs(*x1 - *x2) < FLOAT_EPS ){
    (void) printf("Bad initial range in BrentBracket()\n");
    exit(1);
  }
#endif

  f1 = (*pF)(*x1, pOtherArgs);
  f2 = (*pF)(*x2, pOtherArgs);

  for(j=1;j<=ntry;j++){
    if(f1 * f2 < 0.0f)
      return 1;

    if(fabs(f1) < fabs(f2))
      f1 = (*pF)(*x1 += factor*(*x1 - *x2), pOtherArgs);

    else
      f2 = (*pF)(*x2 += factor*(*x2 - *x1), pOtherArgs);
  }

  return 0;
}


float
Brent(BrentFunctionType* pF, void* pOtherArgs,
	float x1, float x2, float tol, int itmax, float eps)

/*****
  From Numerical Recipes in C, page 268. Using Brent's method,
  find the root of a function known to lie between x1 and x2.
  The root will be refined until its accuracy is tol.  
*****/

{
  int iter;
  float a=x1,b=x2,c=0.0f,d=0.0f,e=0.0f,min1,min2;
  float fa=(*pF)(a,pOtherArgs);
	float fb=(*pF)(b,pOtherArgs);
  float fc,p,q,r,s,tol1,xm;

#ifdef DEBUG
  if(fb*fa > 0.0f){
    (void) printf(" Root must be bracketed in Brent.");
    exit(1);
  }
#endif

  fc=fb;
  for(iter=1;iter<=itmax;iter++){
    if(fb*fc>0.0f){

      /*****
        Rename a,b,c and adjust bounding
	interval d.
      *****/

      c=a;
      fc=fa;
      e=d=b-a;
    }

    if(fabs(fc) < fabs(fb)){
      a=b;
      b=c;
      c=a;
      fa=fb;
      fb=fc;
      fc=fa;
    }

    tol1=(float)(2.0f*eps*fabs(b)+0.5f*tol); /* Convergence check */
    xm=(float)(0.5f*(c-b));

    if(fabs(xm)<= tol1 || fb==0.0f)
      return b;
    if(fabs(e)>=tol1 && fabs(fa)>fabs(fb)){

      /*****
        Attempt inverse quadratic interpolation 
      *****/

      s=fb/fa;
      if(a==c){
        p=(float)(2.0f*xm*s);
        q=(float)(1.0f-s);
      }else{
        q=fa/fc;
        r=fb/fc;
        p=(float)(s*(2.0f*xm*q*(q-r)-(b-a)*(r-1.0f)));
        q=(float)((q-1.0f)*(r-1.0f)*(s-1.0f));
      }
      if(p>0.0f)	/* Check whether in bounds */
        q = -q;
      p=(float)fabs(p);
      min1=(float)(3.0f*xm*q-fabs(tol1*q));
      min2=(float)fabs(e*q);
      if(2.0f*p<(min1<min2 ?min1: min2)){
        e=d;	/* Accept interpolation */
        d=p/q;
      } else {
      /*****
        Interpolation failed, use
        bisection.
      *****/
        d=xm;
        e=d;
      }
    }else{
      /*****
        Bounds decreasing too slowly,
        use bisection.
      *****/
      d=xm;
      e=d;
    }
    a=b;	/* Move last best guess to a. */
    fa=fb;
    if(fabs(d)>tol1) /* evaluate new trial root. */
      b += d;
    else
      b += (float)(xm>0.0f ? fabs(tol1) : -fabs(tol1));

    fb=(*pF)(b,pOtherArgs);
  }
#ifdef DEBUG
  (void) printf("Maximum number of iterations exceeded in Brent.");
  exit(1);
#endif

  if(x1<x2)
    return x2+1; /* error code, return out of bounds */
  else
    return x2-1;
}
