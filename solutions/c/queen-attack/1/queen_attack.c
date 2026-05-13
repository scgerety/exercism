#include "queen_attack.h"
bool invalid_position(position_t queen) {
  if (queen.row > 7) { // Invalid row
    return true;
  }
  if (queen.column > 7) { // Invalid column
    return true;
  }

  return false;
}

bool same_diagonal(position_t queen1, position_t queen2) {
  int row_dist = queen1.row - queen2.row;
  int col_dist = queen1.column - queen2.column;
  if (row_dist < 0) {
    row_dist *= -1;
  }
  if (col_dist < 0) {
    col_dist *= -1;
  }
  bool same_dist_row_and_col = (row_dist == col_dist);

  return same_dist_row_and_col;
}

attack_status_t can_attack(position_t queen1, position_t queen2) {
  bool queens_occupy_same_square = (queen1.row == queen2.row && queen1.column == queen2.column);
  if (queens_occupy_same_square) { // Queens need to be in different positions.
    return INVALID_POSITION;
  }
  if (invalid_position(queen1) || invalid_position(queen2)) {
    return INVALID_POSITION;
  }

  bool same_row = (queen1.row == queen2.row);
  bool same_col = (queen1.column == queen2.column);
  if (same_row || same_col || same_diagonal(queen1, queen2)) {
    return CAN_ATTACK;
  }
  return CAN_NOT_ATTACK;
}
