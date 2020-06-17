/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab2
    File: query3.sql
    Goal: Makes a query for Lab2.
*/

-- Query 3: Output keeperID, name, and salary
--          that own cages that have a lion and a
--          tiger.


-- second outer query gets keepers data given a cageID
-- first inner query gets all cageIDs that have a lion and tiger

SELECT DISTINCT k.keeperID, k.name, k.keeperSalary
FROM species s1, species s2, Animals a1, Animals a2, Cages c, Keepers k 
WHERE (s1.speciesName = 'lion' AND s2.speciesName = 'tiger')
    AND s1.speciesID = a1.speciesID
    AND s2.speciesID = a2.speciesID
    AND a1.cageID = a2.cageID
    AND a2.cageID = c.cageID
    AND c.keeperID = k.keeperID
ORDER BY k.keeperSalary DESC;