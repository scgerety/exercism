#ifndef SPACE_AGE_H
#define SPACE_AGE_H

#include <stdint.h>

#define ERROR_VALUE -1.0

typedef enum planet {
  NOT_A_PLANET = -1,
  MERCURY = 0,
  VENUS,
  EARTH,
  MARS,
  JUPITER,
  SATURN,
  URANUS,
  NEPTUNE,
  PLUTO // Sentinal value.
} planet_t;

float age(planet_t planet, int64_t seconds);

#endif
