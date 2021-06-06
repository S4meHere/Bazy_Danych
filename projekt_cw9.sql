CREATE DATABASE cw9;
USE cw9;

SET FOREIGN_KEY_CHECKS=0;

-- USUWANIE TABEL 

DROP TABLE GeoEon;
DROP TABLE GeoEra;
DROP TABLE GeoOkres;
DROP TABLE GeoEpoka;
DROP TABLE GeoPietro;

-- TWORZENIE TABEL DO TABLICY GEOCHRONOLOGICZNEJ

CREATE TABLE GeoEon(id_eon INT NOT NULL AUTO_INCREMENT, nazwa_eon VARCHAR(30) NOT NULL, PRIMARY KEY (id_eon));
CREATE TABLE GeoEra(id_era INT NOT NULL AUTO_INCREMENT, id_eon INT, nazwa_era VARCHAR(30) NOT NULL, PRIMARY KEY (id_era), FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon));
CREATE TABLE GeoOkres(id_okres INT NOT NULL AUTO_INCREMENT, id_era INT, nazwa_okres VARCHAR(30) NOT NULL, PRIMARY KEY (id_okres), FOREIGN KEY (id_era) REFERENCES GeoEra(id_era));
CREATE TABLE GeoEpoka(id_epoka INT NOT NULL AUTO_INCREMENT, id_okres INT, nazwa_epoka VARCHAR(30) NOT NULL, PRIMARY KEY (id_epoka), FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres));
CREATE TABLE GeoPietro(id_pietro INT NOT NULL AUTO_INCREMENT,id_epoka INT, nazwa_pietro VARCHAR(30) NOT NULL, PRIMARY KEY(id_pietro), FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka));

-- WYPEŁNIANIE TABEL

INSERT INTO GeoEon(nazwa_eon)
VALUES ('Fanerozoik');

INSERT INTO GeoEra(id_eon,nazwa_era)
VALUES (1,'Paleozoik'), (1,'Mezozoik'), (1,'Kenozoik');

INSERT INTO GeoOkres(id_era,nazwa_okres)
VALUES (1,'Kambr'), (1,'Ordowik'), (1,'Sylur'), (1,'Dewon'), (1,'Karbon'), (1,'Perm'), (2,'Trias'), (2,'Jura'), (2,'Kreda'), (3,'Paleogen'), (3,'Neogen'), (3,'Czwartorzęd');

INSERT INTO GeoEpoka(id_okres,nazwa_epoka)
VALUES (1,'Terenew'), (1,'Oddział 2'), (1,'Oddział 3'), (1, 'Furong'),
(2,'Dolny'), (2,'Środkowy'), (2,'Górny'),
(3,'Landower'), (3,'Wenlok'), (3,'Ludlow'), (3,'Przydol'),
(4,'Dolny'), (4,'Środkowy'), (4,'Górny'),
(5,'Missisip'), (5,'Pensylwan'),
(6,'Cisural'), (6,'Gwadelup'), (6, 'Loping'),
(7,'Dolny'), (7,'Środkowy'), (7,'Górny'),
(8,'Dolna'), (8,'Środkowa'), (8,'Górna'),
(9,'Dolna'), (9,'Górna'),
(10,'Paleocen'), (10,'Eocen'), (10,'Oligocen'),
(11,'Miocen'), (11,'Pliocen'),
(12,'Plejstocen'), (12,'Halocen');

