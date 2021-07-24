-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 24 Lip 2021, 12:01
-- Wersja serwera: 10.3.16-MariaDB
-- Wersja PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `id16316945_bazaszkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dostawcy`
--

CREATE TABLE `dostawcy` (
  `id_dostawcy` int(11) NOT NULL,
  `nazwa` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `adres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `dostawcy`
--

INSERT INTO `dostawcy` (`id_dostawcy`, `nazwa`, `adres`, `telefon`, `mail`) VALUES
(1, 'Firma kurierska', 'Warszawa 00-901, ul. Tajemnicza X', '+48 012 023 034', 'publiczny.kurier@gmail.com'),
(2, 'Kurier dla firm', 'Wołomin 05-200, ul. Pocztowa Z', '+48 098 087 076', 'adres.kuriera.waw@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `typ` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefon` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `karta_klienta` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `typ`, `nazwa`, `adres`, `telefon`, `email`, `karta_klienta`) VALUES
(1, 'Firma', 'Globexx Modern Wear', 'Warszawa 03-772, ul. Zmyślona X', '+48 123 456 789', '1.adres.email.klienta.1@gmail.com', 1),
(2, 'Fizyczna osoba', 'Krzysztof01', 'Warszawa 03-772, ul. Zmyślona Y', '+48 987 654 321', '2.adres.email.klienta.2@gmail.com', 0),
(3, 'Fizyczna osoba', 'MarlenaUwU', 'Warszawa 03-772, ul. Zmyślona Z', '+48 111 222 333', '3.adres.email.klienta.3@gmail.com', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id_komentarza` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `id_towaru` int(11) NOT NULL,
  `komentarz` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `magazyn`
--

CREATE TABLE `magazyn` (
  `id_dostawy` int(11) NOT NULL,
  `operacja` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `data_operacji` date NOT NULL,
  `id_towaru` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `magazyn`
--

INSERT INTO `magazyn` (`id_dostawy`, `operacja`, `data_operacji`, `id_towaru`, `ilosc`) VALUES
(1, 'Odbiór', '2020-10-01', 1, 420),
(2, 'Odbiór', '2021-05-11', 2, 20),
(3, 'Odbiór', '2021-02-09', 3, 100),
(4, 'Wysyłka', '2020-11-04', 1, 220),
(5, 'Wysyłka', '2021-01-04', 3, 40),
(6, 'Wysyłka', '2021-04-11', 3, 2),
(7, 'Wysyłka', '2021-06-01', 3, 40),
(8, 'Wysyłka', '2021-06-21', 2, 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `nieoplacone`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `nieoplacone` (
`id_oplaty` int(11)
,`id_zamowienia` int(11)
,`cena` float
,`oplacono` float
,`data_pelnej_zaplaty` date
,`nr_raty` int(11)
,`data_raty` date
,`rodzaj_raty` varchar(250)
,`nr_dokumentu` varchar(250)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oplaty`
--

CREATE TABLE `oplaty` (
  `id_oplaty` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL,
  `cena` float NOT NULL,
  `oplacono` float DEFAULT NULL,
  `data_pelnej_zaplaty` date DEFAULT NULL,
  `nr_raty` int(11) DEFAULT NULL,
  `data_raty` date DEFAULT NULL,
  `rodzaj_raty` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nr_dokumentu` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `oplaty`
--

INSERT INTO `oplaty` (`id_oplaty`, `id_zamowienia`, `cena`, `oplacono`, `data_pelnej_zaplaty`, `nr_raty`, `data_raty`, `rodzaj_raty`, `nr_dokumentu`) VALUES
(1, 1, 5497.8, 5497.8, '2020-11-04', NULL, NULL, NULL, '11/04/FA'),
(2, 2, 2400, 2400, '2021-01-04', NULL, NULL, NULL, '01/04/FA'),
(3, 3, 120, 120, '2021-04-11', NULL, NULL, NULL, '04/11/P1'),
(4, 4, 2400, 2400, '2021-06-01', NULL, NULL, NULL, '06/01/FA'),
(5, 5, 420, 220, NULL, 1, '2021-06-21', 'miesięczna', '06/21/P1');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `id_towaru` int(11) NOT NULL,
  `nazwa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `opisu` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cena` float NOT NULL,
  `grafika_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `specyfikacja` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `towary`
--

INSERT INTO `towary` (`id_towaru`, `nazwa`, `opisu`, `cena`, `grafika_link`, `specyfikacja`) VALUES
(1, 'Rękawiczki zimowe', 'Rękawiczki zimowe koloru czarnego, wygodne, fajne', 24.99, 'www.strona.pl/obrazek1', 'rozmiar M, materiał bawełna'),
(2, 'Suknia na wzór wiktoriański', 'Suknia stworzona na wzór wiktoriański, kolor biały z domieszkami fioletu i różu', 420, 'www.strona.pl/obrazek2', 'Proporcja 3-2-3 z możliwością własnoręcznej regulacji wymiarów o 1 jednostkę w skali'),
(3, 'Spodnie męskie - jeansy', 'Spodnie wykonane z czarnego jeansu', 60, 'www.strona.pl/obrazek3', 'Rozmiary M/L/XL/XXL. Oryginalny jeans.');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `transakcje_polroczne`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `transakcje_polroczne` (
`id_zamowienia` int(11)
,`oplacono` float
,`data_pelnej_zaplaty` date
,`id_odbiorcy` int(11)
,`nazwa` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `transakcje_procesowane`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `transakcje_procesowane` (
`id_zamowienia` int(11)
,`dostawca_id` int(11)
,`id_odbiorcy` int(11)
,`ilosc` int(11)
,`id_towaru` int(11)
,`uwagi` varchar(250)
,`cena` float
,`rodzaj_zam` varchar(64)
,`status_zam` varchar(64)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `dostawca_id` int(11) NOT NULL,
  `id_odbiorcy` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `id_towaru` int(11) NOT NULL,
  `uwagi` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cena` float NOT NULL,
  `rodzaj_zam` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status_zam` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `dostawca_id`, `id_odbiorcy`, `ilosc`, `id_towaru`, `uwagi`, `cena`, `rodzaj_zam`, `status_zam`) VALUES
(1, 1, 1, 220, 1, NULL, 5497.8, 'Wysyłka', 'Dostarczono'),
(2, 1, 1, 40, 3, '10 każdego rodzaju', 2400, 'Wysyłka', 'Dostarczono'),
(3, 2, 2, 2, 3, 'Poproszę rozmiar XL', 120, 'Odbiór osobisty', 'Dostarczono'),
(4, 1, 1, 40, 3, '10 każdego rodzaju', 2400, 'Wysyłka', 'Dostarczono'),
(5, 2, 3, 1, 2, NULL, 420, 'Wysyłka paczkomat', 'Wysłana - w drodze');

-- --------------------------------------------------------

--
-- Struktura widoku `nieoplacone`
--
DROP TABLE IF EXISTS `nieoplacone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id16316945_admin`@`%` SQL SECURITY DEFINER VIEW `nieoplacone`  AS  select `oplaty`.`id_oplaty` AS `id_oplaty`,`oplaty`.`id_zamowienia` AS `id_zamowienia`,`oplaty`.`cena` AS `cena`,`oplaty`.`oplacono` AS `oplacono`,`oplaty`.`data_pelnej_zaplaty` AS `data_pelnej_zaplaty`,`oplaty`.`nr_raty` AS `nr_raty`,`oplaty`.`data_raty` AS `data_raty`,`oplaty`.`rodzaj_raty` AS `rodzaj_raty`,`oplaty`.`nr_dokumentu` AS `nr_dokumentu` from `oplaty` where `oplaty`.`data_pelnej_zaplaty` is null ;

-- --------------------------------------------------------

--
-- Struktura widoku `transakcje_polroczne`
--
DROP TABLE IF EXISTS `transakcje_polroczne`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id16316945_admin`@`%` SQL SECURITY DEFINER VIEW `transakcje_polroczne`  AS  select `oplaty`.`id_zamowienia` AS `id_zamowienia`,`oplaty`.`oplacono` AS `oplacono`,`oplaty`.`data_pelnej_zaplaty` AS `data_pelnej_zaplaty`,`zamowienia`.`id_odbiorcy` AS `id_odbiorcy`,`klienci`.`nazwa` AS `nazwa` from ((`oplaty` left join `zamowienia` on(`oplaty`.`id_zamowienia` = `zamowienia`.`id_zamowienia`)) left join `klienci` on(`zamowienia`.`id_odbiorcy` = `klienci`.`id_klienta`)) where `oplaty`.`data_pelnej_zaplaty` > DATE'2021-01-01' or `oplaty`.`data_raty` > DATE'2021-01-01' group by `klienci`.`id_klienta`,`oplaty`.`id_zamowienia` ;

-- --------------------------------------------------------

--
-- Struktura widoku `transakcje_procesowane`
--
DROP TABLE IF EXISTS `transakcje_procesowane`;

CREATE ALGORITHM=UNDEFINED DEFINER=`id16316945_admin`@`%` SQL SECURITY DEFINER VIEW `transakcje_procesowane`  AS  select `zamowienia`.`id_zamowienia` AS `id_zamowienia`,`zamowienia`.`dostawca_id` AS `dostawca_id`,`zamowienia`.`id_odbiorcy` AS `id_odbiorcy`,`zamowienia`.`ilosc` AS `ilosc`,`zamowienia`.`id_towaru` AS `id_towaru`,`zamowienia`.`uwagi` AS `uwagi`,`zamowienia`.`cena` AS `cena`,`zamowienia`.`rodzaj_zam` AS `rodzaj_zam`,`zamowienia`.`status_zam` AS `status_zam` from `zamowienia` where `zamowienia`.`status_zam` = 'Wysłana - w drodze' or `zamowienia`.`status_zam` = 'Oczekiwanie na zapłate' ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_dostawcy`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id_komentarza`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_towaru` (`id_towaru`);

--
-- Indeksy dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id_dostawy`),
  ADD KEY `id_towaru` (`id_towaru`);

--
-- Indeksy dla tabeli `oplaty`
--
ALTER TABLE `oplaty`
  ADD PRIMARY KEY (`id_oplaty`),
  ADD KEY `id_zamowienia` (`id_zamowienia`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`id_towaru`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `dostawca_id` (`dostawca_id`),
  ADD KEY `id_odbiorcy` (`id_odbiorcy`),
  ADD KEY `id_towaru` (`id_towaru`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `dostawcy`
--
ALTER TABLE `dostawcy`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id_komentarza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  MODIFY `id_dostawy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `oplaty`
--
ALTER TABLE `oplaty`
  MODIFY `id_oplaty` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `towary`
--
ALTER TABLE `towary`
  MODIFY `id_towaru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD CONSTRAINT `komentarze_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `klienci` (`id_klienta`),
  ADD CONSTRAINT `komentarze_ibfk_2` FOREIGN KEY (`id_towaru`) REFERENCES `towary` (`id_towaru`);

--
-- Ograniczenia dla tabeli `magazyn`
--
ALTER TABLE `magazyn`
  ADD CONSTRAINT `magazyn_ibfk_1` FOREIGN KEY (`id_towaru`) REFERENCES `towary` (`id_towaru`);

--
-- Ograniczenia dla tabeli `oplaty`
--
ALTER TABLE `oplaty`
  ADD CONSTRAINT `oplaty_ibfk_1` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienia` (`id_zamowienia`);

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`dostawca_id`) REFERENCES `dostawcy` (`id_dostawcy`),
  ADD CONSTRAINT `zamowienia_ibfk_2` FOREIGN KEY (`id_odbiorcy`) REFERENCES `klienci` (`id_klienta`),
  ADD CONSTRAINT `zamowienia_ibfk_3` FOREIGN KEY (`id_towaru`) REFERENCES `towary` (`id_towaru`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
