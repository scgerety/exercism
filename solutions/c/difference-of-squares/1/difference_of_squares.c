#include "difference_of_squares.h"

unsigned int squared(unsigned int base) {
  return base * base;
}

unsigned int sum_of_squares(unsigned int number) {
  unsigned int total = 0;
  for (; number > 0; number--) {
    total += squared(number);
  }

  return total;
}

unsigned int square_of_sum(unsigned int number) {
  unsigned int total = 0;
  for (; number > 0; number--) {
    total += number;
  }

  return squared(total);
}

unsigned int difference_of_squares(unsigned int number) {
  return square_of_sum(number) - sum_of_squares(number);
}
