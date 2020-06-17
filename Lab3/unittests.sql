-- ###############################################
-- CSE182 - Lab 3
-- general.sql
-- 
-- ###############################################

-- Foriegn Key Tests
INSERT INTO CageVisits
VALUES (1003, 309, '2020-05-02', 'f');

INSERT INTO CageVisits
VALUES (1311, 201, '2020-05-16', 't');

-- Constraint Tests

UPDATE Species
SET animalCount = 0 
WHERE speciesID = 407;

UPDATE Species
SET animalCount = -1
WHERE speciesID = 401;

UPDATE Members
SET expirationDate = CURRENT_DATE
WHERE memberStatus = 'L';

UPDATE Members
SET expirationDate = '1999-08-02'
WHERE memberID = 1001;

UPDATE Keepers
SET keeperSalary = NULL
WHERE keeperID = 1;

UPDATE Keepers
SET keeperLevel = NULL
WHERE keeperSalary > 1000;