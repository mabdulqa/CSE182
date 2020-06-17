/*###############################################
 CSE182 - Lab 3
 queryview.sql
 
###############################################*/

SELECT vcc.speciesID, s.speciesName, s.animalCount, vcc.computedAnimalCount
FROM viewComputedCount vcc, Species s
WHERE s.speciesID = vcc.speciesID
    AND vcc.computedAnimalCount <> s.animalCount;

/* 
-- OUTPUT BEFORE DELETIONS:
 speciesid | speciesname | animalcount | computedanimalcount 
-----------+-------------+-------------+---------------------
       404 | lion        |           2 |                   3
       405 | panther     |           0 |                   4
       407 | small cat   |           2 |                   4
*/

DELETE FROM Animals a
WHERE a.animalID = 10014 OR
    a.animalID = 10015;

SELECT vcc.speciesID, s.speciesName, s.animalCount, vcc.computedAnimalCount
FROM viewComputedCount vcc, Species s
WHERE s.speciesID = vcc.speciesID
    AND vcc.computedAnimalCount <> s.animalCount;

/*
-- OUTPUT AFTER DELETIONS
 speciesid | speciesname | animalcount | computedanimalcount 
-----------+-------------+-------------+---------------------
       401 | tiger       |           4 |                   3
       405 | panther     |           0 |                   4
       407 | small cat   |           2 |                   4
*/