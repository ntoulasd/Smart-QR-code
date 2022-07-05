-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: localhost:3306
-- Χρόνος δημιουργίας: 01 Απρ 2022 στις 13:47:43
-- Έκδοση διακομιστή: 10.3.34-MariaDB-log
-- Έκδοση PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `xromio_smartcity`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `city`
--

CREATE TABLE `city` (
  `id` int(4) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 NOT NULL,
  `logo` varchar(256) CHARACTER SET utf8 NOT NULL,
  `url` varchar(256) CHARACTER SET utf32 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `city`
--

INSERT INTO `city` (`id`, `name`, `logo`, `url`) VALUES
(1, 'Δήμος Κοζάνης', 'https://cityofkozani.gov.gr/image/layout_set_logo?img_id=541558&t=1648707697997', 'https://cityofkozani.gov.gr'),
(2, 'Πανεπιστήμιο Δυτικής Μακεδονίας', 'https://www.uowm.gr/wp-content/uploads/2020/05/logo_el.png', 'https://www.uowm.gr/'),
(3, 'qr code wikipedia', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/%CE%9A%CF%8E%CE%B4%CE%B9%CE%BA%CE%B1%CF%82_qr.PNG/220px-%CE%9A%CF%8E%CE%B4%CE%B9%CE%BA%CE%B1%CF%82_qr.PNG', 'https://el.wikipedia.org/wiki/%CE%9A%CF%8E%CE%B4%CE%B9%CE%BA%CE%B1%CF%82_QR');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `qr`
--

CREATE TABLE `qr` (
  `id` int(12) NOT NULL,
  `qr` varchar(256) CHARACTER SET utf8 NOT NULL,
  `text` varchar(2048) CHARACTER SET utf8 NOT NULL,
  `city` int(4) NOT NULL,
  `service` int(4) NOT NULL,
  `options` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `qr`
--

INSERT INTO `qr` (`id`, `qr`, `text`, `city`, `service`, `options`) VALUES
(1, 'kzk1', 'Κάδος 1', 1, 1, 1),
(2, 'kzp1', 'Πράσινο πλατείας Ειρήνης', 1, 2, 1),
(3, 'uwm', 'Πανεπιστήμιο Δυτικής Μακεδονίας', 2, 0, 2),
(4, 'kzt1', 'Το Καμπαναριό του Αγ. Νικολάου\r\n<br>\r\nΤο Σύμβολο της Κοζάνης\r\n<br>\r\nΕξαιρετικό θρησκευτικό και αρχιτεκτονικό μνημείο. Εδώ και δεκάδες χρόνια αποτελεί σημείο ενδιαφέροντος και συνάντησης της πόλης. Βρίσκετε στην κεντρική πλατεία της Κοζάνης. Το ρολόι έγινε προσφορά το 1939 από τον Κωνσταντίνο Μαμάτσιο, έμπορο μετανάστη στις ΗΠΑ.\r\n<br>\r\n<img src=\'https://media-cdn.tripadvisor.com/media/photo-s/14/52/cf/76/caption.jpg\'>', 1, 0, 3),
(5, 'info1', 'QR code wiki', 3, 0, 2);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `service`
--

CREATE TABLE `service` (
  `id` int(4) NOT NULL,
  `text` varchar(256) CHARACTER SET utf8 NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 NOT NULL,
  `phonetitle` varchar(256) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(16) CHARACTER SET utf8 NOT NULL,
  `url` varchar(256) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `service`
--

INSERT INTO `service` (`id`, `text`, `email`, `phonetitle`, `phone`, `url`) VALUES
(1, 'Τμήμα Καθαριότητας\r\n<br>\r\nΔιεύθυνση: Πλατεία 28ης Οκτωβρίου 1, 50131, Κοζάνη\r\n', 'kathariotita@cityofkozani.gov.gr', 'Γραφείο Σχεδιασμού και Διοικητικής Υποστήριξης & Γραφείο Ανακύκλωσης', '2461350442', 'https://cityofkozani.gov.gr/katharioteta'),
(2, 'Τμήμα Πρασίνου και Περιβαλλοντικής Διαχείρισης\r\n<br>\r\nΔιεύθυνση: Πλατεία 28ης Οκτωβρίου 1, 50131, Κοζάνη', 'tmima.prasinou@cityofkozani.gov.gr', 'Γραμματεία', '2461350462 ', 'https://cityofkozani.gov.gr/choroi-prasinou');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `qr`
--
ALTER TABLE `qr`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `city`
--
ALTER TABLE `city`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `qr`
--
ALTER TABLE `qr`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT για πίνακα `service`
--
ALTER TABLE `service`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
