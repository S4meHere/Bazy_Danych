-- 0. Usunięcie bazy danych i schematu jeśli istnieją
DROP DATABASE IF EXISTS firma; 
DROP SCHEMA IF EXISTS ksiegowosc;

-- 1. Utworzenie bazy danych firma
CREATE DATABASE firma;

-- 2. Utworzenie schematu rozliczenia
CREATE SCHEMA ksiegowosc;

-- 3. Utworzenie tabel
CREATE TABLE ksiegowosc.pracownicy (id_pracownika INT NOT NULL PRIMARY KEY, imie VARCHAR(25) NOT NULL, nazwisko VARCHAR(30) NOT NULL, adres VARCHAR(80) NOT NULL, telefon INT NOT NULL) COMMENT = 'Tabela z danymi pracowników';
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
INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Marcin' , 'Kowalski', 'Kraków, Polna 8' ,  639481282); 
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Maria' , 'Kowalska', 'Kraków, Polna 8' ,  636728912); 
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Łukasz' , 'Kwiecień', 'Warszawa, Saska 3' ,  510828563); 
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Agata' , 'Zięba', 'Wrocław, Cicha 13' , 362819264); 
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Michał' , 'Kurnik', 'Gdynia, Zimna 56' , 624319623); 
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Daniel' , 'Batko', 'Bełchatów, Elektryczna 2' , 572801641); 
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Justyna' , 'Kot', 'Rybnik, Barwna 14' , 529162419); 
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Paulina' , 'Kiełbasa-Krakowska', 'Warszawa, Zwierzęca 14' , 592537182); 
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Patrycja' , 'Budynek', 'Zawiercie, Grzybowa 83' , 562809142); 
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Jakub' , 'Krakowski', 'Warszawa, Zwierzęca 14' , 562814247); 

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

-- 5. Zapytania
-- a) Wyświetl tylko id pracownika oraz jego nazwisko.
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

-- b) Wyświetl id pracowników, których płaca jest większa niż 1000.
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
WHERE ksiegowosc.pensje.kwota > 1000.00;

-- c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
SELECT ksiegowosc.pracownicy.id_pracownika
FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN 
(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii) 
ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
WHERE ksiegowosc.premie.kwota = 0 AND ksiegowosc.pensje.kwota > 2000;

-- d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
SELECT * FROM ksiegowosc.pracownicy WHERE imie LIKE 'j%';

-- e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
SELECT * FROM ksiegowosc.pracownicy WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

-- f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy czas pracy to 160 h miesięcznie.
SELECT imie, nazwisko,  liczba_godzin - 160 AS liczba_nadgodzin
FROM ksiegowosc.pracownicy INNER JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin > 160;

-- g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000 PLN.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika 
WHERE ksiegowosc.pensje.kwota >= 1500.00 AND ksiegowosc.pensje.kwota <= 3000;

-- h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii.
SELECT imie, nazwisko FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.godziny INNER JOIN
(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii)
ON ksiegowosc.godziny.id_godziny = ksiegowosc.wynagrodzenia.id_godziny) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
WHERE ksiegowosc.godziny.liczba_godzin > 160 AND ksiegowosc.premie.kwota = 0;

-- i) Uszereguj pracowników według pensji.
SELECT * FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
ORDER BY ksiegowosc.pensje.kwota ASC;

-- j) Uszereguj pracowników według pensji i premii malejąco.
SELECT * FROM ksiegowosc.pracownicy INNER JOIN (ksiegowosc.pensje INNER JOIN 
(ksiegowosc.premie INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii) 
ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenia.id_pracownika
ORDER BY ksiegowosc.pensje.kwota DESC, ksiegowosc.premie.kwota DESC;

-- k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.
SELECT stanowisko, COUNT(ksiegowosc.pensje.stanowisko)
FROM ksiegowosc.pensje GROUP BY stanowisko;

-- l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie masz, to przyjmij dowolne inne).
SELECT MAX(ksiegowosc.pensje.kwota), MIN(ksiegowosc.pensje.kwota), AVG(ksiegowosc.pensje.kwota)
FROM ksiegowosc.pensje WHERE stanowisko = 'Sprzątacz';

-- m) Policz sumę wszystkich wynagrodzeń.
SELECT SUM(ksiegowosc.pensje.kwota) FROM ksiegowosc.pensje;

-- n) Policz sumę wynagrodzeń w ramach danego stanowiska.
SELECT stanowisko, SUM(ksiegowosc.pensje.kwota) FROM ksiegowosc.pensje GROUP BY stanowisko;

-- o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
SELECT stanowisko, COUNT(ksiegowosc.premie.kwota) 
FROM ksiegowosc.premie INNER JOIN (ksiegowosc.pensje INNER JOIN ksiegowosc.wynagrodzenia ON ksiegowosc.pensje.id_pensji = ksiegowosc.wynagrodzenia.id_pensji) 
ON ksiegowosc.premie.id_premii = ksiegowosc.wynagrodzenia.id_premii
GROUP BY stanowisko;

-- p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł.

