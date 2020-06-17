/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab2
    File: query4.sql
    Goal: Makes a query for Lab2.
*/

-- Query 4: memberID whose name ends in 'th'
--          and vistied a cage with a lion.

SELECT DISTINCT cv.memberID, m.name
FROM Members m, CageVisits cv, Animals a, Species s
WHERE m.name like '%th'
    AND cv.memberID = m.memberID
    AND cv.cageID = a.cageID
    AND a.speciesID = s.speciesID
    AND s.speciesName = 'lion';
