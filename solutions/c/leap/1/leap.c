#include "leap.h"

struct LeapTest {
  bool leapYear;
  bool century;
};

bool leap_year(int year) {
  struct LeapTest test1;

  test1.leapYear  = (year %   4 == 0);
  test1.century   = (year % 100 == 0);

  if (test1.century) {
    test1.century = (year % 400 == 0);
  } else {
    test1.century = true;
  }

  return (test1.leapYear && test1.century);
}
