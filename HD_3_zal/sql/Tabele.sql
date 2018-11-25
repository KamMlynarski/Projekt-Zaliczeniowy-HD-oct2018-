CREATE TABLE [DimAirport] (
   [airportsk] int identity(1,1) primary key,
    [iata] nvarchar(50),
    [airport] nvarchar(50),
    [city] nvarchar(50),
    [state] nvarchar(50),
    [country] nvarchar(50),
    [lat] nvarchar(50),
    [long] nvarchar(50)

)
Alter table dbo.DimAirport
Add unique (iata);

CREATE TABLE [DimCarrier] (
    [carriersk] int identity(1,1) primary key,
	[Code] nvarchar(50),
    [Description] nvarchar(999)
)
Alter table dbo.DimCarrier
Add unique (code);

CREATE TABLE [DimPlane] (
    [planesk] int identity(1,1) primary key,
    [tailnum] varchar(50),
    [type] nvarchar(50),
    [manufacturer] nvarchar(50),
    [issue_date] nvarchar(50),
    [model] nvarchar(50),
    [status] nvarchar(50),
    [aircraft_type] nvarchar(50),
    [engine_type] nvarchar(50),
    [year] varchar(50)
)

Alter table dbo.DimPlane
Add unique (tailnum);


create clustered columnstore index CCI 
on dbo.FactFlights
go


create table paczki_all(ID int identity, SciezkaFolderuPaczki varchar(100), NazwaPaczki varchar(50), active bit)
go
insert into paczki_all values('C:\Users\kamil\Desktop\HD2018\HD_3_zal\HD_3_zal','FactFlights.dtsx',1)

insert into paczki_all values('C:\Users\kamil\Desktop\HD2018\HD_3_zal\HD_3_zal','DimPlane.dtsx',1)

insert into paczki_all values('C:\Users\kamil\Desktop\HD2018\HD_3_zal\HD_3_zal','DimDate.dtsx',1)

insert into paczki_all values('C:\Users\kamil\Desktop\HD2018\HD_3_zal\HD_3_zal','DimCarrier.dtsx',1)

insert into paczki_all values('C:\Users\kamil\Desktop\HD2018\HD_3_zal\HD_3_zal','DimAirport.dtsx',1)
go

select SciezkaFolderuPaczki, NazwaPaczki from paczki_all where Active=1


Create table Logs(ID INT IDENTITY,
 Step varchar(200), 
 NazwaPaczki varchar(200), 
 Daty datetime)
 go
 insert into Logs values('Start Paczki','ChildPkg1.dstx', getdate())
 go


 select * from Logs