/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab2
    File: query1.sql
    Goal: Makes a query for Lab2.
*/

-- Query 1: find all ID of animals in 
--          north sector of zoo.

SELECT DISTINCT a.animalID 
FROM Animals a, Cages c 
WHERE a.cageID = c.cageID 
    AND c.cageSector = 'N';