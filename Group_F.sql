--Script file Group F Project




--Drop tables in case they were created previously

DROP TABLE Boat cascade constraints;
DROP TABLE Owner cascade constraints;
DROP TABLE Equipment cascade constraints;
DROP TABLE Customer cascade constraints;
DROP TABLE Personnel cascade constraints;
DROP TABLE Charter cascade constraints;
DROP TABLE Repair_Facilities cascade constraints;
DROP TABLE Maintenance cascade constraints;
DROP TABLE Log cascade constraints;
DROP TABLE Boat_Owner cascade constraints;
DROP TABLE Equip_Owner cascade constraints;
DROP TABLE Charter_Equip cascade constraints;
DROP TABLE Charter_Personnel cascade constraints;

--Create Boat table
CREATE TABLE Boat(
  Boat_ID VARCHAR2(4) CONSTRAINT Boat_PK Primary Key,
  Availability VARCHAR2(3),
  Boat_Name VARCHAR2(16),
  Boat_Make VARCHAR2(15),
  Boat_Length NUMBER(6),
  Boat_Class CHAR(1));

--Create Owner table
CREATE TABLE Owner(
  Owner_ID VARCHAR2(4) CONSTRAINT Owner_PK Primary Key,
  Owner_LName VARCHAR2(15),
  Owner_FName VARCHAR2(15),
  Owner_City VARCHAR2(15));

--Create Equipment table
CREATE TABLE Equipment(
  Equip_ID VARCHAR2(3) CONSTRAINT Equipment_PK Primary Key,
  Equip_Description VARCHAR2(20),
  Equip_Cost NUMBER(7,2));

--Create Customer table
CREATE TABLE Customer(
  Customer_ID VARCHAR2(4) CONSTRAINT Customer_PK Primary Key,
  Cus_LName VARCHAR2(15),
  Cus_FName VARCHAR2(15),
  Cus_Experience VARCHAR2(15),
  Cus_City VARCHAR2(15),
  Cus_Balance NUMBER(5,2));

--Create Personnel table
CREATE TABLE Personnel(
  Personnel_ID VARCHAR2(4) CONSTRAINT Personnel_PK Primary Key,
  Job_Title VARCHAR2(15),
  Hrly_Rate NUMBER(4,2),
  Personnel_FName VARCHAR2(15),
  Personnel_LName VARCHAR2(15));

--Create Charter Table
CREATE TABLE Charter(
  Charter_ID VARCHAR2(6) CONSTRAINT Charter_PK Primary Key,
  Boat_ID VARCHAR2(4),
  Customer_ID VARCHAR2(4),
  Departure_Date DATE,
  Expected_Return DATE,
  Actual_Return DATE,
  Party_Size NUMBER (2),
  Boat_Cost NUMBER (6,2),
  Equip_Cost NUMBER (6,2),
  Personnel_Cost NUMBER (7,2),

  CONSTRAINT Charter_FK1 FOREIGN KEY(Boat_ID) REFERENCES Boat(Boat_ID),
  CONSTRAINT Charter_FK2 FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID));

--Create Repair facilities table

CREATE TABLE Repair_Facilities(
  Facility_ID VARCHAR2(4),
  Facility_Name VARCHAR2(35),
  Facility_Loc VARCHAR2(35),
  Quality_of_Service VARCHAR2(15),

   CONSTRAINT Repair_Facilities_PK PRIMARY KEY (Facility_ID));

 --Create Maintenance Table

CREATE TABLE Maintenance(
  Maintenance_ID VARCHAR2(6),
  Boat_ID VARCHAR2(4),
  Facility_ID VARCHAR2(4),
  Maintenance_Item VARCHAR2(15),
  Scheduled_Date DATE,
  Complete_Date DATE,
  Maintenance_Cost NUMBER(8,2),

  CONSTRAINT Maintenance_PK PRIMARY KEY (Maintenance_ID),
  CONSTRAINT Maintenance_FK1 FOREIGN KEY (Boat_ID) REFERENCES Boat(Boat_ID),
  CONSTRAINT Maintenance_FK2 FOREIGN KEY (Facility_ID) REFERENCES Repair_Facilities(Facility_ID));

--Create Log Table

