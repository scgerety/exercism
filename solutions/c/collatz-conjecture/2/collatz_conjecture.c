#include "collatz_conjecture.h"
#include <stdbool.h>

int steps(int start) {
  if (start < 1) {
    return ERROR_VALUE; // See header file (collatz_conjecture.h) for ERROR_VALUE.
  }

  int num_steps = 0;

  /* This section uses bitwise operators, which I am just beginning to learn about.
   * See https://exercism.org/tracks/c/exercises/collatz-conjecture/approaches/bitwise-operations
   * for more information. */
  while (start != 1) {
    bool is_even = !(start & 1);
    start = is_even ? start >> 1 : start * 3 + 1;
    num_steps++;
  }

  return num_steps;
}
