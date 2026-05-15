#ifndef RESISTOR_COLOR_DUO_H
#define RESISTOR_COLOR_DUO_H

#include <stdint.h>
#include <math.h>

typedef enum {
  BLACK,
  BROWN,
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  VIOLET,
  GREY,
  WHITE,
  NUM_COLORS
} resistor_band_t;

typedef resistor_band_t resistor_t[];
int color_code(resistor_t resistor);

#endif
