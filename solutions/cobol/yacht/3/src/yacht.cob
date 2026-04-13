       IDENTIFICATION DIVISION.
       PROGRAM-ID. YACHT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          *> Given variables
          01 WS-RESULT                   PIC 9(02)      VALUE 0.
          01 WS-CATEGORY                 PIC X(15).
          01 WS-DICE                     PIC 9(05).

          01 WS-DICE-ARRAY REDEFINES WS-DICE.
            05 WS-DICE-TABLE OCCURS 5 TIMES
               INDEXED BY DID.
               10 WS-SINGLE-DIE          PIC 9(01).
         
          *> Matching variables to determine which Yacht version to play
          01 WS-NUMBER-MATCH.
            05 WS-1                      PIC X(15)      VALUE 'ones'.
            05 WS-2                      PIC X(15)      VALUE 'twos'.
            05 WS-3                      PIC X(15)      VALUE 'threes'.
            05 WS-4                      PIC X(15)      VALUE 'fours'.
            05 WS-5                      PIC X(15)      VALUE 'fives'.
            05 WS-6                      PIC X(15)      VALUE 'sixes'.
          01 WS-NUMBER-TABLE REDEFINES WS-NUMBER-MATCH.
            05 WS-NUM-CAT                PIC X(15) 
               OCCURS 6 TIMES
               INDEXED BY IDX.
          01 WS-NUMS                     PIC 9          VALUE 0.
      
          *> Sorting variables
          01 NEXT-ID                     PIC 9.
          01 SAVE-ID                     PIC 9.
          *> WS-SORT holds the table that INSERTION-SORT operates on
          01 WS-SORT.
            05 WS-SORT-TABLE             PIC 9 
               OCCURS 5 TIMES
               INDEXED BY SORT-ID.
          *> SWAP function is essential to insertion sort
          *> and it swaps through the WS-SWAP variable.
          01 WS-SWAP.
            05 WS-SWAP-TABLE             PIC 9
               OCCURS 3 TIMES
               INDEXED BY SWAP-ID.
      
          *> Roll structure shows distribution of dice counts
          *> which allows other subroutines to score according to
          *> different Yacht versions
          01 WS-ROLL-STRUCTURE.
            05 WS-STRUCT-ARRAY
               OCCURS 5 TIMES
               INDEXED BY SID.
               10 WS-DIE-STRUCT          PIC 9          VALUE 0.
          *> MATCH-ID assists with checking dice number
          *> which is essential for setting up WS-ROLL-STRUCTURE
          01 MATCH-ID                    PIC 9.

       PROCEDURE DIVISION.
          YACHT.
            *> When I do not zero out this variable, things break
            MOVE ZEROES TO WS-RESULT.
            SET IDX TO 1.
            SEARCH WS-NUM-CAT VARYING IDX
               AT END MOVE 0 TO WS-NUMS
               WHEN WS-CATEGORY = WS-NUM-CAT(IDX)
                  MOVE IDX TO WS-NUMS *> IDX should be equal
                                      *> to the category
            END-SEARCH.

            *> Need to move dice into WS-SORT before sorting
            *> and move them back once sorted.
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
          *> FILTER is a subroutine of MATCH-NUM
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
            *> Must zero out WS-ROLL-STRUCTURE or things break
            MOVE ZEROES TO WS-ROLL-STRUCTURE.
            PERFORM CHECK 5 TIMES.
          *> CHECK is a subroutine of COUNTS
          CHECK.
            IF WS-SINGLE-DIE(MATCH-ID) = WS-SINGLE-DIE(DID)
               THEN SET WS-DIE-STRUCT(SID) UP BY 1
            ELSE
               MOVE DID TO MATCH-ID
               SET SID UP BY 1
               SET WS-DIE-STRUCT(SID) UP BY 1
            END-IF.
            SET DID UP BY 1.

          *> Moving the dice and structs back and forth between WS-SORT
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
          *> SORT-STEP is a subroutine of INSERTION-SORT
          SORT-STEP.
            ADD 1 TO SORT-ID GIVING NEXT-ID.
            MOVE SORT-ID TO SAVE-ID.
            IF WS-SORT-TABLE(NEXT-ID) < WS-SORT-TABLE(SORT-ID)
              THEN PERFORM SWAP
                 UNTIL WS-SORT-TABLE(NEXT-ID) >= WS-SORT-TABLE(SORT-ID)
            MOVE SAVE-ID TO SORT-ID.
          *> SWAP is a subroutine of SORT-STEP
          SWAP.
            MOVE WS-SORT-TABLE(SORT-ID) TO WS-SWAP-TABLE(1).
            MOVE WS-SORT-TABLE(NEXT-ID) TO WS-SWAP-TABLE(2).
            PERFORM SUB-SWAP.
            MOVE WS-SWAP-TABLE(1) TO WS-SORT-TABLE(SORT-ID).
            MOVE WS-SWAP-TABLE(2) TO WS-SORT-TABLE(NEXT-ID).
            SET NEXT-ID DOWN BY 1.
            SET SORT-ID DOWN BY 1.
          *> SUB-SWAP is a subroutine of SWAP
          SUB-SWAP.
            MOVE WS-SWAP-TABLE(1) TO WS-SWAP-TABLE(3).
            MOVE WS-SWAP-TABLE(2) TO WS-SWAP-TABLE(1).
            MOVE WS-SWAP-TABLE(3) TO WS-SWAP-TABLE(2).

          ADD-TO-SCORE.
            ADD WS-SINGLE-DIE(DID) TO WS-RESULT.