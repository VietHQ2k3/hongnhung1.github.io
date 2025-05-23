USE hocbong;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 08:56 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hocbong`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
-- USE hocbong;

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `quyen_han` varchar(50) DEFAULT 'staff',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `ho_ten`, `email`, `sdt`, `quyen_han`, `created_at`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin Root', 'admin@example.com', '0123456789', 'admin', '2025-04-20 21:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `goi_vay`
--

CREATE TABLE `goi_vay` (
  `id` int(11) NOT NULL,
  `ngan_hang_id` int(11) NOT NULL,
  `ten_goi` varchar(100) NOT NULL,
  `han_muc` varchar(100) NOT NULL,
  `loai_vay` varchar(50) NOT NULL,
  `lai_suat` varchar(100) NOT NULL,
  `thoi_han` varchar(100) NOT NULL,
  `an_han` varchar(255) DEFAULT NULL,
  `mo_ta` text DEFAULT NULL,
  `dieu_kien` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goi_vay`
--

INSERT INTO `goi_vay` (`id`, `ngan_hang_id`, `ten_goi`, `han_muc`, `loai_vay`, `lai_suat`, `thoi_han`, `an_han`, `mo_ta`, `dieu_kien`) VALUES
(1, 1, 'Vay du học', 'tối đa 85% tổng chi phí', 'Thế chấp', 'từ 10,99%', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'không', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(2, 2, 'Vay du học (vay tiêu dùng)', 'tối đa 70% - 80% tổng chi phí', 'Thế chấp', 'lãi suất cơ sở 8.7%', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'trả trả hàng tháng hoặc hàng quý; gốc trả góp đều hoặc theo bậc thang', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(3, 3, 'Vay du học', 'tối đa 80% tổng chi phí', 'Thế chấp', 'lãi suất cơ sở 8.6%', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'ân hạn trả nợ gốc lên đến 3 năm', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(4, 4, 'Vay du học', 'tối đa 300 triệu đồng hoặc 70% học phí khóa học', 'Thế chấp', '8.6%', '5 năm', '', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(5, 5, 'Vay du học', 'tối đa 100% tổng chi phí', 'Thế chấp', 'từ 7.49%/năm trong 6 tháng đầu, sau đó áp dụng lãi suất tiết kiệm VND kỳ hạn 12 tháng cộng biên độ c', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'không', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(6, 6, 'Vay du học', 'tối đa 100% tổng chi phí', 'Thế chấp', 'từ 9.6%', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'ân hạn trả nợ gốc lên đến 24 tháng', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp'),
(7, 7, 'Vay du học', 'tối đa 100% tổng chi phí', 'Thế chấp', 'từ 7,7% (lãi suất ưu đãi trên số tiết kiệm cộng phí chứng minh tài chính)', 'tối thiểu 03 tháng và tối đa là 120 tháng', 'không', 'Gói vay dành cho du học sinh', 'Phải có tài sản thế chấp');

-- --------------------------------------------------------

--
-- Table structure for table `ho_so_vay`
--

CREATE TABLE `ho_so_vay` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_cost` decimal(15,2) NOT NULL,
  `loan_amount` decimal(15,2) NOT NULL,
  `loan_type` varchar(20) NOT NULL,
  `repayment_plan` text NOT NULL,
  `existing_loan` varchar(5) NOT NULL,
  `existing_loan_amount` decimal(15,2) DEFAULT NULL,
  `existing_loan_bank` varchar(100) DEFAULT NULL,
  `cic_score` varchar(20) DEFAULT NULL,
  `eligibility` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ho_so_vay`
--

INSERT INTO `ho_so_vay` (`id`, `user_id`, `country`, `start_date`, `end_date`, `total_cost`, `loan_amount`, `loan_type`, `repayment_plan`, `existing_loan`, `existing_loan_amount`, `existing_loan_bank`, `cic_score`, `eligibility`, `created_at`) VALUES
(1, 6, 'Mỹ', '2025-04-08', '2025-04-09', 100000.00, 1000000.00, 'Thế chấp', 'Vay bame', 'Không', NULL, NULL, NULL, 'ineligible', '2025-04-20 13:30:06'),
(2, 6, 'Úc', '2025-04-03', '2025-04-09', 100000.00, 100000.00, 'Thế chấp', 'Bán nhà', 'Không', NULL, NULL, NULL, 'eligible', '2025-04-20 13:36:44'),
(3, 6, 'Úc', '2025-04-03', '2025-04-09', 100000.00, 1000000000.00, 'Thế chấp', 'Bán nhà', 'Có', 1000000000.00, 'VIB', '10000', 'ineligible', '2025-04-20 13:37:23'),
(4, 7, 'Canada', '2025-04-05', '2025-04-16', 100000.00, 100000.00, 'Thế chấp', 'bán nhà', 'Không', NULL, NULL, NULL, 'eligible', '2025-04-20 14:13:06'),
(5, 8, 'Canada', '2025-04-04', '2025-05-07', 100000.00, 100000.00, 'Thế chấp', 'bán thận', 'Không', NULL, NULL, NULL, 'eligible', '2025-04-20 14:40:22'),
(6, 9, 'Mỹ', '2025-04-01', '2025-04-23', 1000000000.00, 10000000000.00, 'Thế chấp', 'Không trả', 'Có', 1000000000000.00, 'ACB', '1000', 'ineligible', '2025-04-21 14:12:22'),
(7, 9, 'Mỹ', '2025-04-01', '2025-04-23', 1000000000.00, 10000000000.00, 'Thế chấp', 'Không trả', 'Có', 1000000000000.00, 'ACB', '1000', 'ineligible', '2025-04-21 14:12:22'),
(8, 9, 'Mỹ', '2025-04-01', '2025-04-23', 1000000000.00, 10000000.00, 'Thế chấp', 'bán nhà', 'Không', NULL, NULL, '1000', 'eligible', '2025-04-21 14:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `khao_sat`
--

CREATE TABLE `khao_sat` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dien_thoai` varchar(20) DEFAULT NULL,
  `thoi_gian_tao` timestamp NOT NULL DEFAULT current_timestamp(),
  `thu_dien_form` enum('Có','Dự định sẽ thử','Không, chưa sẵn sàng') DEFAULT NULL,
  `qua_trinh_dien_form` varchar(255) DEFAULT NULL,
  `giao_dien_de_dung` tinyint(1) DEFAULT 0,
  `tim_duoc_thong_tin` tinyint(1) DEFAULT 0,
  `mot_so_phan_thieu` tinyint(1) DEFAULT 0,
  `bi_lac_lung_tung` tinyint(1) DEFAULT 0,
  `khong_tim_duoc` tinyint(1) DEFAULT 0,
  `du_dinh_su_dung` enum('Có, chắc chắn sẽ dùng','Có thể, nếu được cải thiện thêm','Cần xem thêm đánh giá từ người khác','Không, mình sẽ chọn cách khác') DEFAULT NULL,
  `gop_y_cai_thien` text DEFAULT NULL,
  `goi_access_companion` enum('Có, sẵn sàng chi ngay','Có thể, nếu dùng thử tốt','Không, mình không cần') DEFAULT NULL,
  `goi_access_san_sang_tra` int(11) DEFAULT NULL,
  `goi_scholarship_support` enum('Rất hữu ích, mình sẵn sàng trả','Chỉ cần một phần, không cần toàn bộ','Mình sẽ thử nếu có bản dùng thử') DEFAULT NULL,
  `goi_support_gia_hop_ly` int(11) DEFAULT NULL,
  `goi_scholarship_premium` enum('Có, nếu mentor đủ chất lượng','Có thể, nếu chia nhỏ thành từng buổi','Không, mình thích tự học hơn') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `khao_sat`
--

INSERT INTO `khao_sat` (`id`, `ho_ten`, `email`, `dien_thoai`, `thoi_gian_tao`, `thu_dien_form`, `qua_trinh_dien_form`, `giao_dien_de_dung`, `tim_duoc_thong_tin`, `mot_so_phan_thieu`, `bi_lac_lung_tung`, `khong_tim_duoc`, `du_dinh_su_dung`, `gop_y_cai_thien`, `goi_access_companion`, `goi_access_san_sang_tra`, `goi_scholarship_support`, `goi_support_gia_hop_ly`, `goi_scholarship_premium`) VALUES
(1, 'Nguyễn Hữu Huy', 'abc@gmail.com', '12345678', '2025-04-20 14:27:39', 'Có', 'Nhanh, dễ hiểu', 1, 0, 0, 0, 0, 'Có thể, nếu được cải thiện thêm', 'khoong', 'Có, sẵn sàng chi ngay', 1000, 'Chỉ cần một phần, không cần toàn bộ', 1000, 'Có, nếu mentor đủ chất lượng'),
(2, 'Nguyễn Hữu Huy', 'abc@gmail.com', '12345678', '2025-04-20 14:38:38', 'Có', 'Nhanh, dễ hiểu', 1, 0, 0, 0, 0, 'Có thể, nếu được cải thiện thêm', 'khoong', 'Có, sẵn sàng chi ngay', 1000, 'Chỉ cần một phần, không cần toàn bộ', 1000, 'Có, nếu mentor đủ chất lượng'),
(3, 'Nguyễn Hữu', 'abc@gmail.com', '12345678', '2025-04-20 14:39:06', 'Dự định sẽ thử', '', 0, 0, 1, 0, 0, 'Có thể, nếu được cải thiện thêm', '', 'Có, sẵn sàng chi ngay', 111, 'Chỉ cần một phần, không cần toàn bộ', 111, 'Có, nếu mentor đủ chất lượng'),
(4, 'Nguyễn Hữu', 'abc@gmail.com', '12345678', '2025-04-20 14:41:10', 'Dự định sẽ thử', '', 0, 0, 0, 1, 0, 'Cần xem thêm đánh giá từ người khác', 'ko', 'Có thể, nếu dùng thử tốt', 111, 'Chỉ cần một phần, không cần toàn bộ', 1118888, 'Có, nếu mentor đủ chất lượng');

-- --------------------------------------------------------

--
-- Table structure for table `nganh_hoc`
--

CREATE TABLE `nganh_hoc` (
  `id` int(11) NOT NULL,
  `ten_nganh` varchar(100) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nganh_hoc`
--

INSERT INTO `nganh_hoc` (`id`, `ten_nganh`, `mo_ta`, `thu_tu`) VALUES
(1, 'Kinh tế', 'Các chương trình đào tạo về kinh tế, tài chính, kế toán', 1),
(2, 'Công nghệ thông tin', 'Các chương trình đào tạo về CNTT, phát triển phần mềm', 2),
(3, 'Kỹ thuật', 'Các chương trình đào tạo về kỹ thuật cơ khí, điện tử, xây dựng', 3),
(4, 'Y học', 'Các chương trình đào tạo về y khoa, dược học, điều dưỡng', 4),
(5, 'Khoa học xã hội', 'Các chương trình đào tạo về xã hội học, tâm lý học', 5),
(6, 'Luật', 'Các chương trình đào tạo về luật quốc tế, luật thương mại', 6),
(7, 'Kiến trúc', 'Các chương trình đào tạo về kiến trúc, thiết kế đô thị', 7),
(8, 'Nghệ thuật', 'Các chương trình đào tạo về nghệ thuật, âm nhạc, điện ảnh', 8),
(9, 'Khoa học tự nhiên', 'Các chương trình đào tạo về vật lý, hóa học, sinh học', 9),
(10, 'Khác', 'Các ngành học khác', 10);

-- --------------------------------------------------------

--
-- Table structure for table `ngan_hang`
--

CREATE TABLE `ngan_hang` (
  `id` int(11) NOT NULL,
  `ten_ngan_hang` varchar(100) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `thong_tin` text DEFAULT NULL,
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ngan_hang`
--

INSERT INTO `ngan_hang` (`id`, `ten_ngan_hang`, `logo`, `thong_tin`, `thu_tu`) VALUES
(1, 'Techcombank', 'techcombank.png', 'Ngân hàng TMCP Kỹ Thương Việt Nam', 1),
(2, 'ACB', 'acb.png', 'Ngân hàng TMCP Á Châu', 2),
(3, 'BIDV', 'bidv.png', 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam', 3),
(4, 'VPBank', 'vpbank.png', 'Ngân hàng TMCP Việt Nam Thịnh Vượng', 4),
(5, 'VIB', 'vib.png', 'Ngân hàng TMCP Quốc Tế Việt Nam', 5),
(6, 'Sacombank', 'sacombank.png', 'Ngân hàng TMCP Sài Gòn Thương Tín', 6),
(7, 'VietinBank', 'vietinbank.png', 'Ngân hàng TMCP Công Thương Việt Nam', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` int(11) NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `so_dien_thoai` varchar(20) NOT NULL,
  `ngay_dang_ky` timestamp NOT NULL DEFAULT current_timestamp(),
  `hinh_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `ho_ten`, `ngay_sinh`, `email`, `so_dien_thoai`, `ngay_dang_ky`, `hinh_anh`) VALUES
(1, 'Nguyễn Hữu Huy', '2025-04-01', 'abc@gmail.com', '12345678', '2025-04-20 12:54:17', 'uploads/6804ee7955076.png'),
(2, 'Nguyễn Hữu Huy', '2025-04-03', 'abc@gmail.com', '12345678', '2025-04-20 13:09:35', ''),
(3, 'Nguyễn Hữu Huy', '2025-04-03', 'abc@gmail.com', '12345678', '2025-04-20 13:14:34', ''),
(4, 'Nguyễn Hữu Huy', '2025-04-03', 'abc@gmail.com', '12345678', '2025-04-20 13:16:04', ''),
(5, 'Nguyễn Hữu Huy', '2025-04-04', 'abc@gmail.com', '12345678', '2025-04-20 13:19:41', ''),
(6, 'Nguyễn Hữu Huy', '2025-04-03', 'abc@gmail.com', '12345678', '2025-04-20 13:26:14', ''),
(7, 'Nguyễn Hữu Huy', '2025-04-12', 'abc@gmail.com', '12345678', '2025-04-20 14:12:50', ''),
(8, 'Nguyễn Hữu Huy', '2025-04-10', 'abc@gmail.com', '12345678', '2025-04-20 14:40:01', ''),
(9, 'Trang Nhung', '2025-04-02', 'u1@gmail.com', '0987263723', '2025-04-21 14:10:56', ''),
(10, 'Trang Nhung', '2025-04-03', 'u1@gmail.com', '0987263723', '2025-04-21 14:19:06', ''),
(11, 'Trang Nhung', '2025-04-03', 'u1@gmail.com', '0987263723', '2025-04-21 14:20:47', '');

-- --------------------------------------------------------

--
-- Table structure for table `quoc_gia`
--

CREATE TABLE `quoc_gia` (
  `id` int(11) NOT NULL,
  `ten_quoc_gia` varchar(100) NOT NULL,
  `ma_quoc_gia` varchar(5) NOT NULL,
  `thu_tu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quoc_gia`
--

INSERT INTO `quoc_gia` (`id`, `ten_quoc_gia`, `ma_quoc_gia`, `thu_tu`) VALUES
(1, 'Mỹ', 'US', 1),
(2, 'Canada', 'CA', 2),
(3, 'Úc', 'AU', 3),
(4, 'Anh', 'UK', 4),
(5, 'Nhật Bản', 'JP', 5),
(6, 'Hàn Quốc', 'KR', 6),
(7, 'Singapore', 'SG', 7),
(8, 'Pháp', 'FR', 8),
(9, 'Đức', 'DE', 9),
(10, 'Hà Lan', 'NL', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tai_lieu_ho_so`
--

CREATE TABLE `tai_lieu_ho_so` (
  `id` int(11) NOT NULL,
  `ho_so_id` int(11) NOT NULL,
  `loai_tai_lieu` enum('Giấy đề nghị vay vốn','Giấy tờ chứng minh mục đích vay vốn','Giấy tờ chứng minh nhân thân','Giấy tờ chứng minh tài sản thế chấp','Hợp đồng lao động/Chứng minh thu nhập','Tài liệu khác') NOT NULL,
  `ten_file` varchar(255) NOT NULL,
  `duong_dan` varchar(255) NOT NULL,
  `ngay_upload` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') DEFAULT 'staff',
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `email`) VALUES
(1, 'admin', '$2y$10$kS9n20RItgp/TYyTkUqV2uToLz5cHTlHJFpCYfrH7oWDkzzBDttiS', 'admin', 'admin@gmail.com'),
(0, 'trangnhung', '$2y$10$kZGX6tDMbY3zzyft13sR/OJ.vU7RXu7uncPeD8nhVeXrlAA0SRzKS', 'staff', 'trangnhung@gmail.com'),
(0, 'u1', '$2y$10$D3R4E27zeNZylXPnQFkarO5AVyLJ9rHChxzd6rgurpqE1t1vDBcW2', 'staff', 'u1@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `goi_vay`
--
ALTER TABLE `goi_vay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ngan_hang_id` (`ngan_hang_id`);

--
-- Indexes for table `ho_so_vay`
--
ALTER TABLE `ho_so_vay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `khao_sat`
--
ALTER TABLE `khao_sat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nganh_hoc`
--
ALTER TABLE `nganh_hoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ngan_hang`
--
ALTER TABLE `ngan_hang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quoc_gia`
--
ALTER TABLE `quoc_gia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_lieu_ho_so`
--
ALTER TABLE `tai_lieu_ho_so`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ho_so_id` (`ho_so_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `goi_vay`
--
ALTER TABLE `goi_vay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ho_so_vay`
--
ALTER TABLE `ho_so_vay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `khao_sat`
--
ALTER TABLE `khao_sat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `nganh_hoc`
--
ALTER TABLE `nganh_hoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ngan_hang`
--
ALTER TABLE `ngan_hang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `quoc_gia`
--
ALTER TABLE `quoc_gia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tai_lieu_ho_so`
--
ALTER TABLE `tai_lieu_ho_so`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `goi_vay`
--
ALTER TABLE `goi_vay`
  ADD CONSTRAINT `goi_vay_ibfk_1` FOREIGN KEY (`ngan_hang_id`) REFERENCES `ngan_hang` (`id`);

--
-- Constraints for table `ho_so_vay`
--
ALTER TABLE `ho_so_vay`
  ADD CONSTRAINT `ho_so_vay_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`id`);

--
-- Constraints for table `tai_lieu_ho_so`
--
ALTER TABLE `tai_lieu_ho_so`
  ADD CONSTRAINT `tai_lieu_ho_so_ibfk_1` FOREIGN KEY (`ho_so_id`) REFERENCES `ho_so_vay` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
