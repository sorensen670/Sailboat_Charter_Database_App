--Group F Testing Statements
--IS 443 Fall 2020
-- Mike Sorensen, Nate Maack, Derrick Ostlie

--Trigger #1 testing statements

--Will allow insert
INSERT INTO Charter VALUES('H005','B004','C004','1-December-2020','10-December-2020',
null,20,9000,3302.94,19800);

--Will not allow insert
INSERT INTO Charter VALUES('H005','B005','C004','1-December-2020','10-December-2020',
null,20,9000,3302.94,19800);


--Trigger #3 testing statements

--Will allow insert
INSERT INTO Charter VALUES('H006','B001','C004','1-December-2020','10-December-2020',
null,20,9000,3302.94,19800);

--Will not allow insert
INSERT INTO Charter VALUES('H006','B001','C003','1-December-2020','10-December-2020',
null,20,9000,3302.94,19800);


--Trigger #2 Testing statements

-- Will update Tommy's (C001) balance from 300.45 to 375.45
    UPDATE Charter
    SET Actual_Return = '23-December-2020'
    WHERE Charter_ID = 'H004';

--Will update Marge's (C004) balance to remain at zero
    UPDATE Charter
    SET Actual_Return = '12-July-2020'
    WHERE Charter_ID = 'H003';

--Will update Ricky Bobby's (C002) balance to 959.99
    UPDATE Charter
    SET Actual_Return = '08-June-2020'
    WHERE Charter_ID = 'H001';
