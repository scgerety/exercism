#include "difference_of_squares.h"

unsigned int squared(unsigned int base) {
  return base * base;
}

unsigned int sum_of_squares(unsigned int number) {
  unsigned int sum_squares = (number * (number + 1) * ((number * 2) + 1)) / 6;

  return sum_squares;
}

unsigned int square_of_sum(unsigned int number) {
  unsigned int sum = (number * (number + 1)) / 2;
  return squared(sum);
}

unsigned int difference_of_squares(unsigned int number) {
  return square_of_sum(number) - sum_of_squares(number);
}
