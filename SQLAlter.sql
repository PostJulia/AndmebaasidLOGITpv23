CREATE DATABASE kasutajaLogit;
USE kasutajaLogit;
CREATE TABLE uusTabel(
id int primary key identity(1,1),
testnimi varchar (25));

INSERT INTO uusTabel(testnimi)
values ('test');
SELECT * FROM uusTabel;
--liab uss veerg
ALTER TABLE uusTabel ADD testvanus int;
--kustutab veerg
ALTER TABLE uusTabel DROP testvanus;
--teeme kasutaja kes saab tabeli struktuuri muuta
GRANT ALTER ON uusTabel TO kasutajaAlter;
--saab muuta kõik tabeleid
GRANT ALTER TO kasutajaAlter;

--kasutaja saab luua tabeleid (2GRANT'i)
GRANT CREATE TABLE TO kasutajaAlter
GRANT CONTROL ON SCHEMA ::dbo TO kasutajaAlter


--FOR USER--
--õiguste kontroll
SELECT * FROM uusTabel;
ALTER TABLE uusTabel ADD testvanus int;
ALTER TABLE uusTabel DROP COLUMN testvanus;

CREATE TABLE uusTabel2(
id int primary key identity(1,1),
testnimi varchar (25));
