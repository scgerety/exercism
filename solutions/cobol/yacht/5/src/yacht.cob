       IDENTIFICATION DIVISION.
       PROGRAM-ID. YACHT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          *> Given variables
          01 WS-RESULT                   PIC 9(02).
          01 WS-CATEGORY                 PIC X(15).
          01 WS-DICE                     PIC 9(05).
          *> Avoid overwriting WS-DICE
          01 WS-FACES                    PIC 9(05).
          01 WS-FACE                     PIC 9(01).
          *> 2 ** WS-FACE done 5 times and added together gets unique
          *> identifiers for inclusion patterns, just like permission
          *> numbers in Linux. (Thanks, Borderite!)
          01 WS-INCLUDED                 PIC 9(03).
          01 WS-MATCH                    PIC 9(01).
          01 WS-POSSIBLE-FACES.
            05 WS-HOW-MANY               PIC 9(01)
            OCCURS 6 TIMES
            INDEXED BY FACE-INT.
       PROCEDURE DIVISION.
          YACHT.
            *> Zero out the reused variables.
            MOVE ZERO TO              WS-RESULT.
            MOVE ZERO TO               WS-MATCH.
            MOVE ZERO TO            WS-INCLUDED.
            MOVE ZEROES TO    WS-POSSIBLE-FACES.
            MOVE WS-DICE TO WS-FACES.

            EVALUATE WS-CATEGORY
               WHEN 'ones'
                  MOVE 1 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'twos'
                  MOVE 2 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'threes'
                  MOVE 3 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'fours'
                  MOVE 4 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'fives'
                  MOVE 5 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'sixes'
                  MOVE 6 TO WS-MATCH
                  PERFORM MATCH-NUM
               WHEN 'full house'
                  PERFORM FULL-HOUSE
               WHEN 'four of a kind'
                  PERFORM FOUR-KIND
               WHEN 'little straight'
                  PERFORM LITTLE-STRAIGHT
               WHEN 'big straight'
                  PERFORM BIG-STRAIGHT
               WHEN 'choice'
                  PERFORM CHOICE
               WHEN 'yacht'
                  PERFORM ALL-SAME
               WHEN OTHER
                  DISPLAY "Invalid Category: " WS-CATEGORY
            END-EVALUATE.

          MATCH-NUM.
            PERFORM 5 TIMES
               DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-FACE
               IF WS-FACE = WS-MATCH
                  THEN ADD WS-FACE TO WS-RESULT
               END-IF
            END-PERFORM.
          
          FULL-HOUSE.
            PERFORM COUNTS.
            PERFORM SEARCH-COUNTS VARYING WS-MATCH FROM 2 BY 1
               UNTIL WS-MATCH > 3.
          SEARCH-COUNTS.
            SET FACE-INT TO 1.
            SEARCH WS-HOW-MANY VARYING FACE-INT
               AT END MOVE ZERO TO WS-RESULT
               WHEN WS-HOW-MANY(FACE-INT) = WS-MATCH
                  COMPUTE WS-RESULT = FACE-INT * WS-MATCH + WS-RESULT
            END-SEARCH.
      
          FOUR-KIND.
            PERFORM COUNTS.
            SET FACE-INT TO 1.
            SEARCH WS-HOW-MANY VARYING FACE-INT
               AT END MOVE ZERO TO WS-RESULT
               WHEN WS-HOW-MANY(FACE-INT) >= 4
                  MULTIPLY FACE-INT BY 4 GIVING WS-RESULT
            END-SEARCH.
      
          LITTLE-STRAIGHT.
            PERFORM INCLUDED.
            IF WS-INCLUDED = 62
               THEN MOVE 30 TO WS-RESULT
            ELSE MOVE 0 TO WS-RESULT
            END-IF.
      
          BIG-STRAIGHT.
            PERFORM INCLUDED.
            IF WS-INCLUDED = 124
               THEN MOVE 30 TO WS-RESULT
            ELSE MOVE 0 TO WS-RESULT
            END-IF.
      
          CHOICE.
            PERFORM 5 TIMES
               DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-FACE
               ADD WS-FACE TO WS-RESULT
            END-PERFORM.
      
          ALL-SAME.
            DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-MATCH.
            ADD 10 TO WS-RESULT
            PERFORM 4 TIMES
               DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-FACE
               IF WS-FACE <> WS-MATCH
                  THEN MOVE ZERO TO WS-RESULT
               END-IF
               ADD 10 TO WS-RESULT
            END-PERFORM.
            IF WS-RESULT <= 40
               THEN MOVE 0 TO WS-RESULT
            END-IF.

          COUNTS.
            PERFORM 5 TIMES
               DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-FACE
               ADD 1 TO WS-HOW-MANY(WS-FACE)
            END-PERFORM.
      
          INCLUDED. *> Lifted straight from mentoring by Borderite.
            PERFORM 5 TIMES
               DIVIDE WS-FACES BY 10 GIVING WS-FACES REMAINDER WS-FACE
               IF WS-HOW-MANY(WS-FACE) <> 0
                  THEN EXIT PERFORM
               END-IF
               MOVE 1 TO WS-HOW-MANY(WS-FACE)
               COMPUTE WS-INCLUDED = WS-INCLUDED + 2 ** WS-FACE
            END-PERFORM.