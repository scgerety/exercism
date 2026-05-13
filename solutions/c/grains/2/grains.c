#include "grains.h"

uint64_t square(uint8_t index) {

  if (index > 64 || 1 > index) { // index is out of range
    return 0;
  }

  uint64_t num_grains = 1;
  index--; // We're raising to the power of index - 1

  return num_grains << index; // Since it's 2 to the power of index, we can exploit binary shifting.
}

uint64_t total(void) {
  return UINT64_MAX; // Surprise! All bits in uint64_t is literally the answer to the question.
}
