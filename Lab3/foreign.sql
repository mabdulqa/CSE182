/*###############################################
 CSE182 - Lab 3
 foreign.sql
 
###############################################*/

ALTER TABLE CageVisits
ADD FOREIGN KEY (cageID) 
REFERENCES Cages(cageID);

ALTER TABLE CageVisits
ADD FOREIGN KEY (memberID) 
REFERENCES Members(memberID)
ON DELETE CASCADE
ON UPDATE CASCADE;