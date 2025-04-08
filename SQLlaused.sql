--kommentaar
--Xampp control panel
--Conect TO:
--Server Name:  localhost - 127.0.0.1
-- Authentification :
-- kasutaja: root
-- parool: ei ole

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

--andmete lisamine
--DDL - data definition language
--DML -data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peeter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Kask Mati', '1983-12-30', '33333', 140.5, 0),
('Milana Surnina', '2007-01-22', '64363', 160.5, 1),
('Karina Linter', '2007-03-22', '222222', 170.1, 1)
;

SELECT * FROM inimene;
--kustuta id=3
DELETE FROM inimene
WHERE inimeneID=3;






SELECT * FROM inimene;
--table elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht (elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');

--tabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * FROM inimene;
--foreign key lisamine
ALTER TABLE inimene
ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

SELECT * FROM inimene;
SELECT * FROM elukoht;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES
('Peeter Vana', '2021-12-30', '2568952', 90.5, 0, 1);

SELECT * FROM inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SELECT inimene.nimi, inimene.synniaeg, elukoht.elukoht
FROM inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;

SELECT i.nimi, i.synniaeg, e.elukoht
FROM inimene i join elukoht e
ON i.elukohtID=e.elukohtID;




--Tabel auto loomine
CREATE TABLE autod(
autoID int Primary Key identity(1,1),
autoNr varchar(50) unique,
mudell char(12),
mark varchar(50),
v_aasta int,
);
SELECT * FROM autod;

INSERT INTO autod
(autoNr, mudell, mark, v_aasta)
VALUES
('ghf245', 'R8', 'Audi', '2000'),
('479hfn', 'S4', 'Honda', '2024')
;


--AutoID lisamine
ALTER TABLE inimene ADD autoID int;
SELECT * FROM inimene;

--Foreign key
ALTER TABLE inimene
ADD Constraint fk_autod
FOREIGN KEY (autoID)
references autod(autoID);

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES
('Julia Post', '2021-12-30', '2568952', 90.5, 0, 1, 1);
