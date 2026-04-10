-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2026 at 03:33 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoplightnovel2x`
--

-- --------------------------------------------------------

--
-- Table structure for table `canceled_items`
--

CREATE TABLE `canceled_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_buy` decimal(15,2) NOT NULL,
  `cancel_reason` text,
  `canceled_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `canceled_items`
--

INSERT INTO `canceled_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price_at_buy`, `cancel_reason`, `canceled_at`) VALUES
(1, 3, 3, 'Arya Bàn Bên - Vol 1', 1, '85000.00', 'Thay đổi số lượng trong một sản phẩm', '2026-03-31 19:24:56'),
(2, 3, 4, 'Arya Bàn Bên - Vol 2', 1, '95000.00', 'Thay đổi số lượng trong một sản phẩm', '2026-03-31 19:24:56');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(3, 'Rom-Com / Học đường', '.'),
(4, 'Đời thường / Game', '.'),
(5, 'Trinh thám / Tâm lý', '.'),
(8, 'Horror/Fantasy', '.'),
(9, 'Slice of Life', '.'),
(10, 'Sci-Fi', '.'),
(11, 'Historical ', '.');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `fullname`, `email`, `subject`, `message`, `status`, `created_at`) VALUES
(1, 'Shiina Mahiru', '123@gmail.com', '...', 'Niceヾ(≧▽≦*)o', 0, '2026-03-17 15:55:46'),
(2, 'Miku', 'Miku@gmail.com', '...', 'Good job(●\'◡\'●)', 0, '2026-03-17 16:00:48'),
(3, 'Sakura', 'Sakura@gmail.com', '...', 'Nice(❁´◡`❁)', 0, '2026-03-17 20:36:10'),
(4, 'Lucy', 'Lucy@gmail.com', 'Experience', 'Nice:D', 0, '2026-03-18 16:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname_guest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_guest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,2) DEFAULT NULL,
  `status` enum('chờ xác nhận','đã xác nhận','đang giao','đã giao','huỷ') COLLATE utf8mb4_unicode_ci DEFAULT 'đã giao',
  `cancel_reason` text COLLATE utf8mb4_unicode_ci,
  `cancel_request` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname_guest`, `email_guest`, `order_date`, `total_price`, `status`, `cancel_reason`, `cancel_request`) VALUES
(1, 5, 'Lucy', 'Lucy@gmail.com', '2026-03-28 15:17:00', '780000.00', 'đang giao', NULL, 0),
(2, 6, 'Inori', 'inori@gmail.com', '2026-03-30 13:47:59', '2151000.00', 'đã xác nhận', NULL, 0),
(3, 7, 'Iriya', 'iriya@gmail.com', '2026-03-31 12:23:38', '180000.00', 'huỷ', 'Thay đổi số lượng trong một sản phẩm', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price_at_buy` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `price_at_buy`) VALUES
(1, 7, 2, '165000.00'),
(1, 8, 1, '450000.00'),
(2, 1, 1, '85000.00'),
(2, 6, 2, '808000.00'),
(2, 8, 1, '450000.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT '50',
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('hiện','ẩn') COLLATE utf8mb4_unicode_ci DEFAULT 'hiện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `stock_quantity`, `description`, `image_id`, `status`) VALUES
(1, 3, 'Thiên Sứ Nhà Bên - Vol 1', '85000.00', 9, 'Thiên sứ nhà bên (Otonari no Tenshi-sama) kể về Amane, một nam sinh sống một mình, tình cờ đưa ô cho Mahiru người sỡ hữu thành tích mọi mặt nhất trường vào một ngày mưa. Nhờ hành động đó, Mahiru bắt đầu chăm sóc, nấu ăn cho Amane, từ đó cả hai phát triển mối quan hệ tình cảm, chữa lành những vết thương tâm lý và dần thay đổi bản thân theo hướng tích cực hơn', 'thiensu_v1.jpg', 'hiện'),
(2, 3, 'Thiên Sứ Nhà Bên - Vol 2', '95000.00', 10, 'Mối quan hệ giữa hai người dần trở nên thân thiết hơn.', 'thiensu_v2.jpg', 'hiện'),
(3, 3, 'Arya Bàn Bên - Vol 1', '85000.00', 10, '\"Arya Bàn Bên Thỉnh Thoảng Lại Trêu Ghẹo Tôi Bằng Tiếng Nga\" là câu chuyện tình học đường hài hước giữa Alisa Mikhailovna Kujō (Arya), nữ sinh người Nhật gốc Nga, tài năng, và người bạn cùng lớp Kuze Masachika. Arya thường dùng tiếng Nga để che giấu sự thẹn thùng khi trêu chọc Kuze, không biết rằng cậu thực chất hiểu được ngôn ngữ này, tạo nên những tình những tình huống ngại ngùng.', 'arya_v1.jpg', 'hiện'),
(4, 3, 'Arya Bàn Bên - Vol 2', '95000.00', 10, 'Masachika liệu có hiểu được những gì Arya đang nói?', 'arya_v2.jpg', 'hiện'),
(5, 4, 'Netoge no Yome ga Ninki Idol datta ken ~Cool-kei no kanojo wa genjitsu demo yome no tsumori de iru~ - Vol 1', '110000.00', 10, 'Câu chuyện tình cờ giữa Ayanokouji Kazuto – một nam sinh bình thường và Mizuki Rinka – một thần tượng nổi tiếng. Cả hai vốn là \"Cặp đôi\" trong một tựa game online, nhưng sự thật chỉ được phơi bày khi họ quyết định gặp mặt ngoài đời thực. Mối quan hệ của họ dần bước ra khỏi màn hình máy tính. Tình cảm của họ sẽ đi về đâu khi ranh giới giữa game và đời thực dần xóa nhòa?', 'idol_v1.jpg', 'hiện'),
(6, 5, 'Another Monster', '808000.00', 8, '\"Cuốn tiểu thuyết trinh thám tâm lý không thể thiếu đối với bất kỳ fan hâm mộ nào của bộ truyện Monster. Dưới góc nhìn của nhà báo Werner Weber, độc giả sẽ được dẫn dắt qua những góc khuất chưa từng được tiết lộ trong Manga/Anime. Từ những bí mật tại Kinderheim 511 đến quá khứ xa xăm tại Tiệp Khắc, mỗi trang sách là một manh mối đưa bạn đến gần hơn với chân dung của \'Kẻ không tên\'. Một tuyệt tác lấp đầy những khoảng trống cuối cùng của huyền thoại.\"', 'monster.jpg', 'hiện'),
(7, 8, 'Another Episode S', '165000.00', 8, 'Another Episode S không chỉ là một cuốn ngoại truyện, mà là chìa khóa mở ra những góc khuất tâm linh chưa từng được kể về nữ chính Misaki Mei. Trong khi Sakakibara đang phải chống chọi với lời nguyền tại Yomiyama, Mei đã có một chuyến nghỉ hè đầy ám ảnh tại một vùng biệt thự hẻo lánh – nơi cô gặp gỡ một \"linh hồn\" đang tìm kiếm chính xác cái chết của mình.', 'Another Episode S.jpg', 'hiện'),
(8, 8, 'KIZUMONOGATARI: Wound Tale', '450000.00', 8, 'Kizumonogatari là phần tiền truyện đầy kịch tính mở đầu cho toàn bộ dòng đời của nam sinh Koyomi Araragi trong series Monogatari đình đám của tác giả NISIOISIN. Câu chuyện đưa độc giả quay ngược về kỳ nghỉ xuân định mệnh, nơi Araragi tình cờ bắt gặp Kiss-shot Acerola-orion Heart-under-blade – một nữ vương ma cà rồng huyền thoại đang thoi thóp trong tình trạng mất sạch tứ chi. Để cứu lấy mạng sống của cô, anh đã chấp nhận đánh đổi nhân tính của mình để trở thành một thuộc hạ ma cà rồng, từ đó dấn thân vào những cuộc đối đầu nghẹt thở với ba thợ săn quái vật sừng sỏ nhằm lấy lại các bộ phận cơ thể cho chủ nhân. Với lối dẫn truyện sắc sảo, những màn đối thoại thông minh đầy triết lý xen lẫn yếu tố siêu nhiên kỳ ảo, tác phẩm không chỉ giải mã nguồn gốc sức mạnh của Araragi mà còn khắc họa sâu sắc ranh giới mong manh giữa con người và quái vật, giữa sự hy sinh và lòng ích kỷ.', 'kizumonogatari01.jpg', 'hiện');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_unicode_ci DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_data` text COLLATE utf8mb4_unicode_ci,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `address` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default_avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `role`, `created_at`, `cart_data`, `fullname`, `phone`, `address`, `avatar`) VALUES
(1, 'NCT@gmail.com', '$2y$10$HdrI0LcaGtUjmlLQ6R7Po.QZQvErexvWGJAhnncNM6PIXyBIZDcc2', 'admin', '2026-03-27 21:49:32', NULL, 'Admin NCT', '', NULL, 'default_avatar.png'),
(2, 'Sakura@gmail.com', '$2y$10$3FAH.CNsWhdXS9aFRvMc/OIBS0wnYVL2ym1L7Jj7LGDTCbP4CPz/.', 'customer', '2026-03-27 21:49:32', NULL, 'Sakura', '', NULL, 'default_avatar.png'),
(3, 'Miku@gmail.com', '$2y$10$.sAfxGLdLu2Eln7hH60y7ua9d.vevHfEVhMXHnoN/jmxG6fETJHVy', 'customer', '2026-03-27 21:49:32', NULL, 'Hatsune Miku', '', NULL, 'default_avatar.png'),
(4, '1234@gmail.com', '$2y$10$FExjlkMVuLsNPUxMZokP3uh4RR2iGoo/H5otrzxkFKGGAVVSKUdzC', 'customer', '2026-03-27 21:49:32', NULL, 'Shinto', '', NULL, 'default_avatar.png'),
(5, 'Lucy@gmail.com', '$2y$10$8/rV1uVwSmvSJpx7.8hfTe.EiiM0ehvXz1Ox1GGZ72VcfH9C6ztte', 'customer', '2026-03-27 21:49:32', NULL, 'Lucy', '0836363636', 'Nghĩa Trang', '5a9c9cfee81db24795db14fcfe78eb64.jpg'),
(6, 'inori@gmail.com', '$2y$10$KcxylTDFUA5XCPJp4LDK9OP1DdAAWgzU93i.oPfRF8E/RHW9mdqXm', 'customer', '2026-03-30 13:45:10', NULL, 'Inori', '0846333592', 'Nghĩa Địa', '9d856426a844121b024ecb53b91db896.png'),
(7, 'iriya@gmail.com', '$2y$10$pV08HHOoMF.RJ6diqflFNeywJKU1WT4oTRJ6jLfUvxirk9HzKdNPW', 'customer', '2026-03-31 12:22:52', NULL, 'Iriya', '0876374412', '77 Massachusetts Avenue/Cambridge/Massachusetts/USA', 'e4a995a9563e3cf9b493f61aa1fe4e50.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canceled_items`
--
ALTER TABLE `canceled_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canceled_items`
--
ALTER TABLE `canceled_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
