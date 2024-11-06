-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Lis 06, 2024 at 12:45 PM
-- Wersja serwera: 10.4.28-MariaDB
-- Wersja PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kino`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `id` int(11) NOT NULL,
  `seans_id` int(11) NOT NULL,
  `sprzedawca_id` int(11) NOT NULL,
  `klient_id` int(11) NOT NULL,
  `cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bilety`
--

INSERT INTO `bilety` (`id`, `seans_id`, `sprzedawca_id`, `klient_id`, `cena`) VALUES
(1, 1, 1, 1, 22),
(2, 1, 2, 4, 24),
(3, 2, 4, 3, 23),
(4, 2, 3, 4, 23),
(5, 3, 4, 3, 24),
(6, 3, 1, 2, 22),
(7, 4, 2, 2, 25),
(8, 4, 3, 1, 23),
(9, 5, 3, 4, 22),
(10, 5, 2, 2, 23),
(11, 6, 4, 1, 24),
(12, 6, 1, 3, 22);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filmy`
--

CREATE TABLE `filmy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(100) NOT NULL,
  `rezyser` varchar(100) NOT NULL,
  `czas_trwania` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `filmy`
--

INSERT INTO `filmy` (`id`, `tytul`, `rezyser`, `czas_trwania`) VALUES
(1, 'Batman', 'Patrick Bateman', 104),
(2, 'Morbius', 'Daniel Espionsa', 104),
(3, 'Fight Club', 'David Fincher', 139),
(4, 'Drive', 'Ryan Gosling', 90),
(5, 'Oppenheimer', 'Christopher Nolan', 180);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `film_rodzaj`
--

CREATE TABLE `film_rodzaj` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `rodzaj_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film_rodzaj`
--

INSERT INTO `film_rodzaj` (`id`, `film_id`, `rodzaj_id`) VALUES
(1, 1, 2),
(2, 1, 5),
(3, 2, 2),
(4, 2, 3),
(5, 3, 2),
(6, 3, 4),
(7, 4, 2),
(8, 4, 4),
(9, 5, 1),
(10, 5, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`id`, `imie`, `nazwisko`, `email`) VALUES
(1, 'Julian', 'Siudziński', 'jsiudzinski@gmail.com'),
(2, 'Tadeusz', 'Budnik', 'tadbud@wp.pl'),
(3, 'Miłosz', 'Skarzyński', 'jajaumilosza@gmail.com'),
(4, 'Halina', 'Trawińska', 'h.trawinska@onet.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaje_filmu`
--

CREATE TABLE `rodzaje_filmu` (
  `id` int(11) NOT NULL,
  `rodzaj_filmu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rodzaje_filmu`
--

INSERT INTO `rodzaje_filmu` (`id`, `rodzaj_filmu`) VALUES
(1, 'Komedia'),
(2, 'Akcja'),
(3, 'Horror'),
(4, 'Thriller'),
(5, 'Kryminał');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `ilosc_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`id`, `ilosc_miejsc`) VALUES
(1, 30),
(2, 40),
(3, 35);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `seanse`
--

CREATE TABLE `seanse` (
  `id` int(11) NOT NULL,
  `termin` datetime NOT NULL,
  `sala_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `liczba_wolnych miejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seanse`
--

INSERT INTO `seanse` (`id`, `termin`, `sala_id`, `film_id`, `liczba_wolnych miejsc`) VALUES
(1, '2024-11-01 17:15:00', 1, 3, 30),
(2, '2024-11-01 17:15:00', 3, 4, 35),
(3, '2024-11-01 17:15:00', 2, 1, 40),
(4, '2024-11-02 16:30:00', 2, 5, 40),
(5, '2024-11-02 16:30:00', 1, 2, 30),
(6, '2024-11-02 16:30:00', 3, 1, 35);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sprzedawcy`
--

CREATE TABLE `sprzedawcy` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) NOT NULL,
  `nazwisko` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sprzedawcy`
--

INSERT INTO `sprzedawcy` (`id`, `imie`, `nazwisko`) VALUES
(1, 'Karol', 'Rafalski'),
(2, 'Patrycja', 'Romańska'),
(3, 'Piotr', 'Kuźmiński'),
(4, 'Paulina', 'Bujkiewicz');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Bilet_seans_FK` (`seans_id`),
  ADD KEY `Bilet_klient_FK` (`klient_id`),
  ADD KEY `Bilet_sprzedawca_FK` (`sprzedawca_id`);

--
-- Indeksy dla tabeli `filmy`
--
ALTER TABLE `filmy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `film_rodzaj`
--
ALTER TABLE `film_rodzaj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Rodzaje_filmy_FK` (`rodzaj_id`),
  ADD KEY `Filmy_rodzaje_FK` (`film_id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rodzaje_filmu`
--
ALTER TABLE `rodzaje_filmu`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Seanse_film_FK` (`film_id`),
  ADD KEY `Seanse_sale_FK` (`sala_id`);

--
-- Indeksy dla tabeli `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bilety`
--
ALTER TABLE `bilety`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `filmy`
--
ALTER TABLE `filmy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `film_rodzaj`
--
ALTER TABLE `film_rodzaj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rodzaje_filmu`
--
ALTER TABLE `rodzaje_filmu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seanse`
--
ALTER TABLE `seanse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sprzedawcy`
--
ALTER TABLE `sprzedawcy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bilety`
--
ALTER TABLE `bilety`
  ADD CONSTRAINT `Bilet_klient_FK` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`id`),
  ADD CONSTRAINT `Bilet_seans_FK` FOREIGN KEY (`seans_id`) REFERENCES `seanse` (`id`),
  ADD CONSTRAINT `Bilet_sprzedawca_FK` FOREIGN KEY (`sprzedawca_id`) REFERENCES `sprzedawcy` (`id`);

--
-- Constraints for table `film_rodzaj`
--
ALTER TABLE `film_rodzaj`
  ADD CONSTRAINT `Filmy_rodzaje_FK` FOREIGN KEY (`film_id`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `Rodzaje_filmy_FK` FOREIGN KEY (`rodzaj_id`) REFERENCES `rodzaje_filmu` (`id`);

--
-- Constraints for table `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `Seanse_film_FK` FOREIGN KEY (`film_id`) REFERENCES `filmy` (`id`),
  ADD CONSTRAINT `Seanse_sale_FK` FOREIGN KEY (`sala_id`) REFERENCES `sale` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
