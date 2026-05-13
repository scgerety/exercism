#include "grains.h"

uint64_t square(uint8_t index) {

  if (index > 64 || 1 > index) { // index is out of range
    return 0;
  }

  uint64_t num_grains = 1;
  index--; // We're raising to the power of index - 1
  for (; index > 0; index--) {
    num_grains *= 2;
  }

  return num_grains;
}

uint64_t total(void) {
  uint64_t num_grains = 0;

  for (uint8_t index = 64; index > 0; index--) { // Needed to be careful not to say >= 0, because uint8_t is always positive.
    num_grains += square(index);
  }

  return num_grains;
}
