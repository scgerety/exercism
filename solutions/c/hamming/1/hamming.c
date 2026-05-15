#include "hamming.h"

int compute(const char *lhs, const char *rhs) {
  size_t length_strings = strlen(lhs);
  if (strlen(rhs) != length_strings) {
    return ERROR_VALUE;
  }
  
  int hamming_distance = 0;
  for (size_t char_idx = 0; char_idx < length_strings; char_idx++) {
    if (lhs[char_idx] != rhs[char_idx]) {
      hamming_distance++;
    }
  }

  return hamming_distance;
}
