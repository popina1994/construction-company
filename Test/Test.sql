
-- FK relationship destroy
UPDATE Magacin
SET IDZaposleni = NULL
UPDATE Zaposleni
SET IDMagacin = NULL

DELETE FROM Zaduzio
DELETE FROM Ocena
DELETE FROM Rad
DELETE FROM Posao
DELETE FROM Sadrzi
DELETE FROM Ima
DELETE FROM Magacin
DELETE FROM Zaposleni
DELETE FROM Sprat
DELETE FROM Objekat
DELETE FROM Gradiliste
DELETE FROM Roba
DELETE FROM TipRobe
DELETE FROM Norma

SELECT * FROM Zaposleni


SELECT Rad.IDZaposleni AS IDZap, Rad.DatumPocetka AS RadPoc, Rad.DatumKraja AS RadKraj, IsplaceniIznos FROM 
Rad, Posao, Zaposleni
WHERE Rad.IDPosao = Posao.IDPosao AND Rad.IDZaposleni=Zaposleni.IDZaposleni
