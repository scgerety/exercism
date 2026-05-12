#include "resistor_color.h" // Header file is storing the resistor_band_t enum.

int color_code(resistor_band_t color) {
  return color;
}

resistor_band_t* colors(void) {
  static resistor_band_t all_colors[COLOR_COUNT];
  for (resistor_band_t band = BLACK; band < COLOR_COUNT; band++) {
    all_colors[band] = band; /* I don't quite get why this is helpful. I think
                                I'm just making an array of integers 0 to 9?*/
  }

  return all_colors;
}
