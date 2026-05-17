#include "space_age.h"

/*------------------------------------------------------------------------------
 * This iteration follows the array approach described by bobahop in the dig
 * deeper section of this exercise. I also decided to use PLUTO as a sentinal
 * value in case more planets are added or removed.
 *----------------------------------------------------------------------------*/
const float EARTH_YEAR_IN_SECONDS = 31557600.;

const float RATIO_LOCAL_TO_EARTH_YEAR[] = {
  0.2408467,    // MERCURY
  0.61519726,   // VENUS
  1.0,          // EARTH
  1.8808158,    // MARS
  11.862615,    // JUPITER
  29.447498,    // SATURN
  84.016846,    // URANUS
  164.79132,    // NEPTUNE
};

float age(planet_t planet, int64_t age_in_seconds) {
  if (planet < MERCURY || planet >= PLUTO) {
    return NOT_A_PLANET; // Sorry, Pluto.
  }
  float year_in_seconds = RATIO_LOCAL_TO_EARTH_YEAR[planet] * EARTH_YEAR_IN_SECONDS;

  float age_in_local_years = (float) age_in_seconds / year_in_seconds;
  // Must coerce age_in_seconds to float type because function expects
  // return value as float.

  return age_in_local_years;
}
