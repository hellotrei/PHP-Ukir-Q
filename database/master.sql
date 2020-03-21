-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Mar 2020 pada 10.57
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khanstore`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(8, 'Treido Ristivan', 'ristivantreido@gmail.com', '$2y$10$nnBFT52HC2IjNPk6nJdFMuyaMOSU6Txct8FMws6PfXo8R1cN82/F.', '0'),
(10, 'admin', 'admin@ukirq.com', '$2y$10$VrjzCxwObCEl5yQxNPFkeOJQRYNDf6AiuZyAvd.gpo4zbrXcGAyyW', '0'),
(11, 'UkirQ', 'admin1@ukirq.com', '$2y$10$lDspCEyEKwHjfAfRsIq2FO8Dt9qV65XEuArca0hKaMqChtJedjNea', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Mebel Jati'),
(2, 'Mebel Kayu Mahoni'),
(3, 'Set Ruang Tidur'),
(4, 'Set Ruang Makan'),
(5, 'Set Ruang Tamu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(40, 11, '::1', 4, 1),
(41, 10, '::1', 4, 1),
(42, 12, '::1', 4, 1),
(43, 13, '::1', 4, 1),
(44, 14, '::1', 4, 1),
(45, 15, '::1', 4, 1),
(46, 16, '::1', 4, 1),
(47, 17, '::1', 4, 1),
(48, 18, '::1', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Almari Pajangan'),
(3, 'Almari Pakaian'),
(4, 'Buffet TV'),
(5, 'Kursi Tamu'),
(6, 'Kursi Makan'),
(12, 'Meja Makan'),
(14, 'Meja Konsul'),
(15, 'Meja Kopi'),
(16, 'Meja Rias'),
(17, 'Nakas Laci'),
(18, 'Tempat Tidur'),
(19, 'Tempat Tidur Anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed'),
(5, 3, 10, 1, '6PA785752X4662513', 'Completed'),
(6, 3, 10, 1, '3LP30145HM730123W', 'Completed'),
(7, 3, 10, 1, '6XB98372A00720434', 'Completed'),
(8, 4, 10, 1, '7A801018120496710', 'Completed'),
(9, 4, 10, 1, '78909245JP4434709', 'Completed'),
(10, 4, 10, 5, '15E57652F26572634', 'Completed'),
(11, 4, 11, 1, '3K840679EU097161S', 'Completed'),
(12, 4, 12, 1, '3K840679EU097161S', 'Completed'),
(13, 4, 10, 1, '6LB160565S3648515', 'Completed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(10, 2, 1, 'Lemari Pajangan Minimalis Duo Tone Makmur', 130, 15, 'Kode : KLP 053\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Stain hitam pada body dan wax natural pada pintu\r\nUkuran : W 120 x D 50 x H 200 Cm', '1575989420_1575989306_1.jpg', 'almari'),
(11, 2, 1, 'Rak Pajangan Sudut Model Klasik KLP 018', 130, 5, 'Kode : KLP 018\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni\r\nFinishing : Cat duco putih krem abu2an\r\nUkuran : W 45 x D 45 x H 175 Cm', '1575995043_2.jpg', 'almari'),
(12, 2, 1, 'Rak Pajangan Kayu Model Klasik KLP 022', 125, 5, 'Kode : KLP 022\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni\r\nFinishing : Cat duco putih\r\nUkuran : W 90 x D 35 x H 180 Cm', '1575995199_3.jpg', 'almari'),
(13, 2, 1, 'Rak Pajang Kaca Model Klasik KLP 021', 120, 5, 'Kode : KLP 021\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni\r\nFinishing : Cat duco putih\r\nUkuran : W 120 x D 40 x H 210 Cm', '1575995746_4.jpg', 'almari'),
(14, 2, 1, 'Rak Sudut Minimalis Kayu Jati KLP 034', 125, 6, 'Kode : KLP 034\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 40 x D 40 x H 160 Cm', '1575995928_5.jpg', 'almari'),
(15, 2, 1, 'Rak Pajangan Kayu Jati Simple KLP 033', 110, 5, 'Kode : KLP 033\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 90 x D 40 x H 200 Cm', '1575996054_6.jpg', 'almari'),
(16, 2, 1, 'Rak Pajangan Bundar Unik KLP 049', 200, 6, 'Kode : KLP 049\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural brown\r\nUkuran : W 145 x D 40 x H 170 Cm', '1575996704_7.jpg', 'rak'),
(17, 2, 1, 'Rak Pajangan Unik Dari Kayu Jati KLP 008', 200, 5, 'Kode : KLP 008\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati Solid\r\nFinishing : Natural\r\nUkuran : W 130 x D 40 x H 180 Cm', '1575996824_8.jpg', 'rak'),
(18, 2, 1, 'Lemari Pajangan Minimalis Jati Karina', 240, 4, 'Kode : KLP 048\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : L 80 x D 45 x T 190 Cm', '1575996899_9.jpg', 'almari'),
(19, 3, 1, 'Almari Pakaian Minimalis Jati 2 Laci', 420, 5, 'Kode : KLM 017\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 130 x D 45 x H 195 Cm', '1575997119_11.jpg', 'almari'),
(20, 3, 1, 'Almari Pakaian Minimalis Jati Jepara', 425, 5, 'Kode : KLM 018\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 130 x D 45 x H 195 cm', '1575997221_12.jpg', 'almari'),
(21, 3, 1, 'Lemari Pakaian Jati 3 Pintu Denver', 400, 5, 'Kode : KLM 034\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Dark gray washed\r\nUkuran : W 180 x D 50 x H 200 Cm', '1575997366_13.jpg', 'almari'),
(22, 4, 1, 'Bufet Kabinet TV Minimalis Duo Tone 074', 315, 4, 'Kode : KTV 029\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid + mahoni pada laci putih\r\nFinishing : Natural brown + solid white\r\nUkuran : W 220 x D 50 x H 55 Cm', '1576016389_14.jpg', 'buffet'),
(23, 4, 1, 'Bufet Tv Kayu Jati Model Minimalis KTV 010', 180, 5, 'Kode : KTV 010\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 150 x D 50 x H 60 Cm', '1576016475_15.jpg', 'buffet'),
(24, 4, 1, 'Bufet  TV Kayu Jati Design Simple KTV 012', 180, 4, 'Kode : KTV 012\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural hitam\r\nUkuran : W 130 x D 50 x H 70 Cm', '1576016546_16.jpg', 'buffet'),
(25, 5, 5, 'Sofa  Panjang Mewah Model Klasik Victoria', 150, 5, 'Kode : MVJ 058\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Rangka kayu jati solid\r\nBahan jok : Kain tahan air\r\nFinishing : Natural warna kayu\r\nUkuran : W 150 x D 85 x H 110 Cm', '1576016750_17.jpg', 'kursi'),
(26, 5, 5, 'Sofa Panjang Vintage Scandinavian Style', 150, 5, 'Kode : MVJ 054\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Rangka kayu jati solid\r\nBahan jok : Kain tahan air\r\nFinishing : Natural warna kayu\r\nUkuran : W 220 x D 85 x H 80 Cm', '1576016813_18.jpg', 'kursi'),
(27, 5, 5, 'Sofa Sudut Mewah  Vintage Minimalis Foxy', 225, 5, 'Kode : MVJ 069\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Rangka kayu jati solid\r\nBahan jok : Kain tahan air\r\nFinishing : Natural warna kayu\r\nUkuran : W 200 x D 200 x H 90 Cm', '1576016935_19.jpg', 'kursi'),
(28, 12, 4, 'Meja Makan Tarik Minimalis Country Style', 75, 5, 'Kode : MVJ 079\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 180 (dengan ekstensi 220 cm) x D 100 x H 78 Cm', '1576017080_21.jpg', 'meja makan'),
(29, 12, 4, 'Meja Makan Jati Minimalis Solid Blok', 75, 5, 'Kode : KMM 002\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 160 x W 90 x H 78 Cm', '1576017166_22.jpg', 'meja makan'),
(30, 12, 4, 'Meja Makan Jati Minimalis Kaki Blok', 75, 5, 'Kode : KMM 013\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kay jati solid\r\nFinishing : Natural dark brown\r\nUkuran : W 220 x D 100 x H 78 Cm', '1576017244_23.jpg', 'meja makan'),
(31, 6, 4, 'Kursi Untuk Cafe Design Minimalis Verona', 50, 8, 'Kode : MVJ 026\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nBahan Jok : Kain tahan air\r\nFinishing : Natural warna kayu\r\nUkuran : W 40 x D 40 x H 70 Cm', '1576017391_24.jpg', 'kursi makan'),
(32, 6, 4, 'Kursi Makan Simple Minimalis Jati Jepara', 50, 6, 'Kode : MVJ 027\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 40 x D 50 x H 95 Cm', '1576017484_25.jpg', 'kursi makan'),
(33, 6, 2, 'Kursi Makan Silver Grande KMK 047', 50, 8, 'Kode : KMK 047\r\nStock : Pre-Order 6 Minggu\r\nBahan : Kayu Mahoni\r\nFinishing : Silver leaf ( perak tempel )\r\nUkuran : W 60 x D 65 x H 120 Cm\r\nBahan Jok : Velvet ( warna bisa custom )', '1576017568_26.jpg', 'kursi makan'),
(34, 16, 2, 'Meja Rias Klasik Ukiran Jepara KMR 003', 200, 5, 'Kode : KMR 003\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni\r\nFinishing : Natural light brown\r\nUkuran : W 160 x D 45 x H 200 Cm', '1577871086_27.jpg', 'meja'),
(35, 16, 1, 'Meja Rias Klasik Jati Minimalis 3 Cermin', 250, 6, 'Kode : KMR 001\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 180 x D 40 x H 210 Cm', '1577871181_28.jpg', 'meja'),
(37, 17, 5, 'Nakas Laci Kayu Jati Model Etnik KNL 076', 175, 5, 'Kode : KNL 076\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 65 x D 45 x H 100 Cm', '1577871502_30.jpg', 'nakas'),
(38, 17, 5, 'Nakas Jati Minimalis 4 Laci Seri Scandi', 175, 6, 'Kode : MVJ 084\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural light brown\r\nUkuran : W 65 x D 50 x H 110 Cm', '1577871584_31.jpg', 'nakas'),
(39, 17, 5, 'Nakas 2 Laci Model Neo Klasik KNL 074', 175, 6, 'Kode : KNL 074\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni\r\nFinishing : Natural antik\r\nUkuran : W 90 x D 40 x H 70 Cm', '1577871674_32.jpg', 'nakas'),
(40, 17, 5, 'Nakas Laci Jati Klasik Ukiran KNL 070', 175, 5, 'Kode : KNL 070\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni solid\r\nFinishing : Natural antik\r\nUkuran : W 65  x D 50 x H 75 Cm', '1577871784_33.jpg', 'nakas'),
(41, 17, 5, 'Nakas Antik Ukiran 8 Laci KNL 019', 175, 7, 'Kode : KNL 019\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni solid\r\nFinishing : Natural antik\r\nUkuran : W 150 x D 65 x H 110 Cm', '1577871876_34.jpg', 'nakas'),
(42, 17, 5, 'Nakas 6 Laci Bloom Series KNL 034', 175, 5, 'Kode : KNL 034\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu mahoni solid\r\nFinishing : Cat duco putih\r\nUkuran : W 100 x D 35 x H 75 Cm', '1577871995_35.jpg', 'nakas'),
(43, 18, 3, 'Tempat Tidur Jati Model Platform KKB 012', 400, 5, 'Kode : KKB 012\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Waterbase red teak\r\nUkuran : W 180 x D 200 x H 100 Cm', '1577872234_36.jpg', 'dipan'),
(44, 18, 3, 'Tempat Tidur Jati Minimalis Laci KKB 001', 400, 5, 'Kode : KKB 001\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Waterbase red teak\r\nUkuran : W 180 x D 200 x H 110 Cm', '1577872390_37.jpg', 'dipan'),
(45, 18, 3, 'Tempat Tidur Jati Minimalis Modern KKB 045', 400, 5, 'Kode : KKB 045\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 180 x D 200 x H 120 Cm', '1577872476_38.jpg', 'dipan'),
(46, 19, 3, 'Tempat Tidur Anak Minimalis KBB 016', 450, 5, 'Kode : KBB 016\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural warna kayu\r\nUkuran : W 100 x D 200 x H 100 Cm', '1577872643_39.jpg', 'dipan'),
(47, 19, 3, 'Tempat Tidur Anak Sorong Seri Christy 017', 450, 5, 'Kode : KBB 001\r\nStock : Pre-Order 6 Minggu\r\nMaterial : Kayu jati solid\r\nFinishing : Natural\r\nUkuran : W 100 x D 200 x H 120 Cm', '1577872732_40.jpg', 'dipan'),
(49, 18, 2, 'Set Tempat Tidur Victorian KW5', 200, 5, 'mencoba tambah', '1578021320_39.jpg', 'kamar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(3, 'Treido', 'Treido', 'ristivantreido@gmail.com', 'ef24102c2a9d3f95bc2767b37a87fbbe', '0123456789', 'jl. garuda 120, concat', 'jl. garuda '),
(4, 'buyer', 'satu', 'buyer1@ukirq.com', '58b4e38f66bcdb546380845d6af27187', '0838111122', 'Jl Manuk-manuk ', 'Jl Manuk-ma'),
(5, 'buyer', 'dua', 'buyer2@ukirq.com', '58b4e38f66bcdb546380845d6af27187', '0838222112', 'Jl Kaliurang 72a', 'jl maju ter');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indeks untuk tabel `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