CREATE TABLE Log(
  Charter_ID VARCHAR2(6),
  Entry_Num Number(6),
  Departing_From VARCHAR2(15),
  Sailing_Destination VARCHAR2(15),
  Entry_Date DATE,
  Weather VARCHAR2(30),

  CONSTRAINT Log_PK PRIMARY KEY (Charter_ID,Entry_Num),
  CONSTRAINT Log_FK1 FOREIGN KEY(Charter_ID) REFERENCES Charter(Charter_ID));

--Create Boat_Owner Table

CREATE TABLE Boat_Owner(
  Owner_ID VARCHAR2(4),
  Boat_ID VARCHAR2(4),

  CONSTRAINT Boat_Owner_PK PRIMARY KEY (Owner_ID,Boat_ID),
  CONSTRAINT Boat_Owner_FK1 FOREIGN KEY(Owner_ID) REFERENCES Owner(Owner_ID),
  CONSTRAINT Boat_Owner_FK2 FOREIGN KEY(Boat_ID) REFERENCES Boat(Boat_ID));

--Create Equip_Owner Table

CREATE TABLE Equip_Owner(
  Owner_ID VARCHAR2(4),
  Equip_ID VARCHAR2(3),

  CONSTRAINT Equip_Owner_PK PRIMARY KEY (Owner_ID,Equip_ID),
  CONSTRAINT Equip_Owner_FK1 FOREIGN KEY(Owner_ID) REFERENCES Owner(Owner_ID),
  CONSTRAINT Equip_Owner_FK2 FOREIGN KEY(Equip_ID) REFERENCES Equipment(Equip_ID));

--Create Charter_Equip Table

CREATE TABLE Charter_Equip(
 Charter_ID VARCHAR2(6),
 Equip_ID VARCHAR2(3),

 CONSTRAINT Charter_Equip_PK PRIMARY KEY (Charter_ID,Equip_ID),
 CONSTRAINT Charter_Equip_FK1 FOREIGN KEY(Charter_ID) REFERENCES Charter(Charter_ID),
 CONSTRAINT Charter_Equip_FK2 FOREIGN KEY(Equip_ID) REFERENCES Equipment(Equip_ID));

--Create Charter_Personnel Table

CREATE TABLE Charter_Personnel(
 Charter_ID VARCHAR2(6),
 Personnel_ID VARCHAR2(4),
 Hours_Worked NUMBER (3),

 CONSTRAINT Charter_Personnel_PK PRIMARY KEY (Charter_ID,Personnel_ID),
 CONSTRAINT Charter_Personnel_FK1 FOREIGN KEY(Charter_ID) REFERENCES Charter(Charter_ID),
 CONSTRAINT Charter_Personnel_FK2 FOREIGN KEY(Personnel_ID) REFERENCES Personnel(Personnel_ID));

--Insert records into Boat table

INSERT INTO Boat VALUES('B001','Yes','Boaty McBoatFace','Hallberg-Rassy',44,'L');
INSERT INTO Boat VALUES('B002','No','Mayday Mayday','Amel Swan',28,'S');
INSERT INTO Boat VALUES('B003','No','Tax Seavation','Beneteau',36,'M');
INSERT INTO Boat VALUES('B004','Yes','Tuition Fund','Hinckley',34,'M');
INSERT INTO Boat VALUES('B005','No','Messing About','Oyster',40,'L');

--Insert records into Owner table

INSERT INTO Owner VALUES('W001','Pete','Toothless','Whynot');
INSERT INTO Owner VALUES('W002','Dave','Thunder','Cut and Shoot');
INSERT INTO Owner VALUES('W003','Waters','Sadie','Canadian');
INSERT INTO Owner VALUES('W004','McStubby','Joy','Uncertain');
INSERT INTO Owner VALUES('W005','Two-Toe','Moonie','Briny Breezes');

--Insert records into Equipment table

INSERT INTO Equipment VALUES('E01','Life jackets',100.99);
INSERT INTO Equipment VALUES('E02','Throwable flotation',130.99);
INSERT INTO Equipment VALUES('E03','Fire extinguishers',24.99);
INSERT INTO Equipment VALUES('E04','Visual signaling',89.95);
INSERT INTO Equipment VALUES('E05','Sound signaling',258.38);

--Insert records into Customer table

INSERT INTO Customer VALUES('C001','Wiseau','Tommy','Expert','San Francisco',300.45);
INSERT INTO Customer VALUES('C002','Bobby','Ricky','Beinner','Talladega',999.99);
INSERT INTO Customer VALUES('C003','Montana','Tony','Advanced','Santa Barbara',499.99);
INSERT INTO Customer VALUES('C004','Gunderson','Marge','Beginner','Fargo',0);
INSERT INTO Customer VALUES('C005','Sobchak','Walter','Intermediate','Los Angeles',200.99);

