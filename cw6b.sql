-- 0. Usunięcie bazy danych i schematu jeśli istnieją
DROP DATABASE IF EXISTS firma; 
DROP SCHEMA IF EXISTS ksiegowosc;

-- 1. Utworzenie bazy danych firma
CREATE DATABASE firma;

-- 2. Utworzenie schematu rozliczenia
CREATE SCHEMA ksiegowosc;

-- 3. Utworzenie tabel
CREATE TABLE ksiegowosc.pracownicy (id_pracownika INT NOT NULL PRIMARY KEY, imie VARCHAR(25) NOT NULL, nazwisko VARCHAR(30) NOT NULL, adres VARCHAR(80) NOT NULL, telefon VARCHAR(20) NOT NULL) COMMENT = 'Tabela z danymi pracowników';
CREATE TABLE ksiegowosc.godziny (id_godziny INT NOT NULL PRIMARY KEY, data_godziny DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT) COMMENT = 'Tabela z liczbą godzin pracowników';
CREATE TABLE ksiegowosc.pensje (id_pensji INT NOT NULL PRIMARY KEY, stanowisko VARCHAR(30) NOT NULL, kwota INT NOT NULL, id_premii INT) COMMENT = 'Tabela z informacjami o pensjach pracowników';
CREATE TABLE ksiegowosc.premie (id_premii INT NOT NULL PRIMARY KEY, rodzaj VARCHAR(40), kwota INT ) COMMENT = 'Tabela zawierająca informacje o premiach dla pracownikó';
CREATE TABLE ksiegowosc.wynagrodzenia (id_wynagrodzenia INT NOT NULL PRIMARY KEY, data_wynagrodzenia DATE NOT NULL, id_pracownika INT, id_godziny INT, id_pensji INT, id_premii INT) COMMENT = 'Tabela łącznikowa dla wynagrodzeń';

-- 3.d Utworzenie kluczy obcych
ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.pensje
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensje(id_pensji);
ALTER TABLE ksiegowosc.wynagrodzenia
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premie(id_premii);

-- 4. Wypełnienie tabel rekordami
INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Marcin' , 'Kowalski', 'Kraków, Polna 8' ,  '639481282'); 
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Maria' , 'Kowalska', 'Kraków, Polna 8' ,  '636728912'); 
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Łukasz' , 'Kwiecień', 'Warszawa, Saska 3' ,  '510828563'); 
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Agata' , 'Zięba', 'Wrocław, Cicha 13' , '362819264'); 
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Michał' , 'Kurnik', 'Gdynia, Zimna 56' , '624319623'); 
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Daniel' , 'Batko', 'Bełchatów, Elektryczna 2' , '572801641'); 
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Justyna' , 'Kot', 'Rybnik, Barwna 14' , '529162419'); 
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Paulina' , 'Kiełbasa-Krakowska', 'Warszawa, Zwierzęca 14' , '592537182'); 
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Patrycja' , 'Budynek', 'Zawiercie, Grzybowa 83' , '562809142'); 
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Jakub' , 'Krakowski', 'Warszawa, Zwierzęca 14' , '562814247'); 

INSERT INTO ksiegowosc.godziny VALUES (1, '2021-03-29' , 160, 1 );
INSERT INTO ksiegowosc.godziny VALUES (2, '2021-03-29' , 170, 2 );
INSERT INTO ksiegowosc.godziny VALUES (3, '2021-03-29' , 140, 3 );
INSERT INTO ksiegowosc.godziny VALUES (4, '2021-03-29' , 180, 4 );
INSERT INTO ksiegowosc.godziny VALUES (5, '2021-03-29' , 165, 5 );
INSERT INTO ksiegowosc.godziny VALUES (6, '2021-03-29' , 160, 6 );
INSERT INTO ksiegowosc.godziny VALUES (7, '2021-03-29' , 168, 7 );
INSERT INTO ksiegowosc.godziny VALUES (8, '2021-03-29' , 158, 8 );
INSERT INTO ksiegowosc.godziny VALUES (9, '2021-03-29' , 161, 9 );
INSERT INTO ksiegowosc.godziny VALUES (10, '2021-03-29' , 172, 10 );

