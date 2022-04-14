----QUERY 1-----

CREATE PROCEDURE usp_BuyTicket (@HallId int, @SessionId int, @FilmId int, @CustomerId int)
AS
IF EXISTS (SELECT * FROM InsertTickets WHERE HallId=@HallId and SessionId=@SessionId and FilmId=@FilmId and CustomerId=@CustomerId)
BEGIN
	PRINT 'Place is full'
END 
ELSE
	INSERT INTO InsertTickets(HallId,SessionId,FilmId,CustomerId)
	VALUES(@HallId,@SessionId,@FilmId,@CustomerId)


EXEC usp_BuyTicket 1,2,3,4

SELECT * FROM InsertTickets

----QUERY 2-----

ALTER FUNCTION dbo.GetEmptySeat (@HallId int, @SessionId int)
RETURNS INT 
AS 
BEGIN
	DECLARE @SeatCount int
	SELECT @SeatCount = Halls.SeatCount - COUNT (Sessionss.Id) FROM InsertTickets
JOIN Halls
ON InsertTickets.HallId = Halls.Id
JOIN Sessionss
ON InsertTickets.SessionId = Sessionss.Id
GROUP BY Halls.SeatCount, Sessionss.Id
RETURN @SeatCount
END


SELECT dbo.GetEmptySeat (2,2)