--Insert records into Personnel table

INSERT INTO Personnel VALUES('P001','Captin',75,'Jack','Sparrow');
INSERT INTO Personnel VALUES('P002','Crew',25.75,'Mr.','Smee');
INSERT INTO Personnel VALUES('P003','Crew',25,'Dominic','Toretto');
INSERT INTO Personnel VALUES('P004','Captin',75,'James','Kirk');
INSERT INTO Personnel VALUES('P005','Crew',25.50,'Walter','White');

--Insert records into Charter table

INSERT INTO Charter VALUES('H001','B001','C002','01-June-2020','10-June-2020',
'11-June-2020',20,9000,3302.94,19800);

INSERT INTO Charter VALUES('H002','B002','C005','30-June-2020','05-July-2020',
'05-July-2020',2,1000,1485.12,0);

INSERT INTO Charter VALUES('H003','B003','C004','04-July-2020','12-July-2020',
'11-July-2020',10,4500,2293.04,4800);

INSERT INTO Charter VALUES('H004','B005','C001','12-December-2020','22-December-2020'
,Null,15,9000,3302.94,0);

-- Insert records into Repair_Facilities table

INSERT INTO Repair_Facilities VALUES('R001','Florida Marine Mechanics Inc.','Fort Lauderdale','Acceptable');
INSERT INTO Repair_Facilities VALUES('R002','Miami Boat Repair','Miami','Appropriate');
INSERT INTO Repair_Facilities VALUES('R003','Quality Boats and Marine Repair','Freeport','Appropriate');
INSERT INTO Repair_Facilities VALUES('R004','XYZ Boat Repair','Havana','Aspirational');

-- Insert records into Maitenance table

INSERT INTO Maintenance VALUES('M001','B001','R003','Boom','04-April-2020','16-April-2020',6000);
INSERT INTO Maintenance VALUES('M002','B002','R002','Deck','14-August-2020','01-September-2020',9000);
INSERT INTO Maintenance VALUES('M003','B003','R001','Mast','23-November-2020','10-December-2020',10000);
INSERT INTO Maintenance VALUES('M004','B001','R002','Mainsail','12-September-2020','30-September-2020',10000);

--Insert records into Log table

INSERT INTO Log VALUES('H001',321231,'Key West','Freeport','01-April-2020','Sunny');
INSERT INTO Log VALUES('H002',321232,'Miami','The Bahamas','01-July-2019','Partly Sunny');
INSERT INTO Log VALUES('H003',321233,'Fort Lauderdale','Nassau','15-January-2020','Rainy');
INSERT INTO Log VALUES('H004',321234,'Key West','Havana','27-December-2020','Sunny');

--Insert records into Boat_Owner table

INSERT INTO Boat_Owner VALUES('W001','B001');
INSERT INTO Boat_Owner VALUES('W002','B002');
INSERT INTO Boat_Owner VALUES('W003','B003');
INSERT INTO Boat_Owner VALUES('W004','B004');
INSERT INTO Boat_Owner VALUES('W004','B005');

--Insert records into Equip_Owner table

INSERT INTO Equip_Owner VALUES('W001','E01');
INSERT INTO Equip_Owner VALUES('W001','E02');
INSERT INTO Equip_Owner VALUES('W001','E03');
INSERT INTO Equip_Owner VALUES('W001','E04');
INSERT INTO Equip_Owner VALUES('W001','E05');
INSERT INTO Equip_Owner VALUES('W002','E01');
INSERT INTO Equip_Owner VALUES('W002','E02');
INSERT INTO Equip_Owner VALUES('W002','E03');
INSERT INTO Equip_Owner VALUES('W002','E04');
INSERT INTO Equip_Owner VALUES('W002','E05');
INSERT INTO Equip_Owner VALUES('W003','E01');
INSERT INTO Equip_Owner VALUES('W003','E02');
INSERT INTO Equip_Owner VALUES('W003','E03');
INSERT INTO Equip_Owner VALUES('W003','E04');
INSERT INTO Equip_Owner VALUES('W003','E05');
INSERT INTO Equip_Owner VALUES('W004','E01');
INSERT INTO Equip_Owner VALUES('W004','E02');
INSERT INTO Equip_Owner VALUES('W004','E03');
INSERT INTO Equip_Owner VALUES('W004','E04');
INSERT INTO Equip_Owner VALUES('W004','E05');
INSERT INTO Equip_Owner VALUES('W005','E01');
INSERT INTO Equip_Owner VALUES('W005','E02');
INSERT INTO Equip_Owner VALUES('W005','E03');
INSERT INTO Equip_Owner VALUES('W005','E04');
INSERT INTO Equip_Owner VALUES('W005','E05');

