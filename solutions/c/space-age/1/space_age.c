#include "space_age.h"

const float EARTH_YEAR_IN_SECONDS = 31557600.;
const float MERCURY_YEAR_ON_EARTH =   0.2408467  * EARTH_YEAR_IN_SECONDS;
const float   VENUS_YEAR_ON_EARTH =   0.61519726 * EARTH_YEAR_IN_SECONDS;
const float    MARS_YEAR_ON_EARTH =   1.8808158  * EARTH_YEAR_IN_SECONDS;
const float JUPITER_YEAR_ON_EARTH =  11.862615   * EARTH_YEAR_IN_SECONDS;
const float  SATURN_YEAR_ON_EARTH =  29.447498   * EARTH_YEAR_IN_SECONDS;
const float  URANUS_YEAR_ON_EARTH =  84.016846   * EARTH_YEAR_IN_SECONDS;
const float NEPTUNE_YEAR_ON_EARTH = 164.79132    * EARTH_YEAR_IN_SECONDS;

float age(planet_t planet, int64_t age_in_seconds) {
  float year_in_seconds;

  switch (planet) {
    case MERCURY:
      year_in_seconds = MERCURY_YEAR_ON_EARTH;
      break;
    case VENUS:
      year_in_seconds = VENUS_YEAR_ON_EARTH;
      break;
    case EARTH:
      year_in_seconds = EARTH_YEAR_IN_SECONDS;
      break;
    case MARS:
      year_in_seconds = MARS_YEAR_ON_EARTH;
      break;
    case JUPITER:
      year_in_seconds = JUPITER_YEAR_ON_EARTH;
      break;
    case SATURN:
      year_in_seconds = SATURN_YEAR_ON_EARTH;
      break;
    case URANUS:
      year_in_seconds = URANUS_YEAR_ON_EARTH;
      break;
    case NEPTUNE:
      year_in_seconds = NEPTUNE_YEAR_ON_EARTH;
      break;
    default:
      return ERROR_VALUE;
  }

  float age_in_local_years = (float) age_in_seconds / year_in_seconds;
  // Must coerce age_in_seconds to float type because function expects
  // age_in_local_years as float.

  return age_in_local_years;
}
