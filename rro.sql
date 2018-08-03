CREATE DATABASE University;

USE University;

CREATE TABLE Cities (
    CityID int AUTO_INCREMENT,
    City varchar(255),
    Country varchar(255),
    PRIMARY KEY (CityID)
);

CREATE TABLE Students (
    StudentID int AUTO_INCREMENT,
    FirstName varchar(255),
    LastName varchar(255),
    NumberOfCourse int,
    Gender varchar(255),
    CityID int,
    PRIMARY KEY (StudentID),
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);

INSERT INTO Cities (City, Country)
VALUES
('Erfurt', 'Germany'),
('San-Francisco', 'USA'),
('Kapetown', 'Republic of South Africa '),
('Beijing', 'China'),
('Essen', 'Germany'),
('Hamburg', 'Germany'),
('Atlanta', 'USA');

INSERT INTO Students (FirstName, LastName, NumberOfCourse, Gender, CityID)
VALUES
('Mark', 'Schmidt', '3', 'male', '1'),
('Helen', 'Hunt', '2', 'male', '2'),
('Matumba', 'Zuko', '4', 'male', '3'),
('Rin', 'Kupo', '4', 'female', '3'),
('Zhen', 'Chi Bao', '2', 'male', '4'),
('Peter', 'Zimmer', '3', 'male', '5'),
('Hanz', 'Mueller', '4', 'male', '6'),
('Alisa', 'Kepler', '4', 'female', '1'),
('Anna', 'Madavie', '2', 'female', '7')
;
