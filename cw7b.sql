-- Utworzenie funkcji wykonuj�cej ci�g fibonacciego

CREATE OR ALTER FUNCTION Fibonacci(@n INT)
RETURNS @tabela TABLE(wartosc INT)
AS
BEGIN 
    DECLARE @n0 INT = 0
    DECLARE @n1 INT = 1
    DECLARE @i INT = 0

    INSERT INTO @tabela VALUES(@n0),(@n1)

	-- P�tla obs�uguj�ca wykonywanie ci�gu Fibonacciego
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

-- Utworzenie procedury wywo�uj�cej funkcj� wykonuj�c� ci�g fibonacciego
CREATE OR ALTER PROCEDURE Fibonacci_procedura(@n INT)
AS 
BEGIN
    SELECT * FROM cw7b.dbo.Fibonacci(@n)
END;

-- Batch separator
GO


DECLARE @liczba INT;
SET @liczba = 14;

-- Wywo�anie procedury z zadan� liczb� + 1
EXECUTE Fibonacci_procedura @liczba;