--Insert records into Charter_Equip table

INSERT INTO Charter_Equip VALUES('H001','E01');
INSERT INTO Charter_Equip VALUES('H001','E02');
INSERT INTO Charter_Equip VALUES('H001','E03');
INSERT INTO Charter_Equip VALUES('H001','E04');
INSERT INTO Charter_Equip VALUES('H001','E05');
INSERT INTO Charter_Equip VALUES('H002','E01');
INSERT INTO Charter_Equip VALUES('H002','E02');
INSERT INTO Charter_Equip VALUES('H002','E03');
INSERT INTO Charter_Equip VALUES('H002','E04');
INSERT INTO Charter_Equip VALUES('H002','E05');
INSERT INTO Charter_Equip VALUES('H003','E01');
INSERT INTO Charter_Equip VALUES('H003','E02');
INSERT INTO Charter_Equip VALUES('H003','E03');
INSERT INTO Charter_Equip VALUES('H003','E04');
INSERT INTO Charter_Equip VALUES('H003','E05');
INSERT INTO Charter_Equip VALUES('H004','E01');
INSERT INTO Charter_Equip VALUES('H004','E02');
INSERT INTO Charter_Equip VALUES('H004','E03');
INSERT INTO Charter_Equip VALUES('H004','E04');
INSERT INTO Charter_Equip VALUES('H004','E05');

--Insert records into Charter_Personnel

INSERT INTO Charter_Personnel VALUES('H001','P004',10);
INSERT INTO Charter_Personnel VALUES('H003','P003',4);

COMMIT;



--Trigger #1 Prevent overbooking

CREATE OR REPLACE TRIGGER OverBook
BEFORE INSERT ON Charter
FOR EACH ROW
DECLARE
 Boat_Available CHAR(3);
BEGIN
 Select Boat.Availability
 Into Boat_Available
 From Boat
 Where Boat_ID =: new.Boat_ID;
 IF Boat_Available = 'No' THEN
    Raise_application_error(-20201, 'This boat is currently unavailable');
 END IF;
END;
/


--Trigger #3 No boat rental is allowed if a customer's unpaid balance eceeds $400

CREATE OR REPLACE TRIGGER CustBal
BEFORE INSERT ON Charter
FOR EACH ROW
DECLARE
 C_Balance BINARY_FLOAT;
BEGIN
 Select Cus_Balance
 Into C_Balance
 From Customer
 Where Customer_ID = :new.Customer_ID;
 IF C_Balance > 400 THEN
    Raise_application_error(-20203, 'Pay balance before leasing');
 END IF;
END;
/

--Trigger #2 Calculate late fee or refund

CREATE OR REPLACE TRIGGER Cal_Fee_Refund
AFTER UPDATE OF Actual_Return ON Charter
FOR EACH ROW
DECLARE
Cus_ID VARCHAR2(4);
DAYS_LATE_EARLY NUMBER(3);
BEGIN
  --get the Customer_ID
 Cus_ID := :OLD.Customer_ID;


  --Calculate the return days late or early
  Days_Late_Early := :NEW.Actual_Return - :OLD.Expected_Return;

  --If statement to update the customer's balance in the customer table
  IF Days_Late_Early = 0
  THEN UPDATE Customer
  SET Cus_Balance = Cus_Balance + Days_Late_Early
  WHERE Customer_ID = Cus_ID;

  ELSIF Days_Late_Early > 0
  THEN UPDATE Customer
  SET Cus_Balance = Cus_Balance + (Days_Late_Early * 75)
  WHERE Customer_ID = Cus_ID;

  ELSIF Days_Late_Early < 0
  THEN UPDATE Customer
  SET Cus_Balance = Cus_Balance + (Days_Late_Early * 20)
  WHERE Customer_ID = Cus_ID;

  END IF;
END;
/
