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

--1) сколько всего студентов приехало к нам учиться
SELECT COUNT(StudentID) FROM Students;
-- выводит количество студентов

--1.1) сколько всего городов
SELECT COUNT(CityID) FROM Cities;
-- выводит количество городов

--1.3) список всех студентов
SELECT * FROM Students;
-- список всех студенов

--1.4) список всех стран
SELECT DISTINCT Country FROM Cities;
-- выводит четыре страны

--2) сколько студенток-девочек приехало учиться и на каких они курсах
SELECT COUNT(StudentsID) FROM Students WHERE Gender = 'female';
-- количество девочек студенток
SELECT FirstName, LastName, NumberOfCourse FROM Students WHERE Gender = 'female';
-- список девочек студенток

--3) сколько студентов приехало учиться из Германии
SELECT Cities.Country, Students.FirstName, Students.LastName
FROM University.Cities
INNER JOIN University.Students ON Cities.CityID = Students.CityID
WHERE Cities.Country = 'Germany';
-- выводит список студентов где первый столбец страна, второй столбец имя, третий фамилия

-- если хотим вычислить только количество данных студентов
SELECT COUNT(Students.StudentID)
FROM University.Cities
INNER JOIN University.Students ON Cities.CityID = Students.CityID
WHERE Cities.Country = 'Germany';
-- выводит число 4

--4) сколько студентов младше четвертого курса у нас обучаются (не включая сам 4 курс)
SELECT * FROM University.Students WHERE NumberOfCourse < 4;

--5) необходимо перевести Anna Madavie со 2 на 3 курс, а Peter Zimmer за неуспеваемость на второй курс
UPDATE University.Students
SET NumberOfCourse = '3'
WHERE StudentID = (
  SELECT StudentID
  WHERE FirstName = 'Anna' AND LastName = 'Madavie');

  UPDATE University.Students
  SET NumberOfCourse = '2'
  WHERE StudentID = (
    SELECT StudentID
    WHERE FirstName = 'Peter' AND LastName = 'Zimmer');
-- это я переделал, так как будто мы не знаем ID студента, а знаем только его ФИО
