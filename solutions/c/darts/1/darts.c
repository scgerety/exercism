#include "darts.h"

const double INNER_RADIUS   =  1.;
const double MIDDLE_RADIUS  =  5.;
const double OUTER_RADIUS   = 10.;

Score score(coordinate_t position) {

  double dist_squared = 0;
  for (int dimension = 0; dimension < 2; dimension++) {
    double length = (double)position[dimension]; // sqrt() function takes double types, not floats.
    dist_squared += length * length;
  }

  double dist = sqrt(dist_squared);

  if (dist <= INNER_RADIUS) {
    return HIGH_SCORE;
  } else if (dist <= MIDDLE_RADIUS) {
    return MIDDLE_SCORE;
  } else if (dist <= OUTER_RADIUS) {
    return LOW_SCORE;
  }
  return NO_SCORE;
}
