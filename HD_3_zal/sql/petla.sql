USE ProjketHD3;

CREATE TABLE dbo.DimDate1 (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Dzien DATE
);

DECLARE @Dzien_Start AS DATE = '2007-01-01'
DECLARE @Dzien_Koniec AS DATE = '2008-06-22'

WHILE (@Dzien_Start< @Dzien_Koniec)
BEGIN
	INSERT INTO dbo.DimDate1 (Dzien)
	VALUES (@Dzien_Start);
	SET @Dzien_Start = DATEADD(DAY,1,@Dzien_Start)
END








SELECT * FROM dbo.DimDate1;


