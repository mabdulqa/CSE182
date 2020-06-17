/* ##################################################
    CSE182 - Lab4
    File: increaseSomeKeeperSalariesFunction.pgsql

    Purpose: Build stored function for ZooApplication
    java class. 
################################################## */

CREATE FUNCTION increaseSomeKeeperSalariesFunction(
    IN maxIncreaseAmount INTEGER
    ) RETURNS INTEGER AS $$

    
    -- some declarations
    DECLARE addC INTEGER := 30;
    DECLARE addB INTEGER := 20;
    DECLARE addA INTEGER := 10;
    DECLARE total INTEGER := 0;
    DECLARE incr INTEGER;
    DECLARE kl CHAR(1);
    DECLARE ks NUMERIC(7,2);
    DECLARE id INTEGER;

    -- a cursor for the function
    DECLARE q CURSOR FOR (SELECT keeperID, keeperLevel, keeperSalary
                            FROM Keepers
                            WHERE keeperSalary IS NOT NULL
                            AND (keeperLevel = 'A'
                            OR keeperLevel = 'B'
                            OR keeperLevel = 'C')
                            ORDER BY keeperLevel ASC, hiredate ASC);

    -- the actions 
    BEGIN

        -- Now we shall loop
        OPEN q; 
        LOOP
            -- fetch using the cursor
            FETCH q INTO id, kl, ks;
            EXIT WHEN NOT FOUND;

            -- find the increment needed by level
            IF kl = 'A' THEN incr := addA;
            ELSEIF kl = 'B' THEN incr := addB;
            ELSEIF kl = 'C' THEN incr := addC;
            END IF;

            -- now check if we exceed the cap
            IF total + incr > maxIncreaseAmount THEN EXIT; 
            END IF;

            -- if it survives then update!
            UPDATE Keepers
            SET keeperSalary = ks + incr
            WHERE keeperID = id;
            total := total + incr;

        END LOOP;
        CLOSE q;

        -- return total increases
        RETURN total;

    END; $$ 
    
    -- declare language
    LANGUAGE plpgsql;
            
    