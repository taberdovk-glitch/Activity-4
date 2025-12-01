CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50), 
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
);

CREATE TABLE animals(
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments(
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals (animalid)
);

CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
);

CREATE TABLE invoices(
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10, 2),
    paymentdate DATETIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords(
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    presciption VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners(ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'John', 'Doe', '123 Main Street, Anytown, ST 12345', '(555) 123-4567', 'john.doe@email.com'),
(2, 'Jane', 'Smith', '456 Oak Avenue, Smallville, ST 67890', '(555) 987-6543', 'jane.smith@email.com'),
(3, 'David', 'Johnson', '789 Pine Road, Metro City, ST 13579', '(555) 333-7777', 'david.j@email.com'),
(4, 'Maria', 'Lopez', '321 Birch Boulevard, Lakeside, ST 24680', '(555) 222-1111', 'maria.lopez@email.com'),
(5, 'Robert', 'Brown', '654 Cedar Lane, Hilltop, ST 97531', '(555) 876-5432', 'r.brown@email.com'),
(6, 'Sarah', 'Wilson', '987 Elm Street, Rivertown, ST 86420', '(555) 456-7890', 'sarah.wilson@email.com'),
(7, 'Michael', 'Davis', '159 Spruce Street, Mountain View, ST 11223', '(555) 789-0123', 'michael_davis@email.com'),
(8, 'Emily', 'Miller', '753 Willow Road, Desert City, ST 44556', '(555) 012-3456', 'emily.miller@email.com'),
(9, 'James', 'Martinez', '852 Poplar Ave, Ocean View, ST 66778', '(555) 210-9876', 'jmartinez@email.com'),
(10, 'Jennifer', 'Garcia', '248 Maple Street, Woodland, ST 99887', '(555) 345-6789', 'jen.garcia@email.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid) 
VALUES
(1, 'Max', 'Dog', 'Labrador Retriever', '2020-03-15', 'Male', 'Golden', 1),
(2, 'Luna', 'Cat', 'Domestic Shorthair', '2021-07-04', 'Female', 'Calico', 2),
(3, 'Charlie', 'Dog', 'German Shepherd', '2019-11-20', 'Male', 'Black and Tan', 3),
(4, 'Bella', 'Cat', 'Maine Coon', '2022-01-10', 'Female', 'Tabby', 4),
(5, 'Buddy', 'Dog', 'Beagle', '2018-05-30', 'Male', 'Tri-color', 5),
(6, 'Daisy', 'Cat', 'Siamese', '2020-09-12', 'Female', 'Cream Point', 6),
(7, 'Rocky', 'Dog', 'Boxer', '2021-02-28', 'Male', 'Brindle', 7),
(8, 'Molly', 'Cat', 'Persian', '2019-04-17', 'Female', 'White', 8),
(9, 'Toby', 'Dog', 'Dachshund', '2022-06-01', 'Male', 'Red', 9),
(10, 'Zoe', 'Cat', 'Bengal', '2020-12-25', 'Female', 'Spotted Brown', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason) 
VALUES
(1, 1, '2025-11-01', 'Checkup'),
(2, 2, '2025-11-05', 'Vaccination'),
(3, 3, '2025-11-10', 'Injury'),
(4, 4, '2025-11-15', 'Dental'),
(5, 5, '2025-11-20', 'Skin'),
(6, 6, '2025-11-25', 'Flea Treatment'),
(7, 7, '2025-11-30', 'Vaccination'),
(8, 8, '2025-12-01', 'Surgery'),
(9, 9, '2025-12-05', 'Allergy'),
(10, 10, '2025-12-10', 'Conjunctivitis');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality,phone, email) 
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate) 
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes) 
VALUES
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD RegisteredDate DATE;

ALTER TABLE invoices
RENAME COLUMN paymenydate TO paymenttime;

DELETE FROM appointments
WHERE animalid = (SELECT animalid FROM animals WHERE name = 'Simba');

UPDATE doctors
SET dlastname = 'Reyes-Gonzales'
WHERE dlastname = 'Reyes';