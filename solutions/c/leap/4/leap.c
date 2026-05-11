#include "leap.h"

bool leap_year(int year) {
  bool year_is_divisible_by_4 = (year % 4 == 0);

  if (year_is_divisible_by_4) {
    bool is_not_century  = (year % 100 != 0);
    bool is_leap_century = (year % 400 == 0);

    return is_not_century || is_leap_century;
  }
  return false;
}
