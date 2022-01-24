-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Sty 2022, 14:50
-- Wersja serwera: 10.4.22-MariaDB
-- Wersja PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `events.com`
--
CREATE DATABASE IF NOT EXISTS `events.com` DEFAULT CHARACTER SET utf32 COLLATE utf32_polish_ci;
USE `events.com`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `artists`
--

INSERT INTO `artists` (`artist_id`, `name`) VALUES
(11, 'Metallica'),
(12, 'Iron Maiden'),
(13, 'Megadeth'),
(14, 'jazzowy man'),
(15, 'Krakow streetBand'),
(16, 'Zenek Martyniuk'),
(17, 'Sławomir'),
(18, 'Narodowa orkiestra symfoniczna'),
(19, 'Kabaret ani mru mru'),
(20, 'Kabaret moralnego niepokoju'),
(21, 'Mozart'),
(22, 'i Bach'),
(23, 'Farben Lehre'),
(24, 'The analogs'),
(25, 'James Bond'),
(26, 'koło gospodyń wiejskich Radomk'),
(27, 'CZERWONE JAGÓDKI'),
(28, 'Harry Potter'),
(29, 'Lord Voldemort');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artists_in_events`
--

CREATE TABLE `artists_in_events` (
  `artist_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `artists_in_events`
--

