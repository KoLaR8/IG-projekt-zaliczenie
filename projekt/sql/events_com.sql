-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 05 Sty 2022, 23:12
-- Wersja serwera: 10.4.19-MariaDB
-- Wersja PHP: 7.3.28

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

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artists`
--

CREATE TABLE `artists` (
  `artist_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf32_polish_ci NOT NULL,
  `surname` varchar(30) COLLATE utf32_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artists_in_events`
--

CREATE TABLE `artists_in_events` (
  `artist_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

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
  `date` datetime NOT NULL,
  `organizer` varchar(30) COLLATE utf32_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_polish_ci;

--
-- Zrzut danych tabeli `events`
--

INSERT INTO `events` (`event_id`, `name`, `city`, `street`, `building_number`, `image`, `description`, `date`, `organizer`) VALUES
(1, 'asdasd', 'Krakow', 'Nijaka', '69', NULL, 'asdasd', '2020-10-10 00:00:00', 'Jakis smiec'),
(2, 'asdasd', 'Krakow', 'Nijaka', '69', NULL, 'asdasdasdasdadasd', '2020-10-10 00:00:00', 'Jakis smiec'),
(3, 'asdasd', 'Krakow', 'Nijaka', '69', NULL, 'asdasdasdasdadasdsdssssssssssssssssssss', '2020-10-10 00:00:00', 'Jakis smiec'),
(4, 'asdasddssda', 'Krakow', 'Nijaka', '69', NULL, 'asdasdasdasdadasdsdssssssssssssssssssssasdasdasd', '2020-10-10 00:00:00', 'Jakis smiec'),
(5, 'asdasddssda', 'Krakow', 'Nijaka', '69', NULL, 'asdasdasdasdadasdsdssssssssssssssssssssasdasdasd', '2020-10-10 00:00:00', 'Jakis smiec'),
(6, 'asdasddssdaa', 'Krakow', 'Nijaka', '69', NULL, 'asdasdasdasdadasdsdssssssssssssssssssssasdasdasd', '2020-10-10 00:00:00', 'Jakis smiec');

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
(2, 1, 1, 'asd', 'asd', 0, 0, 'asd'),
(3, 1, 1, 'asd', 'asd', 0, 0, 'asd'),
(4, 1, 1, 'asd', 'asd', 0, 0, 'asd'),
(5, 1, 1, 'asdaaaaaaa', 'asdaaaaaaa', 0, 0, 'asdaaaaaaa'),
(6, 1, 1, 'asdaaaaaaa', 'asdaaaaaaa', 0, 0, 'asdaaaaaaa'),
(7, 1, 1, 'asdaaaaaaa', 'asdaaaaaaa', 0, 0, 'asdaaaaaaa');

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
(1, 'Adam', 'Nowak', 'adam.nowak@email.com', 'adamN', 'haslo123', 0),
(2, 'Borys', 'Szyc', 'bor.szyc@email.com', 'borysS', 'haslo123', 1),
(3, 'Tomasz', 'Karolak', 'bor.szyc@email.com', 'borysS', 'haslo123', 1),
(4, 'Tomasz', 'Karolak', 'bor.szyc@email.com', 'borysS', 'haslo123', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indeksy dla tabeli `artists_in_events`
--
ALTER TABLE `artists_in_events`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `event_id` (`event_id`);

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
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `pools`
--
ALTER TABLE `pools`
  MODIFY `pool_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `artists_in_events`
--
ALTER TABLE `artists_in_events`
  ADD CONSTRAINT `artists_in_events_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  ADD CONSTRAINT `artists_in_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);

--
-- Ograniczenia dla tabeli `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
