-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 14 2022 г., 20:45
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `intervolga`
--

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`event_id`, `Name`, `Date`) VALUES
(12, 'Первенство Фролово', '2022-04-05'),
(13, 'Первенство Иловли', '2022-04-05'),
(14, 'Первенство Волгограда', '2022-04-01'),
(16, 'Первенство Москвы', '2022-03-02'),
(17, 'Первенство России', '2022-04-21');

-- --------------------------------------------------------

--
-- Структура таблицы `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `ФИО` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `birthday` date NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `passport` varchar(6) NOT NULL,
  `average_point` tinyint(3) NOT NULL,
  `biography` text NOT NULL,
  `video` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `players`
--

INSERT INTO `players` (`player_id`, `ФИО`, `email`, `number`, `birthday`, `date_create`, `passport`, `average_point`, `biography`, `video`) VALUES
(4, 'Иванов', 'ivanov@gmail.com', 1234567890, '2022-04-05', '2022-04-14 18:28:50', '123456', 1, 'qwerty', 0x322f0d0a3129205361737320576976657320697320576f6d616e205368652069732054726176656c7320746f20746865204b756e612069736c616e640d0a32295368652073746179206f6e207468772069736c616e64207769746820416e61204c69646120616e64206865722068757362616e6420446965676f0d0a3329536865206c6976657320696e20746865206875742c2073686520736c6565707320696e207468652068616d6d6f636b2c20736865207765617273204b756e6120636c6f74686573206168642068656c70732077697468206a6f62732061726f756e642074686520686f6d652e0d0a0d0a0d0a0d0a0d0a0d0a),
(5, 'Petrov', 'petrov@gmail.com', 987654321, '2022-04-02', '2022-04-14 18:29:01', '654321', 1, 'ytrewq', 0x322f0d0a3129205361737320576976657320697320576f6d616e205368652069732054726176656c7320746f20746865204b756e612069736c616e640d0a32295368652073746179206f6e207468772069736c616e64207769746820416e61204c69646120616e64206865722068757362616e6420446965676f0d0a3329536865206c6976657320696e20746865206875742c2073686520736c6565707320696e207468652068616d6d6f636b2c20736865207765617273204b756e6120636c6f74686573206168642068656c70732077697468206a6f62732061726f756e642074686520686f6d652e0d0a0d0a0d0a0d0a0d0a0d0a),
(6, 'Sidorov', 'sidorov@gmail.com', 345321567, '2022-04-12', '2022-04-14 18:29:43', '345215', 1, 'wertqw', 0x322f0d0a3129205361737320576976657320697320576f6d616e205368652069732054726176656c7320746f20746865204b756e612069736c616e640d0a32295368652073746179206f6e207468772069736c616e64207769746820416e61204c69646120616e64206865722068757362616e6420446965676f0d0a3329536865206c6976657320696e20746865206875742c2073686520736c6565707320696e207468652068616d6d6f636b2c20736865207765617273204b756e6120636c6f74686573206168642068656c70732077697468206a6f62732061726f756e642074686520686f6d652e0d0a0d0a0d0a0d0a0d0a0d0a);

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

CREATE TABLE `results` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `results`
--

INSERT INTO `results` (`id`, `player_id`, `event_id`, `result`) VALUES
(11, 5, 16, 1),
(12, 5, 14, 2),
(13, 5, 13, 3),
(14, 5, 12, 4),
(15, 5, 17, 5),
(17, 6, 14, 3),
(18, 6, 13, 2),
(19, 6, 12, 1),
(20, 6, 17, 6),
(21, 4, 14, 3),
(22, 4, 16, 7),
(23, 4, 17, 1),
(24, 5, 12, 2),
(25, 4, 12, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD UNIQUE KEY `Name` (`Name`) USING HASH;

--
-- Индексы таблицы `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Индексы таблицы `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `result` (`result`),
  ADD KEY `result_2` (`result`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `results`
--
ALTER TABLE `results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
