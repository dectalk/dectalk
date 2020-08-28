// -*- Mode: C++ -*-
// Copyright (c) 1995-1996 Sensimetrics Corporation
// e.p.carlson
//
// 27 Aug 1996  reb:  include flavor.h
// 08 Aug 1996  reb:  archived as version 2.2 (no changes).
// 27 Apr 1995  original
// 23 May 1995  changed to do explicit index arithmetic
// 24 May 1995  made it work...

// Returns an error-diffused copy of an unsigned-char array, using the
// Floyd and Steinberg algorithm with serpentine raster.  The input bitmap
// should contain values between 0 (white) and max (black).  The output
// contains only the values 0 (black) and 255 (white).

// Roundoff error is avoided by doing all internal calculations using
// values * 16.

// The boundary cases for the first and last columns of each row and for
// the last row have been inlined to maximize speed.  I haven't thought
// as hard about the actual calculations, except that I've used shifts
// and adds rather than multiplications.  In particular, it may be
// possible to do something more efficient with the movement and
// combination of the error terms at each stage.

#include "flavor.h"

#include <stdlib.h>
#include <malloc.h>

typedef unsigned char byte;

// This macro calculates the rounded pixel value, the error, and then
// 4/16ths, 2/16ths, and 1/16th of the error.  Many symbols are captured
#define SET_PIXEL(index)                               \
  actual16 = bitmap16[index];                                \
  approx16 = ((actual16 + halfrange16) / range16) * range16; \
  output[idx] = (approx16 < halfrange16) ? 255 : 0;          \
  err16 = actual16 - approx16;                               \
  err4 = err16 >> 2;                                         \
  err2 = err4 >> 1;                                          \
  err1 = err2 >> 1;


 void DiffuseError(byte * input, byte * output,
					long rows, long columns,
					byte offset, byte range, byte max)
{
  long x, y, width, idx, idx7, idx5, idx3, idx1, tmp, clip;
    long range16, halfrange16, actual16, approx16, err16, err4, err2, err1;

  long * bitmap16;
  
  if ((rows < 2) || (columns < 2)) return;

  bitmap16 = malloc(rows * columns * sizeof(long));
  width = ((columns + 3) / 4) * 4;

  // copy into bitmap16, adjusting from palette-indices to (grey-steps * 16)
  range16 = range << 4;
  halfrange16 = range << 3;
  clip = offset + (max - range);
  for (x = 0; x < columns; x++) {
    idx = x;
    for (y = 0; y < rows; y++) {
      tmp = input[idx] - clip;
      if (tmp < 0)
	bitmap16[idx] = 0;
      else if (tmp <= range)
	bitmap16[idx] = tmp << 4;
      else
	bitmap16[idx] = range16;
      idx += width;
    }
  }

  // all but last row
  for (y = 0; y < (rows - 1); y++) {
    if ((y % 2) == 0) {		// if y is even
      // first column
      idx = y * width;
      idx7 = idx + 1;
      idx5 = idx + width;
      idx3 = idx5 - 1;
      idx1 = idx5 + 1;
      SET_PIXEL(idx);
      bitmap16[idx5] += err4 + err1;
      bitmap16[idx7] += err4 + err2 + err1;
      bitmap16[idx1] += err1;

      // middle columns
      for (x = 1; x < (columns - 1); x++) {
	++idx;
	++idx7;
	++idx5;
	++idx3;
	++idx1;
	SET_PIXEL(idx);
	bitmap16[idx7] += err4 + err2 + err1;
	bitmap16[idx5] += err4 + err1;
	bitmap16[idx3] += err2 + err1;
	bitmap16[idx1] += err1;
      }

      // last column
      ++idx5;
      ++idx3;
      SET_PIXEL(idx);
      bitmap16[idx5] += err4 + err1;
      bitmap16[idx3] += err2 + err1;
    }
    else {			// else y is odd
      // first column
      idx = (columns - 1) + y * width;
      idx7 = idx - 1;
      idx5 = idx + width;
      idx3 = idx5 + 1;
      idx1 = idx5 - 1;
      SET_PIXEL(idx);
      bitmap16[idx5] += err4 + err1;
      bitmap16[idx3] += err2 + err1;

      // middle columns
      for (x = (columns - 2); x > 0; x--) {
	--idx;
	--idx7;
	--idx5;
	--idx3;
	--idx1;
	SET_PIXEL(idx);
	bitmap16[idx7] += err4 + err2 + err1;
	bitmap16[idx5] += err4 + err1;
	bitmap16[idx3] += err2 + err1;
	bitmap16[idx1] += err1;
      }

      // last column
      --idx7;
      --idx5;
      --idx1;
      SET_PIXEL(idx);
      bitmap16[idx7] += err4 + err2 + err1;
      bitmap16[idx5] += err4 + err1;
      bitmap16[idx1] += err1;
    }
  }

  // last row
  y = rows - 1;
  if ((y % 2) == 0) {		// if y is even
    idx = y * width;
    idx7 = idx + 1;
    for (x = 0; x < (columns - 1); x++) { // all but last column
      SET_PIXEL(idx);
      bitmap16[idx7] += err4 + err2 + err1;
      ++idx;
      ++idx7;
    }
    SET_PIXEL(idx);		// last column
  }
  else {			// else y is odd
    idx = (columns - 1) + y * width;
    idx7 = idx - 1;
    for (x = (columns - 1); x > 0; x--) { // all but last column
      SET_PIXEL(idx);
      bitmap16[idx7] += err4 + err2 + err1;
      --idx;
      --idx7;
    }
    SET_PIXEL(idx);		// last column
  }

  free(bitmap16);
}
