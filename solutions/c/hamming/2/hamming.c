#include "hamming.h"
/*------------------------------------------------------------------------------
 * This new iteration inspired by ajborla on exercism. See for comparison:
 * https://exercism.org/tracks/c/exercises/hamming/solutions/ajborla
 *----------------------------------------------------------------------------*/

int get_length_difference(const char *dna_seq1, const char *dna_seq2) {
  int length_difference = 0;
  char* nucleotide_ptr1 = (char*) dna_seq1;
  char* nucleotide_ptr2 = (char*) dna_seq2;

  while (*nucleotide_ptr1++ != '\0') length_difference++;
  while (*nucleotide_ptr2++ != '\0') length_difference--;

  return length_difference;
}

int compute(const char *dna_seq1, const char *dna_seq2) {
  if (get_length_difference(dna_seq1, dna_seq2) != 0) {
    return ERROR_VALUE;
  }
  
  int hamming_distance = 0;
  char* nucleotide_ptr1 = (char*) dna_seq1;
  char* nucleotide_ptr2 = (char*) dna_seq2;

  while (*nucleotide_ptr1 != '\0') {
    if (*nucleotide_ptr1++ != *nucleotide_ptr2++) hamming_distance++;
  }

  return hamming_distance;
}