INSERT INTO GeoPietro(id_epoka,nazwa_pietro)
VALUES (1,'Fortun'), (1,'Piętro 2'), 
(2,'Piętro 3'), (2,'Piętro 4'), 
(3,'Piętro 5'), (3,'Drum'), (3,'Gużang'), 
(4,'Paib'), (4,'iangshan'), (5,'Piętro 10'), 
(5,'Tremadok'), (5,'Flo'), 
(6,'Daping'), (6,'Darriwil'), 
(7,'Sandb'), (7,'Kat'), (7,'Hirnant'), 
(8,'Rhuddan'), (8,'Aeron'), (8,'Telych'),
(9, 'Sheinwood'), (9,'Homer'),
(10,'Gorst'), (10,'Ludford'),
(12, 'Lochkow'), (12, 'Prag'), (12,'Ems'),
(13, 'Eifel'), (13,'Żywet'),
(14, 'Fran'), (14, 'Famen'),
(15, 'Turnej'), (15, 'Wizen'), (15, 'Serpuchow'),
(16, 'Baszkir'), (16, 'Moskow'), (16, 'Kazim'), (16,'Gżel'),
(17, 'Aselsk'), (17, 'Sakmar'), (17, 'Artyńsk'), (17, 'Kungur'),
(18,'Road'), (18,'Word'), (18, 'Kapitan'),
(19,'Wucziaping'), (19, 'Czangszing'),
(20,'Ind'), (20,'Olenek'),
(21,'Anizyk'), (21,'Ladyn'),
(22,'Karnik'), (22,'Noryk'), (22, 'Retyk'),
(23,'Hetang'), (23,'Synemur'), (23,'Pilensbach'), (23,'Toark'),
(24,'Aalen'), (24,'Bajos'), (24,'Baton'), (24,'Kelowej'),
(25,'Oksford'), (25,'Kimeryd'), (25,'Tyton'),
(26,'Berias'), (26,'Walanżyn'), (26, 'Hoteryw'), (26,'Barrem'), (26,'Apt'), (26,'Alb'),
(27,'Cenoman'), (27,'Turon'), (27,'Koniak'), (27,'Santon'), (27,'Kampan'), (27,'Mastrycht'),
(28,'Dan'), (28,'Zeland'), (28,'Tanet'),
(29,'Iprez'), (29,'Lutet'), (29,'Barton'), (29,'Priablon'),
(30,'Rupel'), (30,'Szat'),
(31,'Akwitan'), (31,'Burdygał'), (31,'Lang'), (31,'Serrawal'), (31,'Torton'), (31,'Messyn'),
(32,'Zanki'), (32,'Piacent'),
(33,'Gelas'), (33,'Kalabr'), (33,'Jon'), (33,'Plejstocen górny');

SELECT * FROM GeoPietro;
-- UTWORZENIE ZDENORMALIZOWANEJ TABELI GEOCHRONOLOGICZNEJ

DROP TABLE GeoTabela;
CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon );

-- TWORZENIE INDEKSÓW DO 2 CZĘŚCI ZADANIA


CREATE INDEX indLiczba ON Milion(liczba);
CREATE INDEX indGeoTabela ON GeoTabela(id_pietro);

-- USUWANIE INDEKSÓW 

DROP INDEX indLiczba ON Milion;
DROP INDEX indGeoTabela ON GeoTabela;


SELECT * FROM GeoTabela;

-- UTWORZENIE TABEL DZIESIEC I MILION

DROP TABLE Dziesiec;

CREATE TABLE Dziesiec(cyfra INT ,bicik INT);
INSERT INTO Dziesiec(cyfra)
VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9);

DROP TABLE Milion;

CREATE TABLE Milion(liczba INT,cyfra INT, bicik INT);
INSERT INTO  Milion SELECT a1.cyfra + 10* a2.cyfra + 100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 100000*a6.cyfra 
AS liczba , a1.cyfra AS cyfra, a1.bicik AS bicik FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;

-- ZAPYTANIA:
 
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON (mod(Milion.liczba,98)=(GeoTabela.id_pietro));
SELECT COUNT(*) FROM Milion INNER JOIN  GeoPietro  ON (mod(Milion.liczba,98)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,98) = (SELECT id_pietro FROM GeoTabela   WHERE mod(Milion.liczba,98)=(id_pietro));
SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,98) IN (SELECT id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);