INSERT INTO `artists_in_events` (`artist_id`, `event_id`) VALUES
(11, 25),
(12, 25),
(13, 25),
(16, 27),
(17, 27),
(18, 28),
(0, 0),
(0, 0),
(21, 30),
(22, 30),
(0, 0),
(0, 0),
(25, 32),
(0, 0),
(27, 34),
(0, 0),
(0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `city` varchar(50) COLLATE utf32_polish_ci NOT NULL,
  `street` varchar(50) COLLATE utf32_polish_ci NOT NULL,
  `building_number` varchar(5) COLLATE utf32_polish_ci NOT NULL,
  `image` longblob DEFAULT NULL,
  `description` text COLLATE utf32_polish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `organizer` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `addedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `events`
--

INSERT INTO `events` (`event_id`, `name`, `city`, `street`, `building_number`, `image`, `description`, `date`, `time`, `organizer`, `addedBy`) VALUES
(25, 'koncert rockowy', 'Kraków', 'starowlisna', '33', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-20', '23:00:00', 'koncertyPl', 2),
(26, 'koncert jazz', 'Kraków', 'Krakowska', '33', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-22', '13:00:00', 'koncertyPl', 2),
(27, 'Koncert DiscoPolo', 'warszawa', 'rynkowa', '12', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-17', '12:00:00', 'koncertyPL', 4),
(28, 'Koncert muzyki filmowej', 'Kraków', 'starowiślna', '25', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-10', '12:00:00', 'koncertyPL', 4),
(29, 'Noc Kabaretowa', 'Kraków', 'Czarnowiejska', '12', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-29', '20:00:00', 'kabareciarzePL', 4),
(30, 'Wieczór z fortepianem', 'Poznań', 'Rynkowa', '12', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-01-03', '14:00:00', 'MuzycyKlasyczniPL', 7),
(31, 'Punk rock show', 'Kraków', 'Rostafińskiego', '22', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-02-19', '20:40:00', 'Galicja', 8),
(32, 'Wieczór filmowy', 'warszawa', 'Pszczelna', '12', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-02-26', '12:02:00', 'Kino Helios', 8),
(33, 'Koncert zespołu Radomka', 'Szczecin', 'Szczecińska', '1', NULL, 'Zapadł cichy wieczór już ucichł wiatru wiew\nGdzieś w oddali słychać harmonii tęskny śpiew\nBiegnę wąską dróżką co pośród gór się pnie\nTam pod jarzębiną dwóch chłopców czeka mnie\nJarzębino czerwona któremu serce mam dać\nJarzębino czerwona biednemu sercu radź\nJeden dzielny tokarz a drugi kowal zuch\nCóż mam biedna robić podoba mi się dwóch\nObaj tacy mili a każdy dzielny druh\nDroga jarzębino którego wybrać mów\nJarzębino czerwona któremu serce mam dać\nJarzębino czerwona biednemu sercu radź\nTylko jarzębina poradzić może mi\nJa nie mogę wybrać choć myślę tyle dni\nPrzeszła wiosna lato już jesień złotem lśni\nJuż się ze mnie śmieją dziewczęta z mojej wsi\nJarzębino czerwona któremu serce mam dać\nJarzębino czerwona biednemu sercu radź', '2022-01-14', '06:00:00', 'Wójt gminny Szczecin ', 8),
(34, 'Koncert CZERWONE JAGÓDKI', 'Szczebrzeszyn', 'Brak', '1024', NULL, 'Przyjdźcie proszę', '2022-01-09', '12:00:00', 'CZERWONE JAGÓDKI', 8),
(35, 'Wspólne oglądanie Harrego Pott', 'Londyn', 'Pokątna', '3', NULL, 'Wspólne oglądanie wszystkich części Harrego Pottera. Nie wyjdziesz póki nie skończysz', '2022-03-09', '07:30:00', 'Multikino', 8),
(36, 'Noc Kabaretowa', 'Kraków', 'Czarnowiejska', '12', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-03-08', '20:00:00', 'kabareciarzePL', 4),
(37, 'Punk rock show', 'Kraków', 'Rostafińskiego', '22', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-03-26', '20:40:00', 'Galicja', 8),
(38, 'koncert rockowy', 'Kraków', 'starowlisna', '33', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-02-22', '23:00:00', 'koncertyPl', 2),
(39, 'Wspólne oglądanie Harrego Pott', 'Londyn', 'Pokątna', '3', NULL, 'Wspólne oglądanie wszystkich części Harrego Pottera. Nie wyjdziesz póki nie skończysz', '2022-02-20', '07:30:00', 'Multikino', 8),
(40, 'koncert jazz', 'Kraków', 'Krakowska', '33', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras placerat et nisi vitae ultricies. Proin in vulputate tellus. Nulla et mauris nisl. Vivamus pellentesque justo metus, in lobortis nisi pulvinar nec. Nunc libero nisi, dignissim quis bibendum et, semper porta augue. Praesent aliquam semper egestas. Donec ornare ultricies ultrices. Ut quis urna viverra, vehicula nunc eu, pulvinar odio. Morbi varius erat sit amet eros facilisis blandit. Morbi finibus mauris justo. Nullam pretium dui eget nulla ultrices pretium. Mauris nec libero neque. Sed vel sagittis mauris. Nunc gravida mauris ligula, ac tincidunt purus facilisis non. Phasellus ullamcorper consequat tortor sit amet consequat.', '2022-04-06', '13:00:00', 'koncertyPl', 2),
(41, 'Koncert CZERWONE JAGÓDKI', 'Szczebrzeszyn', 'Brak', '1024', NULL, 'Przyjdźcie proszę', '2022-04-22', '12:00:00', 'CZERWONE JAGÓDKI', 8),
(42, 'Koncert zespołu Radomka', 'Szczecin', 'Szczecińska', '1', NULL, 'Zapadł cichy wieczór już ucichł wiatru wiew\r\nGdzieś w oddali słychać harmonii tęskny śpiew\r\nBiegnę wąską dróżką co pośród gór się pnie\r\nTam pod jarzębiną dwóch chłopców czeka mnie\r\nJarzębino czerwona któremu serce mam dać\r\nJarzębino czerwona biednemu sercu radź\r\nJeden dzielny tokarz a drugi kowal zuch\r\nCóż mam biedna robić podoba mi się dwóch\r\nObaj tacy mili a każdy dzielny druh\r\nDroga jarzębino którego wybrać mów\r\nJarzębino czerwona któremu serce mam dać\r\nJarzębino czerwona biednemu sercu radź\r\nTylko jarzębina poradzić może mi\r\nJa nie mogę wybrać choć myślę tyle dni\r\nPrzeszła wiosna lato już jesień złotem lśni\r\nJuż się ze mnie śmieją dziewczęta z mojej wsi\r\nJarzębino czerwona któremu serce mam dać\r\nJarzębino czerwona biednemu sercu radź', '2022-01-15', '06:00:00', 'Wójt gminny Szczecin ', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pools`
--

CREATE TABLE `pools` (
  `pool_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf32_polish_ci NOT NULL,
  `price` int(11) NOT NULL,
  `number_of_tickets` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `pools`
--

INSERT INTO `pools` (`pool_id`, `name`, `price`, `number_of_tickets`, `event_id`) VALUES
(27, 'pula1', 110, 100, 25),
(28, 'pula2', 150, 150, 25),
(29, 'Pula 1', 200, 100, 27),
(30, 'Pula 2 ', 250, 150, 27),
(31, 'Pula 1', 150, 100, 28),
(32, 'Pula 2', 200, 120, 28),
(33, 'Pula 1', 250, 400, 29),
(34, 'Miejsca VIP', 500, 20, 30),
(35, 'Miejsca standardowe', 200, 500, 30),
(36, 'Przed koncertem', 50, 200, 31),
(37, 'W dniu koncertu', 75, 200, 31),
(38, 'W czasie koncertu ', 20, 15, 31),
(39, 'Rzędy 1-5', 50, 50, 32),
(40, 'Rzędy 6-10', 30, 50, 32),
(41, 'Bilety', 20, 120, 34);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf32_polish_ci DEFAULT NULL,
  `surname` varchar(30) COLLATE utf32_polish_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `numberOfBoughtTickets` int(11) DEFAULT NULL,
  `mail` varchar(30) COLLATE utf32_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `event_id`, `user_id`, `name`, `surname`, `price`, `numberOfBoughtTickets`, `mail`) VALUES
(24, 29, 9, 'Jan', 'Kowalski', 750, 3, 'JanKowalski@gmail.com'),
(25, 30, 9, 'Antoni', 'Broni', 900, 3, 'Antoni@gmail.com'),
(26, 25, 5, 'Kasia', 'Kasiowska', 750, 5, 'Kasia@o2.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `surname` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `email` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `login` varchar(20) COLLATE utf32_polish_ci NOT NULL,
  `password` varchar(20) COLLATE utf32_polish_ci NOT NULL,
  `organizer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `email`, `login`, `password`, `organizer`) VALUES
(1, 'Andrzej', 'Kowalski', 'andrzej.kowalski@gmail.com', 'andrzej', 'kowalski', 0),
(2, 'Jan', 'Cebulka', 'jan.cebulka@gmail.com', 'jan', '123', 1),
(3, 'Mariusz', 'MaxKolonko', 'mariusz.maxkolonko@gmail.com', 'mariusz', '123', 1),
(4, 'Test', 'Test', 'Test@Test.com', 'test', 'test', 1),
(5, 'Test', 'Test', 'Test@Test.com', 'test', 'test', 0),
(6, 'Jan', 'Ser', 'JanekS@gmail.com', 'JanekS', 'test123', 1),
(7, 'Amadeusz', 'Mozart', 'mozart@muzyka.com', 'Mazart', '123', 1),
(8, 'Kuba', 'Rozpru', 'Rozpru@gmail.com', 'Kuba123', '123', 1),
(9, 'Adam', 'Darski', 'Adamo@wp.pl', 'Adam1', '123', 0);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indeksy dla tabeli `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indeksy dla tabeli `pools`
--
ALTER TABLE `pools`
  ADD PRIMARY KEY (`pool_id`);

--
-- Indeksy dla tabeli `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT dla tabeli `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT dla tabeli `pools`
--
ALTER TABLE `pools`
  MODIFY `pool_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT dla tabeli `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Baza danych: `faktury`
--
CREATE DATABASE IF NOT EXISTS `faktury` DEFAULT CHARACTER SET utf32 COLLATE utf32_polish_ci;
USE `faktury`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `adresy_email`
--

CREATE TABLE `adresy_email` (
  `adres_email_id` int(11) NOT NULL,
  `adres_email` text COLLATE latin2_bin NOT NULL,
  `klient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `adresy_email`
--

INSERT INTO `adresy_email` (`adres_email_id`, `adres_email`, `klient_id`) VALUES
(1, 'jan.kowalski@www.ww.pl', 1),
(2, 'j.kowalski@www.mailer.pl', 1),
(3, 'oi@wwwx.xwa.eu', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czas_obslugi`
--

CREATE TABLE `czas_obslugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `klient_id` int(11) NOT NULL,
  `miesiac` int(11) NOT NULL,
  `czas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Czas poswiecony obsludze klientow';

--
-- Zrzut danych tabeli `czas_obslugi`
--

INSERT INTO `czas_obslugi` (`id`, `klient_id`, `miesiac`, `czas`) VALUES
(1, 1, 1, 123),
(2, 1, 2, 225),
(3, 1, 3, 500),
(4, 2, 1, 100),
(5, 1, 4, 200),
(6, 2, 1, 333),
(7, 2, 1, 900),
(8, 3, 1, 1000),
(9, 3, 3, 1900),
(10, 1, 2, 1000),
(11, 2, 3, 500),
(12, 1, 1, 754);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury`
--

CREATE TABLE `faktury` (
  `faktura_id` int(11) NOT NULL,
  `opis` text COLLATE latin2_bin NOT NULL,
  `wartosc` float NOT NULL,
  `klient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `faktury`
--

INSERT INTO `faktury` (`faktura_id`, `opis`, `wartosc`, `klient_id`) VALUES
(1, 'Zakup komputera', 1122.11, 1),
(2, 'Za opal na zime', 1990.02, 1),
(3, 'Za dostawe paczki', 21.01, 2),
(4, 'Za nowy procesor', 3000, 3),
(5, 'Za naprawe pralki ', 156.12, 4),
(6, 'Za wymiane monitora', 280.84, 2),
(7, 'Za naprawe telewizora', 55.66, 2),
(8, 'Za naprawe opiekacza', 93.35, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `klient_id` int(11) NOT NULL,
  `imie` text COLLATE latin2_bin NOT NULL,
  `nazwisko` text COLLATE latin2_bin NOT NULL,
  `wiek` float NOT NULL,
  `miasto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`klient_id`, `imie`, `nazwisko`, `wiek`, `miasto_id`) VALUES
(1, 'Jan', 'Kowalski', 32, 1),
(2, 'Pawel', 'Nowak', 19, 3),
(3, 'Maria', 'Iksinska', 22, 5),
(4, 'Onufry', 'Igrekowski', 39, 3),
(5, 'Fafnucy', 'Zetak', 66, 2),
(6, 'Anastazy', 'Nowak', 21, 4),
(7, 'Apolinary', 'Nizinski', 50, 3),
(8, 'Anna', 'Kowal', 23, 2),
(9, 'Jan', 'Iksinski', 33, 8),
(10, 'Jan', 'Brown', 21, 3),
(11, 'Maria', 'Niska', 70, 1),
(12, 'Pawel', 'Wysoki', 39, 2);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `klienci_miasta`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `klienci_miasta` (
`miasto_id` int(11)
,`klient_id` int(11)
,`imie` text
,`nazwisko` text
,`wiek` float
,`nazwa_miasta` text
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasta`
--

CREATE TABLE `miasta` (
  `miasto_id` int(11) NOT NULL,
  `nazwa_miasta` text COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `miasta`
--

INSERT INTO `miasta` (`miasto_id`, `nazwa_miasta`) VALUES
(1, 'Krakow'),
(2, 'Warszawa'),
(3, 'Tarnow'),
(4, 'Tarnobrzeg'),
(5, 'Krosno'),
(6, 'Nysa'),
(7, 'Bielsko'),
(8, 'Opole');

-- --------------------------------------------------------

--
-- Struktura widoku `klienci_miasta`
--
DROP TABLE IF EXISTS `klienci_miasta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `klienci_miasta`  AS SELECT `klienci`.`miasto_id` AS `miasto_id`, `klienci`.`klient_id` AS `klient_id`, `klienci`.`imie` AS `imie`, `klienci`.`nazwisko` AS `nazwisko`, `klienci`.`wiek` AS `wiek`, `miasta`.`nazwa_miasta` AS `nazwa_miasta` FROM (`klienci` join `miasta` on(`klienci`.`miasto_id` = `miasta`.`miasto_id`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `adresy_email`
--
ALTER TABLE `adresy_email`
  ADD PRIMARY KEY (`adres_email_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- Indeksy dla tabeli `czas_obslugi`
--
ALTER TABLE `czas_obslugi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `faktury`
--
ALTER TABLE `faktury`
  ADD PRIMARY KEY (`faktura_id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`klient_id`),
  ADD KEY `miasto_id` (`miasto_id`);

--
-- Indeksy dla tabeli `miasta`
--
ALTER TABLE `miasta`
  ADD PRIMARY KEY (`miasto_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `adresy_email`
--
ALTER TABLE `adresy_email`
  MODIFY `adres_email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `czas_obslugi`
--
ALTER TABLE `czas_obslugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT dla tabeli `faktury`
--
ALTER TABLE `faktury`
  MODIFY `faktura_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `klient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `adresy_email`
--
ALTER TABLE `adresy_email`
  ADD CONSTRAINT `adresy_email_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klienci` (`klient_id`);

--
-- Ograniczenia dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD CONSTRAINT `klienci_ibfk_1` FOREIGN KEY (`miasto_id`) REFERENCES `miasta` (`miasto_id`);
--
-- Baza danych: `harmonogram`
--
CREATE DATABASE IF NOT EXISTS `harmonogram` DEFAULT CHARACTER SET utf32 COLLATE utf32_polish_ci;
USE `harmonogram`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `harmonogram`
--

CREATE TABLE `harmonogram` (
  `IDpracownika` int(11) NOT NULL,
  `IDkursanta` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `harmonogram`
--

INSERT INTO `harmonogram` (`IDpracownika`, `IDkursanta`, `ID`) VALUES
(1, 101, 1),
(2, 102, 1),
(3, 103, 2),
(4, 104, 3),
(1, 101, 3),
(3, 102, 1),
(5, 105, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jednostki`
--

CREATE TABLE `jednostki` (
  `IdJednostka` int(11) NOT NULL,
  `IdMiasto` int(11) DEFAULT NULL,
  `NazwaJednostki` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `jednostki`
--

INSERT INTO `jednostki` (`IdJednostka`, `IdMiasto`, `NazwaJednostki`) VALUES
(1, 1, 'Pierwsza Dywizja Pasikonikow'),
(2, 2, 'Druga Dywizja Pasikonikow'),
(3, 1, 'Szwadron rusalek'),
(4, NULL, 'Czwarta kolumna'),
(5, NULL, 'Super tajna dywizja KINGSIZE'),
(6, 5, 'Mniej tajna dywizja KINGSIZE'),
(7, 8, 'Jednostka szybkiego reagowania'),
(8, 9, 'Jednostka powolnego reagowania'),
(9, 1, 'Dywizjon maslakow'),
(10, 2, 'Brygada Borowiki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kursanci`
--

CREATE TABLE `kursanci` (
  `IDkursanta` int(11) NOT NULL,
  `NazwiskoKursanta` text COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `kursanci`
--

INSERT INTO `kursanci` (`IDkursanta`, `NazwiskoKursanta`) VALUES
(101, 'Alin'),
(102, 'Balin'),
(103, 'Celin'),
(104, 'Delin'),
(105, 'Elin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasta`
--

CREATE TABLE `miasta` (
  `IdMiasto` int(11) NOT NULL,
  `NazwaMiasta` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `miasta`
--

INSERT INTO `miasta` (`IdMiasto`, `NazwaMiasta`) VALUES
(1, 'Krakow'),
(2, 'Warszawa'),
(3, 'Mielec'),
(4, 'Wojslawice'),
(5, 'Kluczbork'),
(6, 'Katowice'),
(7, 'Konin'),
(8, 'Annopol'),
(9, 'Wieliczka'),
(10, 'Elblag');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opłaty`
--

CREATE TABLE `opłaty` (
  `Zajęcia` text COLLATE latin2_bin NOT NULL,
  `Opłata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `opłaty`
--

INSERT INTO `opłaty` (`Zajęcia`, `Opłata`) VALUES
('Robótki ręczne', 90),
('Kowalstwo artystyczne', 180),
('Cerowanie kolczug', 150),
('Lepienie garnków', 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `IdOsoba` int(11) NOT NULL,
  `IdStopien` int(11) NOT NULL,
  `IdJednostka` int(11) NOT NULL,
  `Imie` varchar(128) COLLATE latin2_bin NOT NULL,
  `Nazwisko` varchar(200) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `osoby`
--

INSERT INTO `osoby` (`IdOsoba`, `IdStopien`, `IdJednostka`, `Imie`, `Nazwisko`) VALUES
(1, 9, 1, 'Adrian', 'Koszalek-Opalek'),
(2, 8, 1, 'Pawel', 'Wikliniusz'),
(3, 8, 1, 'Ambrozy', 'Pokrzywka'),
(4, 7, 1, 'Apolinary', 'Pimpek'),
(5, 1, 1, 'Jan', 'Owieczka'),
(6, 1, 1, 'Marian', 'Salatka'),
(7, 1, 1, 'Pawel', 'Gawlicki'),
(8, 1, 2, 'Remidiusz', 'Kicak'),
(9, 3, 1, 'Onufry', 'Zaplatacz'),
(10, 4, 2, 'Waldemar', 'Pracus'),
(11, 1, 2, 'Jan', 'Przycinak'),
(12, 1, 5, 'Zenon', 'Tajny'),
(13, 6, 4, 'Jeremiusz', 'Niski'),
(14, 5, 4, 'Jeremiusz', 'Wysoki'),
(15, 6, 6, 'Pawel', 'Przeszkadzac'),
(16, 4, 7, 'Bodan', 'Bogus'),
(17, 8, 3, 'Norbert', 'Szybki'),
(18, 7, 4, 'Gerwazy', 'Cicho'),
(19, 7, 6, 'John', 'Pamietacz'),
(20, 8, 5, 'Jan', 'Zapominacz'),
(21, 2, 5, 'Mariusz', 'Znikacz'),
(22, 1, 4, 'Jan', 'Bruzdziciel'),
(23, 1, 1, 'Pawel', 'Gawlicki'),
(24, 3, 2, 'Onufry', 'Zaplatacz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podlega`
--

CREATE TABLE `podlega` (
  `IdOsobaKomuPodlega` int(11) NOT NULL,
  `IdOsobaKtoPodlega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `podlega`
--

INSERT INTO `podlega` (`IdOsobaKomuPodlega`, `IdOsobaKtoPodlega`) VALUES
(1, 2),
(1, 3),
(1, 17),
(1, 20),
(3, 4),
(4, 9),
(9, 5),
(9, 6),
(9, 7),
(10, 11),
(1, 18),
(18, 13),
(13, 14),
(14, 22),
(20, 21),
(20, 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `IDpracownika` int(11) NOT NULL,
  `NazwiskoPracownika` text COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`IDpracownika`, `NazwiskoPracownika`) VALUES
(1, 'Kowalski'),
(2, 'Nowak'),
(3, 'Nowicki'),
(4, 'Kowalska'),
(5, 'Damięcki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stopnie`
--

CREATE TABLE `stopnie` (
  `IdStopien` int(11) NOT NULL,
  `NazwaStopnia` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `stopnie`
--

INSERT INTO `stopnie` (`IdStopien`, `NazwaStopnia`) VALUES
(1, 'Skrzat'),
(2, 'Starszy Skrzat'),
(3, 'Starszy Skrzat Domowy'),
(4, 'Cwierc-szyszkownik'),
(5, 'Pol-szyszkownik'),
(6, 'Szyszkownik'),
(7, 'Nad-szyszkownik'),
(8, 'Nad-szyszkownik Domowy'),
(9, 'Krasnolud');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zajęcia`
--

CREATE TABLE `zajęcia` (
  `ID` int(11) NOT NULL,
  `Zajęcia` text COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `zajęcia`
--

INSERT INTO `zajęcia` (`ID`, `Zajęcia`) VALUES
(1, 'Robótki ręczne'),
(2, 'Kowalstwo artystyczne'),
(3, 'Cerowanie kolczug'),
(4, 'Lepienie garnków');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  ADD PRIMARY KEY (`IdJednostka`),
  ADD KEY `IdMiasto` (`IdMiasto`);

--
-- Indeksy dla tabeli `miasta`
--
ALTER TABLE `miasta`
  ADD PRIMARY KEY (`IdMiasto`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`IdOsoba`),
  ADD KEY `IdStopien` (`IdStopien`),
  ADD KEY `IdJednostka` (`IdJednostka`);

--
-- Indeksy dla tabeli `podlega`
--
ALTER TABLE `podlega`
  ADD KEY `IdOsobaKomuPodlega` (`IdOsobaKomuPodlega`),
  ADD KEY `IdOsobaKtoPodlega` (`IdOsobaKtoPodlega`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`IDpracownika`);

--
-- Indeksy dla tabeli `stopnie`
--
ALTER TABLE `stopnie`
  ADD PRIMARY KEY (`IdStopien`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  MODIFY `IdJednostka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `miasta`
--
ALTER TABLE `miasta`
  MODIFY `IdMiasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `IdOsoba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `stopnie`
--
ALTER TABLE `stopnie`
  MODIFY `IdStopien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  ADD CONSTRAINT `Jednostki_ibfk_1` FOREIGN KEY (`IdMiasto`) REFERENCES `miasta` (`IdMiasto`);

--
-- Ograniczenia dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD CONSTRAINT `Osoby_ibfk_1` FOREIGN KEY (`IdStopien`) REFERENCES `stopnie` (`IdStopien`),
  ADD CONSTRAINT `Osoby_ibfk_2` FOREIGN KEY (`IdJednostka`) REFERENCES `jednostki` (`IdJednostka`);

--
-- Ograniczenia dla tabeli `podlega`
--
ALTER TABLE `podlega`
  ADD CONSTRAINT `Podlega_ibfk_1` FOREIGN KEY (`IdOsobaKomuPodlega`) REFERENCES `osoby` (`IdOsoba`),
  ADD CONSTRAINT `Podlega_ibfk_2` FOREIGN KEY (`IdOsobaKtoPodlega`) REFERENCES `osoby` (`IdOsoba`);
--
-- Baza danych: `kursy`
--
CREATE DATABASE IF NOT EXISTS `kursy` DEFAULT CHARACTER SET utf32 COLLATE utf32_polish_ci;
USE `kursy`;
--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Zrzut danych tabeli `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'events.com', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"artists\",\"artists_in_events\",\"events\",\"pools\",\"tickets\",\"users\"],\"table_structure[]\":[\"artists\",\"artists_in_events\",\"events\",\"pools\",\"tickets\",\"users\"],\"table_data[]\":[\"artists\",\"artists_in_events\",\"events\",\"pools\",\"tickets\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'server', 'events_com', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"events.com\",\"faktury\",\"harmonogram\",\"kursy\",\"phpmyadmin\",\"szuflandia\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktura tabeli @TABLE@\",\"latex_structure_continued_caption\":\"Struktura tabeli @TABLE@ (kontynuacja)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Zawartość tabeli @TABLE@\",\"latex_data_continued_caption\":\"Zawartość tabeli @TABLE@ (kontynuacja)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"events.com\",\"table\":\"events\"},{\"db\":\"events.com\",\"table\":\"users\"},{\"db\":\"events.com\",\"table\":\"pools\"},{\"db\":\"events.com\",\"table\":\"tickets\"},{\"db\":\"events.com\",\"table\":\"artists_in_events\"},{\"db\":\"events.com\",\"table\":\"artists\"},{\"db\":\"faktury\",\"table\":\"klienci_miasta\"},{\"db\":\"faktury\",\"table\":\"faktury\"},{\"db\":\"szuflandia\",\"table\":\"osoby\"},{\"db\":\"harmonogram\",\"table\":\"zaj\\u0119cia\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'events.com', 'users', '{\"sorted_col\":\"`users`.`user_id` ASC\"}', '2022-01-09 13:11:20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-01-24 13:48:58', '{\"Console\\/Mode\":\"show\",\"lang\":\"pl\",\"NavigationWidth\":225,\"Console\\/Height\":13.98599999999999}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeksy dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeksy dla tabeli `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeksy dla tabeli `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeksy dla tabeli `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeksy dla tabeli `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeksy dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeksy dla tabeli `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeksy dla tabeli `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeksy dla tabeli `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeksy dla tabeli `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeksy dla tabeli `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeksy dla tabeli `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Baza danych: `szuflandia`
--
CREATE DATABASE IF NOT EXISTS `szuflandia` DEFAULT CHARACTER SET utf32 COLLATE utf32_polish_ci;
USE `szuflandia`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `jednostki`
--

CREATE TABLE `jednostki` (
  `IdJednostka` int(11) NOT NULL,
  `IdMiasto` int(11) DEFAULT NULL,
  `NazwaJednostki` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `jednostki`
--

INSERT INTO `jednostki` (`IdJednostka`, `IdMiasto`, `NazwaJednostki`) VALUES
(1, 1, 'Pierwsza Dywizja Pasikonikow'),
(2, 2, 'Druga Dywizja Pasikonikow'),
(3, 1, 'Szwadron rusalek'),
(4, NULL, 'Czwarta kolumna'),
(5, NULL, 'Super tajna dywizja KINGSIZE'),
(6, 5, 'Mniej tajna dywizja KINGSIZE'),
(7, 8, 'Jednostka szybkiego reagowania'),
(8, 9, 'Jednostka powolnego reagowania'),
(9, 1, 'Dywizjon maslakow'),
(10, 2, 'Brygada Borowiki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miasta`
--

CREATE TABLE `miasta` (
  `IdMiasto` int(11) NOT NULL,
  `NazwaMiasta` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `miasta`
--

INSERT INTO `miasta` (`IdMiasto`, `NazwaMiasta`) VALUES
(1, 'Krakow'),
(2, 'Warszawa'),
(3, 'Mielec'),
(4, 'Wojslawice'),
(5, 'Kluczbork'),
(6, 'Katowice'),
(7, 'Konin'),
(8, 'Annopol'),
(9, 'Wieliczka'),
(10, 'Elblag');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `IdOsoba` int(11) NOT NULL,
  `IdStopien` int(11) NOT NULL,
  `IdJednostka` int(11) NOT NULL,
  `Imie` varchar(128) COLLATE latin2_bin NOT NULL,
  `Nazwisko` varchar(200) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `osoby`
--

INSERT INTO `osoby` (`IdOsoba`, `IdStopien`, `IdJednostka`, `Imie`, `Nazwisko`) VALUES
(1, 9, 1, 'Adrian', 'Koszalek-Opalek'),
(2, 8, 1, 'Pawel', 'Wikliniusz'),
(3, 8, 1, 'Ambrozy', 'Pokrzywka'),
(4, 7, 1, 'Apolinary', 'Pimpek'),
(5, 1, 1, 'Jan', 'Owieczka'),
(6, 1, 1, 'Marian', 'Salatka'),
(7, 1, 1, 'Pawel', 'Gawlicki'),
(8, 1, 2, 'Remidiusz', 'Kicak'),
(9, 3, 1, 'Onufry', 'Zaplatacz'),
(10, 4, 2, 'Waldemar', 'Pracus'),
(11, 1, 2, 'Jan', 'Przycinak'),
(12, 1, 5, 'Zenon', 'Tajny'),
(13, 6, 4, 'Jeremiusz', 'Niski'),
(14, 5, 4, 'Jeremiusz', 'Wysoki'),
(15, 6, 6, 'Pawel', 'Przeszkadzac'),
(16, 4, 7, 'Bodan', 'Bogus'),
(17, 8, 3, 'Norbert', 'Szybki'),
(18, 7, 4, 'Gerwazy', 'Cicho'),
(19, 7, 6, 'John', 'Pamietacz'),
(20, 8, 5, 'Jan', 'Zapominacz'),
(21, 2, 5, 'Mariusz', 'Znikacz'),
(22, 1, 4, 'Jan', 'Bruzdziciel'),
(23, 1, 1, 'Pawel', 'Gawlicki'),
(24, 3, 2, 'Onufry', 'Zaplatacz');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `podlega`
--

CREATE TABLE `podlega` (
  `IdOsobaKomuPodlega` int(11) NOT NULL,
  `IdOsobaKtoPodlega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `podlega`
--

INSERT INTO `podlega` (`IdOsobaKomuPodlega`, `IdOsobaKtoPodlega`) VALUES
(1, 2),
(1, 3),
(1, 17),
(1, 20),
(3, 4),
(4, 9),
(9, 5),
(9, 6),
(9, 7),
(10, 11),
(1, 18),
(18, 13),
(13, 14),
(14, 22),
(20, 21),
(20, 12);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stopnie`
--

CREATE TABLE `stopnie` (
  `IdStopien` int(11) NOT NULL,
  `NazwaStopnia` varchar(128) COLLATE latin2_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2 COLLATE=latin2_bin;

--
-- Zrzut danych tabeli `stopnie`
--

INSERT INTO `stopnie` (`IdStopien`, `NazwaStopnia`) VALUES
(1, 'Skrzat'),
(2, 'Starszy Skrzat'),
(3, 'Starszy Skrzat Domowy'),
(4, 'Cwierc-szyszkownik'),
(5, 'Pol-szyszkownik'),
(6, 'Szyszkownik'),
(7, 'Nad-szyszkownik'),
(8, 'Nad-szyszkownik Domowy'),
(9, 'Krasnolud');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  ADD PRIMARY KEY (`IdJednostka`),
  ADD KEY `IdMiasto` (`IdMiasto`);

--
-- Indeksy dla tabeli `miasta`
--
ALTER TABLE `miasta`
  ADD PRIMARY KEY (`IdMiasto`);

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`IdOsoba`),
  ADD KEY `IdStopien` (`IdStopien`),
  ADD KEY `IdJednostka` (`IdJednostka`);

--
-- Indeksy dla tabeli `podlega`
--
ALTER TABLE `podlega`
  ADD KEY `IdOsobaKomuPodlega` (`IdOsobaKomuPodlega`),
  ADD KEY `IdOsobaKtoPodlega` (`IdOsobaKtoPodlega`);

--
-- Indeksy dla tabeli `stopnie`
--
ALTER TABLE `stopnie`
  ADD PRIMARY KEY (`IdStopien`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  MODIFY `IdJednostka` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `miasta`
--
ALTER TABLE `miasta`
  MODIFY `IdMiasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `IdOsoba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `stopnie`
--
ALTER TABLE `stopnie`
  MODIFY `IdStopien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `jednostki`
--
ALTER TABLE `jednostki`
  ADD CONSTRAINT `Jednostki_ibfk_1` FOREIGN KEY (`IdMiasto`) REFERENCES `miasta` (`IdMiasto`);

--
-- Ograniczenia dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD CONSTRAINT `Osoby_ibfk_1` FOREIGN KEY (`IdStopien`) REFERENCES `stopnie` (`IdStopien`),
  ADD CONSTRAINT `Osoby_ibfk_2` FOREIGN KEY (`IdJednostka`) REFERENCES `jednostki` (`IdJednostka`);

--
-- Ograniczenia dla tabeli `podlega`
--
ALTER TABLE `podlega`
  ADD CONSTRAINT `Podlega_ibfk_1` FOREIGN KEY (`IdOsobaKomuPodlega`) REFERENCES `osoby` (`IdOsoba`),
  ADD CONSTRAINT `Podlega_ibfk_2` FOREIGN KEY (`IdOsobaKtoPodlega`) REFERENCES `osoby` (`IdOsoba`);
--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
