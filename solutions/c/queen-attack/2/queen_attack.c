#include "queen_attack.h"

bool off_board(position_t queen) {
  if (queen.row > 7) { // Invalid row
    return true;
  }
  if (queen.column > 7) { // Invalid column
    return true;
  }

  return false;
}

bool invalid_position(position_t queen1, position_t queen2) {
  bool queens_occupy_same_square = (queen1.row == queen2.row && queen1.column == queen2.column);

  return queens_occupy_same_square || off_board(queen1) || off_board(queen2);
}

bool same_diagonal(position_t queen1, position_t queen2) {
  int row_dist = abs(queen1.row - queen2.row);
  int col_dist = abs(queen1.column - queen2.column);
  bool same_dist_row_and_col = (row_dist == col_dist);

  return same_dist_row_and_col;
}

attack_status_t can_attack(position_t queen1, position_t queen2) {
  if (invalid_position(queen1, queen2)) {
    return INVALID_POSITION;
  }

  bool same_row = (queen1.row == queen2.row);
  bool same_col = (queen1.column == queen2.column);
  if (same_row || same_col || same_diagonal(queen1, queen2)) {
    return CAN_ATTACK;
  }
  return CAN_NOT_ATTACK;
}
