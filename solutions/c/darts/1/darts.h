#ifndef DARTS_H
#define DARTS_H
#include <math.h>

typedef float coordinate_t[2];

typedef enum {
  HIGH_SCORE    = 10,
  MIDDLE_SCORE  =  5,
  LOW_SCORE     =  1,
  NO_SCORE      =  0,
} Score;

Score score(coordinate_t position);

#endif
