       IDENTIFICATION DIVISION.
       PROGRAM-ID. YACHT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01 WS-RESULT PIC 99 VALUE 0.
          01 WS-CATEGORY PIC X(15).
          01 WS-DICE PIC 9(5).
          01 WS-DICE-ARRAY REDEFINES WS-DICE.
            05 WS-DICE-TABLE OCCURS 5 TIMES
               INDEXED BY DID.
               10 WS-SINGLE-DIE PIC 9.
          01 WS-NUMS PIC 9 VALUE 0.
          01 WS-COUNTER PIC 9 VALUE 0.
          01 WS-SWAP.
            05 WS-SWAP-TABLE PIC 9 OCCURS 3 TIMES
               INDEXED BY SWAP-ID.
          01 NEXT-ID PIC 9.
          01 SAVE-ID PIC 9.
          01 WS-SORT.
            05 WS-SORT-TABLE PIC 9 OCCURS 5 TIMES
               INDEXED BY SORT-ID.
          01 MATCH-ID PIC 9.
          01 WS-ROLL-STRUCTURE.
            05 WS-STRUCT-ARRAY OCCURS 5 TIMES
               INDEXED BY SID.
               10 WS-DIE-STRUCT PIC 9 VALUE 0.
          01 WS-IS-NUMS-CATEGORY PIC 9 VALUE 1.
          01 WS-NUMBER-MATCH.
            05 WS-1 PIC X(15) VALUE 'ones'.
            05 WS-2 PIC X(15) VALUE 'twos'.
            05 WS-3 PIC X(15) VALUE 'threes'.
            05 WS-4 PIC X(15) VALUE 'fours'.
            05 WS-5 PIC X(15) VALUE 'fives'.
            05 WS-6 PIC X(15) VALUE 'sixes'.
          01 WS-NUMBER-TABLE REDEFINES WS-NUMBER-MATCH.
            05 WS-NUM-CAT PIC X(15) OCCURS 6 TIMES INDEXED BY IDX.
       PROCEDURE DIVISION.
          YACHT.
            MOVE ZEROES TO WS-RESULT.
            SET IDX TO 1.
            SEARCH WS-NUM-CAT VARYING IDX
               AT END MOVE 0 TO WS-NUMS
               WHEN WS-CATEGORY = WS-NUM-CAT(IDX)
                  MOVE IDX TO WS-NUMS
            END-SEARCH.
            PERFORM MOVE-DICE
               VARYING DID FROM 1 BY 1
               UNTIL DID > 5.
            PERFORM INSERTION-SORT.
            PERFORM RETURN-DICE
               VARYING SORT-ID FROM 1 BY 1
               UNTIL SORT-ID > 5.
      
            PERFORM COUNTS.
            
            PERFORM MOVE-STRUCT
               VARYING SID FROM 1 BY 1
               UNTIL SID > 5.
            PERFORM INSERTION-SORT.
            PERFORM RETURN-STRUCT
               VARYING SORT-ID FROM 1 BY 1
               UNTIL SORT-ID > 5.
      
            EVALUATE TRUE
               WHEN WS-NUMS > 0
                  PERFORM MATCH-NUM
               WHEN WS-CATEGORY = 'full house'
                  PERFORM FULL-HOUSE
               WHEN WS-CATEGORY = 'four of a kind'
                  PERFORM FOUR-KIND
               WHEN WS-CATEGORY = 'little straight'
                  PERFORM LITTLE-STRAIGHT
               WHEN WS-CATEGORY = 'big straight'
                  PERFORM BIG-STRAIGHT
               WHEN WS-CATEGORY = 'choice'
                  PERFORM CHOICE
               WHEN WS-CATEGORY = 'yacht'
                  PERFORM ALL-SAME
               WHEN OTHER
                  MOVE WS-CATEGORY TO WS-RESULT
            END-EVALUATE.

          MATCH-NUM.
            PERFORM FILTER VARYING DID FROM 1 BY 1 
               UNTIL DID > 5.
            PERFORM ADD-TO-SCORE VARYING DID FROM 1 BY 1
               UNTIL DID > 5.

          FILTER.
            IF WS-NUMS <> WS-SINGLE-DIE(DID) 
               THEN MOVE 0 TO WS-SINGLE-DIE(DID)
            END-IF.
          
          FULL-HOUSE.
            IF WS-DIE-STRUCT(4) = 2 AND WS-DIE-STRUCT(5) = 3
               THEN PERFORM ADD-TO-SCORE VARYING DID FROM 1 BY 1
                  UNTIL DID > 5
            ELSE MOVE 0 TO WS-RESULT
            END-IF.
      
          FOUR-KIND.
            IF WS-STRUCT-ARRAY(5) >= 4
               THEN MULTIPLY WS-SINGLE-DIE(3) BY 4 GIVING WS-RESULT
            END-IF.
      
          LITTLE-STRAIGHT.
             IF WS-DIE-STRUCT(5) = 1 AND WS-SINGLE-DIE(5) <> 6
               THEN MOVE 30 TO WS-RESULT
             ELSE MOVE 0 TO WS-RESULT
             END-IF.
      
          BIG-STRAIGHT.
            IF WS-DIE-STRUCT(5) = 1 AND WS-SINGLE-DIE(1) <> 1
               THEN MOVE 30 TO WS-RESULT
            ELSE MOVE 0 TO WS-RESULT
            END-IF.
      
          CHOICE.
            PERFORM ADD-TO-SCORE VARYING DID FROM 1 BY 1
               UNTIL DID > 5.
      
          ALL-SAME.
            IF WS-DIE-STRUCT(5) = 5
               THEN MOVE 50 TO WS-RESULT
            ELSE MOVE 0 TO WS-RESULT
            END-IF.
      
          COUNTS.
            SET MATCH-ID TO 1.
            SET DID TO 1.
            SET SID TO 1.
            MOVE ZEROES TO WS-ROLL-STRUCTURE.
            PERFORM CHECK 5 TIMES.
      
          CHECK.
            IF WS-SINGLE-DIE(MATCH-ID) = WS-SINGLE-DIE(DID)
               THEN SET WS-DIE-STRUCT(SID) UP BY 1
            ELSE
               MOVE DID TO MATCH-ID
               SET SID UP BY 1
               SET WS-DIE-STRUCT(SID) UP BY 1
            END-IF.
            SET DID UP BY 1.

          MOVE-DICE.
            MOVE WS-SINGLE-DIE(DID) TO WS-SORT-TABLE(DID).
          RETURN-DICE.
            MOVE WS-SORT-TABLE(SORT-ID) TO WS-SINGLE-DIE(SORT-ID).
          MOVE-STRUCT.
            MOVE WS-DIE-STRUCT(SID) TO WS-SORT-TABLE(SID).
          RETURN-STRUCT.
            MOVE WS-SORT-TABLE(SORT-ID) TO WS-DIE-STRUCT(SORT-ID).

          INSERTION-SORT.
            PERFORM SORT-STEP VARYING SORT-ID FROM 1 BY 1
               UNTIL SORT-ID > 4.
            
          SORT-STEP.
            ADD 1 TO SORT-ID GIVING NEXT-ID.
            MOVE SORT-ID TO SAVE-ID.
            IF WS-SORT-TABLE(NEXT-ID) < WS-SORT-TABLE(SORT-ID)
              THEN PERFORM SWAP
                 UNTIL WS-SORT-TABLE(NEXT-ID) >= WS-SORT-TABLE(SORT-ID)
            MOVE SAVE-ID TO SORT-ID.
            
          SWAP.
            MOVE WS-SORT-TABLE(SORT-ID) TO WS-SWAP-TABLE(1).
            MOVE WS-SORT-TABLE(NEXT-ID) TO WS-SWAP-TABLE(2).
            PERFORM SUB-SWAP.
            MOVE WS-SWAP-TABLE(1) TO WS-SORT-TABLE(SORT-ID).
            MOVE WS-SWAP-TABLE(2) TO WS-SORT-TABLE(NEXT-ID).
            SET NEXT-ID DOWN BY 1.
            SET SORT-ID DOWN BY 1.
      
          SUB-SWAP.
            MOVE WS-SWAP-TABLE(1) TO WS-SWAP-TABLE(3).
            MOVE WS-SWAP-TABLE(2) TO WS-SWAP-TABLE(1).
            MOVE WS-SWAP-TABLE(3) TO WS-SWAP-TABLE(2).

          ADD-TO-SCORE.
            ADD WS-SINGLE-DIE(DID) TO WS-RESULT.
          