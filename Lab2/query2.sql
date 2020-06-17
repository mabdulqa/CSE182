/* 
    Name: Mohammad Abdulqader - CSE182
    Assignment: Lab2
    File: query2.sql
    Goal: Makes a query for Lab2.
*/

-- Query 2: Output (name, address, cageID) for 
--          every time a memeber visted the cage
--          and liked the visit.

SELECT m.name, m.address, cv.cageID 
FROM CageVisits cv, Members m 
WHERE cv.memberID = m.memberID 
    AND cv.likedVisit;