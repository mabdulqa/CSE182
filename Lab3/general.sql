/*###############################################
 CSE182 - Lab 3
 general.sql
 
###############################################*/
ALTER TABLE Species
ADD CONSTRAINT minAnimalCount 
    CHECK(animalCount >= 0);

ALTER TABLE Members
ADD CONSTRAINT timeline
    CHECK(joinDate <= expirationDate);

ALTER TABLE Keepers
ADD CONSTRAINT salaryAndLevel
    CHECK((keeperLevel IS NULL AND keeperSalary IS NULL) 
        OR (keeperLevel IS NOT NULL AND keeperSalary IS NULL)
        OR (keeperLevel IS NOT NULL AND keeperSalary IS NOT NULL)
    );