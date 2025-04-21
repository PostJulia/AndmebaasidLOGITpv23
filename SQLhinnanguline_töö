CREATE DATABASE postnikovaLOGITpv23;
USE postnikovaLOGITpv23;

CREATE TABLE filmid(
ID int Primary Key identity(1,1),
Nimetus varchar(30) unique,
Rezisjoor varchar(30),
Zanr varchar(30)
);
SELECT * FROM filmid;

CREATE PROCEDURE lisaFilm
@nimi varchar(30),
@rezisjoor varchar(30),
@zanr varchar(30)
AS
BEGIN
INSERT INTO filmid(Nimetus, Rezisjoor, Zanr)
VALUES (@nimi, @rezisjoor, @zanr);
SELECT * FROM filmid;
END;

EXEC lisaFilm 'Patused', 'Ryan Coogler', 'Draama';

CREATE PROCEDURE uuendaFilmiZanr
@Id int,            
@NewZanr VARCHAR(30)
AS
BEGIN
SELECT * FROM filmid;
UPDATE filmid
    SET Zanr=@NewZanr
    WHERE Id=@Id;
SELECT * FROM filmid;
END;

EXEC uuendaFilmiZanr @Id=3, @NewZanr='Triller';

CREATE PROCEDURE kustutaFilm
@id int
AS
BEGIN
SELECT * FROM filmid;
DELETE FROM filmid WHERE ID=@id;
SELECT * FROM filmid;
END;

EXEC kustutaFilm @id=2
