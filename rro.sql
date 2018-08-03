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
