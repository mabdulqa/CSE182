/*###############################################
 CSE182 - Lab 3
 createview.sql
 
###############################################*/

CREATE VIEW viewComputedCount AS
SELECT a.speciesID, COUNT(a.animalID) AS computedAnimalCount
FROM Animals a
GROUP BY a.speciesID
HAVING (COUNT(a.animalID) >= 3);

