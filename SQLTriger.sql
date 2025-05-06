--Trigerid
--SQL Triger (trigger) - protsess, mille abil tema sisse kirjutatud tegevused automaatselt käivitatakse.
--INSERT; UPDATE; DELETE trigerid, mis jälgivad antud tegevused tabelites ja kirjutavad logi tabeli mida nad jälgisid.

CREATE DATABASE trigerLOGIT;
USE trigerLOGIT;

CREATE TABLE toode(
toodeID int PRIMARY KEY identity(1,1),
toodeNimetus varchar(25),
toodeHind decimal (5,2))
--taabel logi, mis täidab triger
CREATE TABLE logi(
id int PRIMARY KEY identity(1,1),
tegevus varchar(25),
kuupaev datetime,
andmed TEXT)

--INSERT triger, mis jälgib andmete lisamine toode-tabelisse
CREATE TRIGGER toodeLisamine
ON toode
FOR INSERT
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on lisatud',
GETDATE(),
CONCAT('uus toode: ', inserted.toodeNimetus,
' hind: ', inserted.toodeHind, 
' | lisas kasutaja -', SYSTEM_USER)
FROM inserted;

DROP TRIGGER toodeLisamine;

--kontroll
INSERT INTO toode(toodeNimetus, toodeHind)
VALUES ('Coca-cola3', 2.20);

SELECT * FROM toode;
SELECT * FROM logi;

--DELETE TRIGER, mis jälgib toode kustutamine tabelis
CREATE TRIGGER toodeKustutamine
ON toode
FOR DELETE
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on lisatud',
GETDATE(),
CONCAT(deleted.toodeNimetus, 
'| tegi kasutaja', SYSTEM_USER)
FROM deleted;

--kontroll
DELETE FROM toode
WHERE toodeID=3;

SELECT * FROM toode;
SELECT * FROM logi;

--Update Triger, mis jälgib toode uuendamine tabelis
CREATE TRIGGER toodeUuendamine
ON toode
FOR UPDATE
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on lisatud',
GETDATE(),
CONCAT('Vanad andmed  - ', deleted.toodeNimetus,', ', deleted.toodeHind, 
'\nUued andmed  - ', inserted.toodeNimetus,', ', inserted.toodeHind, 
'| tegi kasutaja', SYSTEM_USER)
FROM deleted INNER JOIN inserted
ON deleted.toodeID=inserted.toodeID;

--kontroll
UPDATE toode SET toodeHind=4.00
WHERE toodeNimetus='Fanta';

SELECT * FROM toode;
SELECT * FROM logi;
