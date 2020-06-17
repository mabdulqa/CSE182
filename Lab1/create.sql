/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab1
    File: create.sql
    Goal: Makes the schema and tables for Lab1
*/

-- clear the previous Lab1 schema and insert new one
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;



-- Keepers table
CREATE TABLE Keepers(
    keeperID INT,
    name VARCHAR(30),
    hireDate DATE,
    keeperLevel CHAR(1),
    keeperSalary NUMERIC(7, 2),

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (keeperID)
);

-- Cages table
CREATE TABLE Cages(
    cageID INT,
    cageSector CHAR(1),
    keeperID INT,

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (cageID),
    FOREIGN KEY (keeperID) REFERENCES Keepers
);

-- Species table
CREATE TABLE Species(
    speciesID INT,
    speciesName VARCHAR(40),
    genus VARCHAR(40),
    animalCount INT,

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (speciesID)
);

-- Animals table
CREATE TABLE Animals(
    animalID INT,
    name VARCHAR(30),
    speciesID INT,
    animalAge INT,
    cageID INT,

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (animalID),
    FOREIGN KEY (speciesID) REFERENCES Species,
    FOREIGN KEY (cageID) REFERENCES Cages
);

-- Members table
CREATE TABLE Members(
    memberID INT,
    name VARCHAR(30),
    address VARCHAR(40),
    memberStatus CHAR(1),
    joinDate DATE,
    expirationDate DATE,

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (memberID)
);

-- CageVisits table
CREATE TABLE CageVisits(
    memberID INT,
    cageID INT,
    visitDate DATE,
    likedVisit boolean,

    -- identifies primary key and 
    -- foriegn keys in table
    PRIMARY KEY (memberID , cageID, visitDate),
    FOREIGN KEY (memberID) REFERENCES Members,
    FOREIGN KEY (cageID) REFERENCES Cages
);



