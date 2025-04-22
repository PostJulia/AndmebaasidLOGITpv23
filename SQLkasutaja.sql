--Kasutajate loomine | SQL SERVER
--connect to 
--(localdb)\mssqllocaldb ja WIN auth --
--admini õiugused SQL Serveril

--UUS kasutajame loome nagu SQL Server Auth
CREATE DATABASE loodusLOGIT;
--Object Explorer--Security--Logins--New Login
USE loodusLOGIT;
CREATE TABLE test2(
id int primary key identity(1,1),
testNimi varchar(10))

--tabelipõhised õigused
--lubamine
GRANT SELECT, INSERT on test TO opilaneJulia;
GRANT SELECT, UPDATE on test2 TO opilaneJulia;
--keelamine
DENY DELETE ON test TO opilaneJulia;

GRANT CREATE ON TABLE loodusLOGIT TO loojaJulia;
