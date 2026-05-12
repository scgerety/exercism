#include "leap.h"

bool leap_year(int year) {
  bool not_divisible_by_4 = (year % 4 != 0);

  if (not_divisible_by_4) {
    return false;
  }

  bool not_century     = (year % 100 != 0);
  bool is_leap_century = (year % 400 == 0);

  return not_century || is_leap_century;
}
