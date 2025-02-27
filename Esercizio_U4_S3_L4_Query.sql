CREATE TABLE IMPIEGO (
IDImpiego int PRIMARY KEY IDENTITY(1, 1),
TipoImpiego VARCHAR(50) NOT NULL,
Assunzione DATETIME NOT NULL DEFAULT GETDATE()
);

INSERT INTO IMPIEGO (TipoImpiego)
VALUES
    ('Impiegato Amministrativo'),
    ('Tecnico Informatico'),
    ('Operaio Specializzato'),
    ('Responsabile Vendite'),
    ('Analista Finanziario'),
    ('Ingegnere Progettista'),
    ('Addetto al Customer Service');

CREATE TABLE IMPIEGATO (
IDImpiegato int PRIMARY KEY IDENTITY(1, 1),
Nome VARCHAR(50) NOT NULL,
Cognome VARCHAR(50) NOT NULL,
CodiceFiscale VARCHAR(17) NOT NULL UNIQUE,
Eta int NOT NULL,
RedditoMensile MONEY NOT NULL,
DetrazioneFiscale bit NOT NULL,
IDImpiego int NOT NULL,
CONSTRAINT FK_IDImpiego FOREIGN KEY (IDImpiego) REFERENCES IMPIEGO(IDImpiego)
);

INSERT INTO IMPIEGATO (Nome, Cognome, CodiceFiscale, Eta, RedditoMensile, DetrazioneFiscale, IDImpiego)
VALUES
    ('Mario', 'Rossi', 'RSSMRA80A01H501Z', 44, 2500.00, 1, 1),
    ('Luca', 'Bianchi', 'BNCPLC85B02F205Y', 38, 2800.00, 0, 2),
    ('Giulia', 'Verdi', 'VRDGLI90C03L219X', 33, 3200.00, 1, 3),
    ('Francesca', 'Neri', 'NRIFNC95D04M330W', 29, 2700.00, 0, 4),
    ('Alessandro', 'Gialli', 'GLLALS88E05P440V', 36, 3500.00, 1, 5),
    ('Elena', 'Blu', 'BLULNE92F06Q550U', 31, 2900.00, 0, 6),
    ('Roberto', 'Marroni', 'MRNRBT97G07R660T', 27, 2300.00, 1, 7),
    ('Simone', 'Grigi', 'GRGSMN85H08S770S', 39, 3100.00, 1, 1),
    ('Chiara', 'Arancioni', 'ARNCHR93I09T880R', 30, 2600.00, 0, 2),
    ('Paolo', 'Viola', 'VLPPLA87J10U990Q', 37, 4000.00, 1, 3),
    ('Federica', 'Celesti', 'CLSFDR94K11V101P', 28, 2200.00, 0, 4),
    ('Andrea', 'Azzurri', 'AZZAND82L12W212O', 42, 3300.00, 1, 5),
    ('Martina', 'Rosa', 'RSOMRT89M13X323N', 34, 2750.00, 0, 6),
    ('Daniele', 'Turchesi', 'TRCDNL86N14Y434M', 40, 2900.00, 1, 7),
    ('Sara', 'Indaco', 'INDSAR95O15Z545L', 26, 2100.00, 0, 1),
    ('Giorgio', 'Beige', 'BEGGIO83P16A656K', 45, 3600.00, 1, 2),
    ('Valeria', 'Corallo', 'CRLVAL96Q17B767J', 25, 2050.00, 0, 3),
    ('Stefano', 'Oro', 'OROSTF81R18C878I', 46, 3800.00, 1, 4),
    ('Barbara', 'Argento', 'ARGBAA84S19D989H', 41, 2950.00, 0, 5),
    ('Michele', 'Perla', 'PERMIC97T20E101G', 24, 1950.00, 1, 6);

SELECT * FROM IMPIEGATO WHERE Eta > 29;
SELECT * FROM IMPIEGATO WHERE RedditoMensile > 799;
SELECT * FROM IMPIEGATO WHERE DetrazioneFiscale = 1;
SELECT * FROM IMPIEGATO WHERE DetrazioneFiscale = 0;
SELECT * FROM IMPIEGATO WHERE Cognome Like 'G%' ORDER BY Cognome;
SELECT Count(*) TotImpiegati FROM IMPIEGATO;
SELECT SUM(RedditoMensile) TotRedditoMensile FROM IMPIEGATO;
SELECT AVG(RedditoMensile) MediaRedditoMensile FROM IMPIEGATO;
SELECT MAX(RedditoMensile) MaxRedditoMensile FROM IMPIEGATO;
SELECT MIN(RedditoMensile) MinRedditoMensile FROM IMPIEGATO;

SELECT Nome, Cognome, Assunzione
FROM IMPIEGATO
INNER JOIN
IMPIEGO ON
IMPIEGATO.IDImpiego = IMPIEGO.IDImpiego WHERE Assunzione BETWEEN '2006-01-01 00:00:00' AND '2009-01-01 23:59:59';

SELECT Nome, Cognome, TipoImpiego
FROM IMPIEGATO
INNER JOIN
IMPIEGO ON
IMPIEGATO.IDImpiego = IMPIEGO.IDImpiego WHERE TipoImpiego LIKE 'Tecnico Informatico'

SELECT AVG(Eta) MediaEtaImpiegati FROM IMPIEGATO;