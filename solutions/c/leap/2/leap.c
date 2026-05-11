#include "leap.h"

bool leap_year(int year) {
  bool check_year, check_century;

  check_year = (year % 4 == 0);
  if (check_year) {
    check_century = (year % 100 == 0) ? (year % 400 == 0) : true;
  }

  return (check_year && check_century);
}
