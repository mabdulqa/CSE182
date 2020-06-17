/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab2
    File: query5.sql
    Goal: Makes a query for Lab2.
*/

-- Query 5: output animalID, cageID, age, keeperID, and hiredate
--          for all animals that satisfy the following requirements
--          1. animal species name has an 'a'
--          2. genus for animal is not null
--          3. keeper was hired between Jan 2, 2019 - Dec 30, 2019
--          4. somebody vistied the cage and didn't like visitdate

SELECT DISTINCT a.animalID as theAnimalID, 
    a.cageID as theCageID, a.animalAge as theAge, 
    k.keeperID as theKeeperID, k.hireDate as theHireDate
FROM Animals a, Keepers k, Cagevisits cv, Species s, Cages c
WHERE a.speciesID = s.speciesID
    AND s.speciesName like '%a%'
    AND s.genus IS NOT NULL
    AND a.cageID = cv.cageID 
    AND NOT cv.likedVisit
    AND a.cageID = c.cageID
    AND c.keeperID = k.keeperID
    AND k.hireDate BETWEEN '2019/01/02' AND '2019/12/30';