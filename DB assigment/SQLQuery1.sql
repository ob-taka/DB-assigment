CREATE DATABASE DB_Assigment

CREATE TABLE Customer 
(
  CustID         char(9)         NOT NULL,
  CustName         varchar (50)     NOT NULL,
  Gender         char (1)         NOT NULL CHECK (Gender IN ('M', 'F')),
  CONSTRAINT PK_Cust PRIMARY KEY NONCLUSTERED (CustID),
)

CREATE TABLE Passenger  
(
  CustID         char(9)      NOT NULL,
  BookingNo     varchar (10) NOT NULL,
  Age            tinyint         NOT NULL,
  Nationality   varchar(20)  NOT NULL,
  PsssportNO    varchar(20)  NOT NULL,
  PassportExpiry smalldatetime     NOT NULL,
  PricePaid         smallmoney  NOT NULL
  CONSTRAINT PK_Passenger PRIMARY KEY NONCLUSTERED (CustID, BookingNo),
  /*CONSTRAINT FK_Passenger_CustID FOREIGN KEY (CustID,BookingNo) REFERENCES
  dbo.Customer (CustID) dbo.Booking(BookingNo)*/
)

CREATE TABLE Organiser
(
  CustID        char(9)         NOT NULL,
  CustContact   char(10)     NOT NULL,
  CustEmail        varchar(50)  NOT NULL,
  CONSTRAINT FK_Customer FOREIGN KEY (CustID) REFERENCES
  dbo.Customer(CustID)
)

CREATE TABLE Itinerary
(
	ItineraryNo char(5) primary key,
	Duration smalldatetime not null,
	ItineraryDesc varchar(100) not null,
)

CREATE TABLE Country
(
	CountryCode char(4) primary key,
	CountryDesc varchar(100) Null,
)

CREATE TABLE City
(
	CityCode char(4) primary key,
	CityDesc varchar(100) Null,
	CountryCode char(4) Null FOREIGN KEY REFERENCES Country(CountryCode),
	--CONSTRAINT FK_CountryCode FOREIGN KEY(CountryCode) REFERENCES Country(CountryCode),
)

CREATE TABLE Site
(
	SiteID char(5) primary key,
	SiteDesc varchar(100) not null,
	CityCode char(4) not null FOREIGN KEY REFERENCES City(CityCode)
)

CREATE TABLE Visit
(
	ItineraryNo char(5) not null FOREIGN KEY REFERENCES Itinerary(ItineraryNo),
	SiteID char (5) not null FOREIGN KEY REFERENCES Site(SiteID),
	CONSTRAINT PK_Visit PRIMARY KEY (ItineraryNo, SiteID)
) 

CREATE TABLE Staff 
(
  StaffID         smallint         ,
  StaffName     varchar (50)     NOT NULL,
  CONSTRAINT PK_Staff PRIMARY KEY NONCLUSTERED (StaffID),
)


/* Table: dbo.StaffContactInfo     */
CREATE TABLE StaffContactInfo 
(
  StaffID         smallint  ,
  StaffContact         char (10),
  CONSTRAINT PK_StaffContactInfo PRIMARY KEY NONCLUSTERED (StaffID,StaffContact),
  CONSTRAINT FK_StaffContactInfo_StaffID FOREIGN KEY (StaffID) REFERENCES
  dbo.Staff(StaffID)
)

/* Table: dbo.TourLeader     */
CREATE TABLE TourLeader 
(
  StaffID         smallint         ,
  LicenceExpiry smalldatetime     NOT NULL,
  LicenceNo        char(10)        NOT NULL,
  CONSTRAINT PK_TourLeader PRIMARY KEY NONCLUSTERED (StaffID),
  CONSTRAINT FK_TourLeader_StaffID FOREIGN KEY (StaffID) REFERENCES
  dbo.Staff(StaffID)
)

/* Table: dbo.TravelAdvisor     */
CREATE TABLE TravelAdvisor 
(
  StaffID         smallint         ,
  CONSTRAINT PK_TravelAdvisor PRIMARY KEY NONCLUSTERED (StaffID),
  CONSTRAINT FK_TravelAdvisor FOREIGN KEY (StaffID) REFERENCES
  dbo.Staff(StaffID)
)

CREATE TABLE Hotel
(
  HotelID char(6) PRIMARY KEY NOT NULL,
  HotelName     varchar (30) NOT NULL,
  HotelCategory varchar(6) CHECK(HotelCategory LIKE '[1-7]-star') NOT NULL
)

/* Table: dbo.Flight */
CREATE TABLE Flight
(
  FlightNo char(10) PRIMARY KEY NOT NULL,
  Airline       varchar (30) NOT NULL,
  Origin        varchar (30) NOT NULL,
  Destination   varchar (30)  NOT NULL,
  FlightTime    smalldatetime NOT NULL
)




