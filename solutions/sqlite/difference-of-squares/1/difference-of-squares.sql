-- Schema: CREATE TABLE "difference-of-squares" ("number" INT", property" TEXT, "result" INT);
-- Task: update the difference-of-squares table and set the result based on the number and property fields.
WITH RECURSIVE Nums AS (
    SELECT 1 AS To100, 1 AS Squares
    UNION ALL
    SELECT To100 + 1, POWER(To100 + 1, 2) FROM Nums
    LIMIT 100
)
UPDATE "difference-of-squares"
    SET result =
    CASE
        WHEN property = "squareOfSum"
            THEN POWER((SELECT SUM(To100) 
                    FROM Nums WHERE To100 <= "number"), 2)
        WHEN property = "sumOfSquares"
            THEN (SELECT SUM(Squares) FROM Nums WHERE To100 <= "number")
        WHEN property = "differenceOfSquares"
            THEN POWER((SELECT SUM(To100) FROM Nums WHERE To100 <= "number"), 2) 
                - (SELECT SUM(Squares) FROM Nums WHERE To100 <= "number")
    END