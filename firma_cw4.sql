-- 0. Usunięcie bazy danych i schematu jeśli istnieją
DROP DATABASE IF EXISTS firma; 
DROP SCHEMA IF EXISTS rozliczenia;

-- 1. Utworzenie bazy danych firma
CREATE DATABASE firma;

-- 2. Utworzenie schematu rozliczenia
CREATE SCHEMA rozliczenia;
USE rozliczenia;

-- 3. Utworzenie tabel
CREATE TABLE rozliczenia.pracownicy (id_pracownika INT NOT NULL PRIMARY KEY, imie VARCHAR(25) NOT NULL, nazwisko VARCHAR(30) NOT NULL, adres VARCHAR(80) NOT NULL, telefon INT NOT NULL);
CREATE TABLE rozliczenia.godziny (id_godziny INT NOT NULL PRIMARY KEY, data_godziny DATE NOT NULL, liczba_godzin INT NOT NULL, id_pracownika INT);
CREATE TABLE rozliczenia.pensje (id_pensji INT NOT NULL PRIMARY KEY, stanowisko VARCHAR(30) NOT NULL, kwota INT NOT NULL, id_premii INT);
CREATE TABLE rozliczenia.premie (id_premii INT NOT NULL PRIMARY KEY, rodzaj VARCHAR(40), kwota INT );

-- 3.d Utworzenie kluczy obcych
ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);
ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie(id_premii);

-- 4. Wypełnienie tabel rekordami
INSERT INTO pracownicy VALUES (1, 'Marcin' , 'Kowalski', 'Kraków, Polna 8' ,  639481282); 
INSERT INTO pracownicy VALUES (2, 'Maria' , 'Kowalska', 'Kraków, Polna 8' ,  636728912); 
INSERT INTO pracownicy VALUES (3, 'Łukasz' , 'Kwiecień', 'Warszawa, Saska 3' ,  510828563); 
INSERT INTO pracownicy VALUES (4, 'Agata' , 'Zięba', 'Wrocław, Cicha 13' , 362819264); 
INSERT INTO pracownicy VALUES (5, 'Michał' , 'Kurnik', 'Gdynia, Zimna 56' , 624319623); 
INSERT INTO pracownicy VALUES (6, 'Daniel' , 'Batko', 'Bełchatów, Elektryczna 2' , 572801641); 
INSERT INTO pracownicy VALUES (7, 'Justyna' , 'Kot', 'Rybnik, Barwna 14' , 529162419); 
INSERT INTO pracownicy VALUES (8, 'Paulina' , 'Kiełbasa-Krakowska', 'Warszawa, Zwierzęca 14' , 592537182); 
INSERT INTO pracownicy VALUES (9, 'Patrycja' , 'Budyń', 'Zawiercie, Grzybowa 83' , 562809142); 
INSERT INTO pracownicy VALUES (10, 'Jakub' , 'Krakowski', 'Warszawa, Zwierzęca 14' , 562814247); 

INSERT INTO godziny VALUES (1, '2021-03-29' , 112, 1 );
INSERT INTO godziny VALUES (2, '2021-03-29' , 120, 2 );
INSERT INTO godziny VALUES (3, '2021-03-29' , 114, 3 );
INSERT INTO godziny VALUES (4, '2021-03-29' , 116, 4 );
INSERT INTO godziny VALUES (5, '2021-03-29' , 110, 5 );
INSERT INTO godziny VALUES (6, '2021-03-29' , 100, 6 );
INSERT INTO godziny VALUES (7, '2021-03-29' , 118, 7 );
INSERT INTO godziny VALUES (8, '2021-03-29' , 108, 8 );
INSERT INTO godziny VALUES (9, '2021-03-29' , 111, 9 );
INSERT INTO godziny VALUES (10, '2021-03-29' , 120, 10 );

INSERT INTO premie VALUES (1, 'dodatek' , 200 );
INSERT INTO premie VALUES (2, 'dodatek' , 240 );
INSERT INTO premie VALUES (3, 'dodatek' , 230 );
INSERT INTO premie VALUES (4, 'dodatek' , 300 );
INSERT INTO premie VALUES (5, 'dodatek' , 250 );
INSERT INTO premie VALUES (6, 'dodatek' , 180 );
INSERT INTO premie VALUES (7, 'dodatek' , 540 );
INSERT INTO premie VALUES (8, 'dodatek' , 230 );
INSERT INTO premie VALUES (9, 'dodatek' , 100 );
INSERT INTO premie VALUES (10, 'dodatek' , 420 );

INSERT INTO pensje VALUES (1, 'Ksiegowy' , 4500, 1 );
INSERT INTO pensje VALUES (2, 'Sprzedawca' , 2400, 2 );
INSERT INTO pensje VALUES (3, 'Ochroniarz' , 3100, 3 );
INSERT INTO pensje VALUES (4, 'Sprzedawca' , 2400, 4 );
INSERT INTO pensje VALUES (5, 'Sprzątacz' , 1800, 5 );
INSERT INTO pensje VALUES (6, 'Menager' , 6700, 6 );
INSERT INTO pensje VALUES (7, 'Sekretarka' , 3000, 7 );
INSERT INTO pensje VALUES (8, 'Kierownik działu sprzedaży' , 14000, 8 );
INSERT INTO pensje VALUES (9, 'Sprzątacz' , 1800, 9 );
INSERT INTO pensje VALUES (10, 'CEO' , 16000, 10 );

-- 5. Wyświetlenie nazwisk pracowników i ich adresów
SELECT nazwisko, adres FROM pracownicy;

-- 6. Brak funkcji DATEPART w MySQL :( Microsft Sequel server ani postgreSQL nie chcą mi się zainstalować na komputerze,
-- postaram się zrobić kolejnego commita po świętach po kolejnej próbie instalacji jednego z tych programów. 

-- 7. Zmiana kwota w tabeli pensje na kwota_brutto i dodanie kwota_netto
ALTER TABLE pensje CHANGE kwota kwota_brutto INT;
ALTER TABLE pensje ADD kwota_netto INT;
UPDATE pensje SET kwota_netto = kwota_brutto * 0.73;

SELECT kwota_brutto, kwota_netto FROM pensje;