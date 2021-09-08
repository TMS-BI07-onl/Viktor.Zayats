
USE [SwimmingCompetitionZayats]

CREATE TABLE Judges							
(
	JudgeID INT IDENTITY,
	CompetitionID INT,
	PassportNumber NVARCHAR(20) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,		
	SwimStile NVARCHAR(30),
	Rank NVARCHAR(20),
	TypesOfOfficial NVARCHAR(30),
	CONSTRAINT PK_Judge_JudgeID PRIMARY KEY (JudgeID),
	CONSTRAINT UQ_Judge_Passport_Number UNIQUE (PassportNumber),
	CONSTRAINT FK_Judge_To_Competition FOREIGN KEY (CompetitionID) REFERENCES Competitions (CompetitionID)
);


CREATE TABLE Teams
(
	TeamID INT IDENTITY,
	Captain NVARCHAR(50) NOT NULL,
	MembersNumber INT NOT NULL,
	Country NVARCHAR(30),
	TeamName NVARCHAR(30) NOT NULL,
	TeamDate DATE,
	CONSTRAINT PK_Team_ID PRIMARY KEY (TeamID)
);



CREATE TABLE Swimmers
(
	SwimmerID INT IDENTITY,
	TrainerID INT,
	PassportNumber NVARCHAR(20) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Birthday DATE NOT NULL,
	Gender NVARCHAR(1) NOT NULL,
	Rank NVARCHAR(10),
	CONSTRAINT PK_Swimmer_ID PRIMARY KEY (SwimmerID),
	CONSTRAINT UQ_Swimmer_Passport_Number UNIQUE (PassportNumber),
	CONSTRAINT FK_Swimmer_To_Trainer FOREIGN KEY (TrainerID) REFERENCES Trainers (TrainerID)				
);



CREATE TABLE Trainers
(
	TrainerID INT IDENTITY,
	PassportNumber NVARCHAR(20) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Rank NVARCHAR(10),
	CONSTRAINT PK_Trainer_ID PRIMARY KEY (TrainerID),
	CONSTRAINT UQ_Trainer_Passport_Number UNIQUE (PassportNumber)			
);




CREATE TABLE Locations								
(
	LocationID INT IDENTITY,
	LocationName NVARCHAR(50) NOT NULL,
	CityName NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Location_ID PRIMARY KEY (LocationID)
);





CREATE TABLE Competitions
(
	CompetitionID INT IDENTITY,
	SwimmerID INT NOT NULL,
	LocationID INT NOT NULL,
	JudgeID INT NOT NULL,
	ResultTime TIME NOT NULL,
	Date DATETIME NOT NULL,
	CONSTRAINT PK_Competition_ID PRIMARY KEY (CompetitionID),
	CONSTRAINT FK_Competition_To_Swimmer FOREIGN KEY (SwimmerID) REFERENCES Swimmers (SwimmerID),			
	CONSTRAINT FK_Competition_To_Location FOREIGN KEY (LocationID) REFERENCES Locations (LocationID)			
);






CREATE TABLE Bridge_Swimmer_Team						
(
	SwimmerID INT NOT NULL,
	TeamID INT NOT NULL,
	CONSTRAINT FK_Bridge_Swimmer_Team FOREIGN KEY (SwimmerID) REFERENCES Swimmers (SwimmerID),
	CONSTRAINT FK_Bridge_Team_Swimmer FOREIGN KEY (TeamID) REFERENCES Teams (TeamID)
);


