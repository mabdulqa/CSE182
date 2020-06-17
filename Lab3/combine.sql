-- ###############################################
-- CSE182 - Lab 3
-- combine.sql
-- 
-- ###############################################

BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE Animals a
SET speciesID = c.speciesID, cageID = c.cageID
FROM AnimalChanges c
WHERE c.animalID = a.animalID;

INSERT INTO Animals(animalID, speciesID, cageID)
SELECT c.animalID, c.speciesID, c.cageID
FROM AnimalChanges c
WHERE NOT EXISTS(SELECT a.animalID, a.speciesID, a.cageID 
                FROM Animals a
                WHERE a.animalID = c.animalID);


