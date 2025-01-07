CREATE TABLE geographical_location (
Location_ID INT PRIMARY KEY,
Village VARCHAR(100),
Parish VARCHAR(100),
Sub_County VARCHAR(100),
County VARCHAR(100),
Region VARCHAR(50),
Population INT,
Coordinates VARCHAR(100),
ITN_Coverage DECIMAL(5,2),
Health_Facilities_Count INT,
Reported_Cases INT
);

CREATE TABLE health_facility (
Facility_ID INT PRIMARY KEY,
Facility_Name VARCHAR(100),
Location_ID INT,
Facility_Type_ID INT,
Capacity INT,
Contact_Details VARCHAR(100),
FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE facility_type (
Facility_Type_ID INT PRIMARY KEY,
Name VARCHAR(50),
Description TEXT
);

CREATE TABLE patient_data (
Patient_ID INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Date_of_Birth DATE,
Phone_Number VARCHAR(15),
Next_of_Kin VARCHAR(100),
Location_ID INT,
FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE visit_record (
Visit_ID INT PRIMARY KEY,
Patient_ID INT,
Facility_ID INT,
Visit_Date DATE,
FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE treatment (
Treatment_ID INT PRIMARY KEY,
Treatment_Name VARCHAR(50),
Description TEXT,
Dosage VARCHAR(50),
Side_Effects TEXT
);

CREATE TABLE malaria_cases (
Case_ID INT PRIMARY KEY,
Patient_ID INT,
Facility_ID INT,
Date_of_Diagnosis DATE,
Type_of_Malaria VARCHAR(50),
Treatment_ID INT,
Outcome_ID INT,
FOREIGN KEY (Patient_ID) REFERENCES patient_data(Patient_ID),
FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID),
FOREIGN KEY (Treatment_ID) REFERENCES treatment(Treatment_ID)
);

CREATE TABLE treatment_outcome (
Outcome_ID INT PRIMARY KEY,
Outcome_Name VARCHAR(50),
Description TEXT
);

CREATE TABLE laboratory_tests (
Test_ID INT PRIMARY KEY,
Test_Type VARCHAR(50),
Result VARCHAR(50),
Test_Date DATE,
Technician_ID INT
);

CREATE TABLE interventions (
Intervention_ID INT PRIMARY KEY,
Type VARCHAR(50),
Location_ID INT,
Date_Start DATE,
Date_End DATE,
Outcome VARCHAR(50),
FOREIGN KEY (Location_ID) REFERENCES geographical_location(Location_ID)
);

CREATE TABLE resource (
Resource_ID INT PRIMARY KEY,
Facility_ID INT,
Resource_Name VARCHAR(100),
Quantity INT,
FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE supply_chain (
Supply_ID INT PRIMARY KEY,
Resource_ID INT,
Facility_ID INT,
Quantity_Shipped INT,
Shipment_Date DATE,
Expected_Arrival_Date DATE,
Status VARCHAR(50),
FOREIGN KEY (Resource_ID) REFERENCES resource(Resource_ID),
FOREIGN KEY (Facility_ID) REFERENCES health_facility(Facility_ID)
);

CREATE TABLE user_role (
Role_ID INT PRIMARY KEY,
Role_Name VARCHAR(50),
Role_Description TEXT
);

CREATE TABLE user (
User_ID INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Username VARCHAR(50),
Password VARCHAR(100),
Role_ID INT,
FOREIGN KEY (Role_ID) REFERENCES user_role(Role_ID)
);

CREATE TABLE system_log (
Log_ID INT PRIMARY KEY,
User_ID INT,
Activity TEXT,
Timestamp DATETIME,
IP_Address VARCHAR(50),
Location VARCHAR(100),
FOREIGN KEY (User_ID) REFERENCES user(User_ID)
);

