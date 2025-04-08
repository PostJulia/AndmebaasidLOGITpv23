--kommentaar
--SQL SERVER Managment Stuudio
--Conect TO:
--Server Name:  (localdb)\mssqllocaldb
-- Authentification 2 tüüpi:
--1. Windows Auth - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtud kasutajad

CREATE DATABASE postnikovaLOGITpv23;
USE postnikovaLOGITpv23;

--tabeli loomine
--identity(1,1) - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary Key identity(1,1),
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;

--andmete lisamine
--DDL - data definition language
--DML -data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peeter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Kask Mati', '1983-12-30', '33333', 140.5, 0),
('Peeter Oja', '2021-12-30', '333333', 190.5, 0),
('Karina Linter', '2007-03-22', '222222', 170.1, 1)
;

SELECT * FROM inimene;
--kustuta id=3
DELETE FROM inimene
WHERE inimeneID=3;
