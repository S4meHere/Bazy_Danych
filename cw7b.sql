-- Utworzenie funkcji wykonuj¹cej ci¹g fibonacciego

CREATE OR ALTER FUNCTION Fibonacci(@n INT)
RETURNS @tabela TABLE(wartosc INT)
AS
BEGIN 
    DECLARE @n0 INT = 0
    DECLARE @n1 INT = 1
    DECLARE @i INT = 0

    INSERT INTO @tabela VALUES(@n0),(@n1)

	-- Pêtla obs³uguj¹ca wykonywanie ci¹gu Fibonacciego
    WHILE (@i <= @n-2)
    BEGIN
            INSERT INTO @tabela VALUES(@n1 + @n0)
            SET @n1 = @n1 + @n0
            SET @n0 = @n1 - @n0
            SET @i += 1
        END
RETURN

END;

-- Batch separator
GO

-- Utworzenie procedury wywo³uj¹cej funkcjê wykonuj¹c¹ ci¹g fibonacciego
CREATE OR ALTER PROCEDURE Fibonacci_procedura(@n INT)
AS 
BEGIN
    SELECT * FROM cw7b.dbo.Fibonacci(@n)
END;

-- Batch separator
GO


DECLARE @liczba INT;
SET @liczba = 14;

-- Wywo³anie procedury z zadan¹ liczb¹ + 1
EXECUTE Fibonacci_procedura @liczba;