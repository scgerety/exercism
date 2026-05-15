#include "darts.h"

const double INNER_RADIUS   =  1.;
const double MIDDLE_RADIUS  =  5.;
const double OUTER_RADIUS   = 10.;
const int    NUM_DIMENSIONS = sizeof(coordinate_t) / sizeof(float);
/* -----------------------------------------------------------------------------
 * coordinate_t is made up of float types because that is what is supplied in
 * the tests. I'm having fun with this, for the most part. I'm allowing the
 * possibility of a multi-dimensional dart board. (Ludicrous, but fun!)
 * ---------------------------------------------------------------------------*/

score_t score(coordinate_t position) {

  double dist_squared = 0;
  for (int dimension = 0; dimension < NUM_DIMENSIONS; dimension++) {
    double length = (double)position[dimension];
    /*--------------------------------------------------------------------------
     * sqrt() function takes double types, not floats. So, coerce
     * position[dimension] type to double type.
     *------------------------------------------------------------------------*/
    dist_squared += length * length;
  }

  double dist = sqrt(dist_squared);
  score_t throw_score = NO_SCORE;
  /*--------------------------------------------------------------------------
   * Decided to return throw_score because the return statements within if...
   * else... felt ugly.
   *--------------------------------------------------------------------------*/
  if (dist <= INNER_RADIUS) {
    throw_score = HIGH_SCORE;
  } else if (dist <= MIDDLE_RADIUS) {
    throw_score = MIDDLE_SCORE;
  } else if (dist <= OUTER_RADIUS) {
    throw_score = LOW_SCORE;
  } else {
    throw_score = NO_SCORE;
  }
  return throw_score;
}
