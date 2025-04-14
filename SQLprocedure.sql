CREATE DATABASE postnikovaLOGITpv23;
USE postnikovaLOGITpv23;

CREATE TABLE filmid(
filmID int Primary Key identity(1,1),
filmNimi varchar(30) unique,
filmPikkus int,
rezisoor varchar(30)
);
SELECT * FROM filmid;

INSERT INTO filmid(filmNimi, filmPikkus, rezisoor)
VALUES ('Minecraft', 120, 'Jared Hess');

--protseduur mis lisab uus film ja kohe näitab tabelis (INSERT, SELECT)
CREATE PROCEDURE lisaFilm
@nimi varchar(30),
@pikkus int,
@rezisoor varchar(30)
AS
BEGIN
INSERT INTO filmid(filmNimi, filmPikkus, rezisoor)
VALUES (@nimi, @pikkus, @rezisoor);
SELECT * FROM filmid;
END;

--kutse
EXEC lisaFilm 'Amatöör', 203, 'James Hawes';

DROP Procedure lisaFilm;

--Proceduur, mis kustutab filmi filnID järgi (DELETE, SELECT)
CREATE PROCEDURE kustutaFilm
@id int
AS
BEGIN
SELECT * FROM filmid;
DELETE FROM filmid WHERE filmID=@id;
SELECT * FROM filmid;
END;

--kutse
EXEC kustutaFilm 1;
EXEC kustutaFilm @id=1

--proceduur, mis uuendab filmiPikkus 5% suurendab
CREATE PROCEDURE uuendaFilmiPikkus
AS
BEGIN
SELECT * FROM filmid;
UPDATE filmid SET filmPikkus=filmPikkus*1.05;
SELECT * FROM filmid;
END

--kutse
EXEC uuendaFilmiPikkus;

--proceduur, mis uuendab filmiPikkus. kasutaja sisestav väärtus
CREATE PROCEDURE uuendaFilmiPikkus2
@arv decimal(5,2)
AS
BEGIN
SELECT * FROM filmid;
UPDATE filmid SET filmPikkus=filmPikkus*@arv;
SELECT * FROM filmid;
END;

--kutse
EXEC uuendaFilmiPikkus2 @arv=1.5;
