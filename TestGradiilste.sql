DELETE FROM Gradiliste
WHERE IDGradiliste = 0

SELECT * 
FROM Gradiliste

INSERT INTO Gradiliste (Naziv, DatumOsnivanja, BrojObjekata)
VALUES ('Gradi', '11-11-11', 0)

INSERT INTO Objekat (Naziv, IDGradiliste, BrojSpratova)
VALUES ('Test', 22, 0)

INSERT INTO Sprat(RedniBroj, IDObjekat)
VALUES  (0, 14)

DELETE FROM Sprat
WHERE IDSprat = 6

DELETE FROM Objekat
WHERE IDObjekat = 10

SELECT * 
FROM Sprat
GO

SELECT * 
FROM Objekat
GO

SELECT * 
FROM Gradiliste
GO

DELETE 
FROM Sprat
GO

DELETE 
FROM Objekat
GO

DELETE
FROM Gradiliste
GO

SELECT * FROM 
TipRobe

DELETE * FROM
TipRobe

