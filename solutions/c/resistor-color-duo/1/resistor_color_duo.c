#include "resistor_color_duo.h"

const int NUM_BANDS = 2;
const int BASE = 10;

int color_code(resistor_t resistor) {
  int resistance_value = 0;
  int digit_value = pow(BASE, NUM_BANDS - 1);
  
  for (int band = 0; band < NUM_BANDS; band++) {
    resistance_value += resistor[band] * digit_value;
    digit_value /= BASE;
  }

  return resistance_value;
}