INSERT INTO ksiegowosc.premie VALUES (1, 'BRAK PREMII' , 0 );
INSERT INTO ksiegowosc.premie VALUES (2, 'dodatek' , 240 );
INSERT INTO ksiegowosc.premie VALUES (3, 'dodatek' , 230 );
INSERT INTO ksiegowosc.premie VALUES (4, 'dodatek' , 300 );
INSERT INTO ksiegowosc.premie VALUES (5, 'BRAK PREMII' , 0 );
INSERT INTO ksiegowosc.premie VALUES (6, 'dodatek' , 180 );
INSERT INTO ksiegowosc.premie VALUES (7, 'dodatek' , 540 );
INSERT INTO ksiegowosc.premie VALUES (8, 'dodatek' , 230 );
INSERT INTO ksiegowosc.premie VALUES (9, 'dodatek' , 100 );
INSERT INTO ksiegowosc.premie VALUES (10, 'BRAK PREMII' , 0 );

INSERT INTO ksiegowosc.pensje VALUES (1, 'Ksiegowy' , 4500, 1 );
INSERT INTO ksiegowosc.pensje VALUES (2, 'Sprzedawca' , 2400, 2 );
INSERT INTO ksiegowosc.pensje VALUES (3, 'Ochroniarz' , 3100, 3 );
INSERT INTO ksiegowosc.pensje VALUES (4, 'Sprzedawca' , 2400, 4 );
INSERT INTO ksiegowosc.pensje VALUES (5, 'Sprzątacz' , 900, 5 );
INSERT INTO ksiegowosc.pensje VALUES (6, 'Menager' , 6700, 6 );
INSERT INTO ksiegowosc.pensje VALUES (7, 'Sekretarka' , 3000, 7 );
INSERT INTO ksiegowosc.pensje VALUES (8, 'Kierownik działu sprzedaży' , 14000, 8 );
INSERT INTO ksiegowosc.pensje VALUES (9, 'Sprzątacz' , 1800, 9 );
INSERT INTO ksiegowosc.pensje VALUES (10, 'CEO' , 16000, 10 );

INSERT INTO ksiegowosc.wynagrodzenia VALUES (1, '2021-03-31', 1, 1, 1, 1);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (2, '2021-03-31', 2, 2, 2, 2);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (3, '2021-03-31', 3, 3, 3, 3);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (4, '2021-03-31', 4, 4, 4, 4);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (5, '2021-03-31', 5, 5, 5, 5);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (6, '2021-03-31', 6, 6, 6, 6);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (7, '2021-03-31', 7, 7, 7, 7);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (8, '2021-03-31', 8, 8, 8, 8);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (9, '2021-03-31', 9, 9, 9, 9);
INSERT INTO ksiegowosc.wynagrodzenia VALUES (10, '2021-03-31', 10, 10, 10, 10);

-- 6.b. Zapytania
-- a)
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', telefon );
SELECT telefon FROM ksiegowosc.pracownicy;

-- b) !!! nie działa
UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon, 1, 9)+'-'+
             SUBSTRING(telefon, 10, 3)+'-'+
             SUBSTRING(telefon, 14, 3);
SELECT telefon FROM ksiegowosc.pracownicy;
-- c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT  upper(nazwisko), LENGTH(nazwisko) nazwisko_len FROM ksiegowosc.pracownicy ORDER BY nazwisko_len DESC , nazwisko DESC LIMIT 1;

-- d)
SELECT  md5(imie) md_imie, md5(nazwisko) md_nazwisko, md5(adres) md_adres, md5(telefon) md_telefon FROM ksiegowosc.pracownicy;

-- e)
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja, premie.kwota AS premia 
FROM ksiegowosc.pracownicy left JOIN (ksiegowosc.pensje left JOIN (ksiegowosc.premie left JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii)
ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika;

-- f)
SELECT CONCAT('Pracownik ', imie, ' ', nazwisko, ' w dniu ', data_wynagrodzenia, ' otrzymał pensję całkowitą na kwotę ',
(pensje.kwota + premie.kwota), 'zł, gdzie wynagrodzenie zasadnicze wynosiło: ', CAST(pensje.kwota AS CHAR(10)), ' premie: ',
premie.kwota, ' nadgodziny: ', premie.kwota) AS raport
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
INNER JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenia.id_pensji = ksiegowosc.pensje.id_pensji
INNER JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenia.id_premii = ksiegowosc.premie.id_premii
