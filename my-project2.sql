# Host: localhost  (Version 5.5.5-10.1.36-MariaDB)
# Date: 2019-01-09 18:54:15
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "category"
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "category"
#

INSERT INTO `category` VALUES (1,0,'elektronik','elektronik','elektronik','True'),(2,0,'giyim','giyim','giyim','True'),(4,0,'aksesuar','aksesuar','aksesuar','True'),(5,0,'spor','spor','spor','True'),(8,1,'kamera','kamera','kamera','True'),(10,1,'sandisk','sandisk','sandisk','True'),(11,2,'kadin','kadın','kadın','True'),(12,11,'ayakkabbı','ayakkabı','ayakkabı','True'),(13,11,'çanta','kadın çanta','kadın çanta','True'),(14,2,'erkek','erkek','erkek','True'),(16,4,'gözlük','gözlük','gözlük','True'),(17,4,'saat','saat','saat','True'),(18,5,'şort','şort','şort','True'),(19,5,'ayakkabı','ayakkabı','ayakkabı','True');

#
# Structure for table "images"
#

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "images"
#

INSERT INTO `images` VALUES (2,20,'f611e74b1de75f6cfb7416316e29230a.jpeg'),(3,1,'bff8bfe728520ef5e4112ee3865500b1.jpeg');

#
# Structure for table "messages"
#

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "messages"
#

INSERT INTO `messages` VALUES (1,'aalican',NULL,'deneme.com','test','','okundu'),(2,'mehmet','mehmet@gmail.com','subject','mesaj içeriği','aaa','okundu'),(3,'mustafa','mustafa@mynet.com','subject2','mesaj içeriği2','okundu','okundu'),(4,'mehmet','kullanic@gmail.com','sebep','mesaj',NULL,NULL);

#
# Structure for table "migration_versions"
#

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "migration_versions"
#

INSERT INTO `migration_versions` VALUES ('20181101111051'),('20181126111227'),('20181203183231'),('20181209125551'),('20181210081749'),('20181213111945'),('20181216145551'),('20181219115410'),('20181222113201'),('20181230103510'),('20190105110618'),('20190105111011'),('20190105111911'),('20190108131536');

#
# Structure for table "order_detail"
#

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "order_detail"
#

INSERT INTO `order_detail` VALUES (1,4,2,5,350,1,350,'kamera5','Ordered'),(2,4,2,8,350,1,350,'ayakkabı3','Ordered'),(3,4,2,1,50,1,50,'kamera','Ordered'),(4,5,3,5,350,1,350,'kamera5','Ordered'),(5,5,3,1,50,1,50,'kamera','Ordered'),(6,6,4,1,50,2,100,'kamera','Ordered'),(7,6,4,8,350,1,350,'ayakkabı3','Ordered'),(8,7,2,19,10,1,10,'Zımba Detaylı Çanta','Ordered'),(9,7,2,27,19.95,1,19.95,'Kahverengi Kadın Gözlük','Ordered'),(10,8,2,5,350,1,350,'kamera5','Ordered');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipinfo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,1,1,'akif','karatepe','ankar','1562','info','status',NULL),(2,2,2,'mehmet','adress','nevşehir','875','info2',NULL,NULL),(3,2,750,'mehmet',NULL,'karabuk','540',NULL,'InShipping',' '),(4,2,750,'mehmet',NULL,'karabuk','540',NULL,'New',NULL),(5,3,400,'sefa',NULL,'kırıkkale','987',NULL,'New',NULL),(6,4,450,'mustafa',NULL,NULL,NULL,NULL,'New',NULL),(7,2,29.95,'mehmet',NULL,'karabuk','540',NULL,'New',NULL),(8,2,350,'mehmet',NULL,'karabuk','540',NULL,'InShipping','');

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisherid` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pprice` double DEFAULT NULL,
  `sprice` double DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `writerid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'kamera','kamera key','kamera des',NULL,NULL,20,30,50,NULL,'14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode.','55690d3b2b1718d2398aae31e1c6e33b.jpeg',NULL,8,NULL,'True'),(2,'kamera2','kamera2 key','kamera2 des',NULL,2018,10,50,100,5,'14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode.\n','2.jpg',NULL,8,NULL,'True'),(3,'kamera3','3 key','kamera3 des',NULL,2018,2,30,40,5,'14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode.\n','3.jpg',NULL,8,NULL,'True'),(4,'kamera4','kamera4 key','kamera4 des',NULL,NULL,10,10,15,10,'14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode.\n','4.jpg',NULL,8,NULL,'True'),(5,'kamera5','kamera5 key','kamera5 des',NULL,NULL,20,250,350,NULL,'14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full HD photos and 1280 x 720p HD movie capture. ISO sensitivity ISO6400 at reduced resolution. Tracking Auto Focus. Motion Panorama Mode.\n','5.jpg',NULL,8,NULL,'True'),(6,'ayakkabı','ayakkabı key','ayakkabı des',NULL,NULL,10,300,550,NULL,'Suya (Yağmura) dayanıklı sentetik yüzey,\n-Rahat bir kullanım sağlayan yumuşak Smart Foam iç taban.\n-Ayağı sıcak tutan, polar kaplamalı iç astar,\n-Kolay giyilebilirlik sağlayan fermuarlı dil ve yaka yastıkları,','b1.jpg',NULL,12,NULL,'True'),(7,'ayakkabı2','ayakkabı2 key','ayakkabı2 des',NULL,NULL,27,350,270,NULL,'Suya (Yağmura) dayanıklı sentetik yüzey,\n-Rahat bir kullanım sağlayan yumuşak Smart Foam iç taban.\n-Ayağı sıcak tutan, polar kaplamalı iç astar,\n-Kolay giyilebilirlik sağlayan fermuarlı dil ve yaka yastıkları,','b2.jpg',NULL,12,NULL,'True'),(8,'ayakkabı3','ayakkabı3 key','ayakkabı3 des',NULL,NULL,20,300,350,NULL,'Suya (Yağmura) dayanıklı sentetik yüzey,\n-Rahat bir kullanım sağlayan yumuşak Smart Foam iç taban.\n-Ayağı sıcak tutan, polar kaplamalı iç astar,\n-Kolay giyilebilirlik sağlayan fermuarlı dil ve yaka yastıkları,','b3.jpg',NULL,12,NULL,'True'),(9,'ayakkabı4','ayakkabı4 key','ayakkabı4 des',NULL,NULL,50,150,200,NULL,'Suya (Yağmura) dayanıklı sentetik yüzey,\n-Rahat bir kullanım sağlayan yumuşak Smart Foam iç taban.\n-Ayağı sıcak tutan, polar kaplamalı iç astar,\n-Kolay giyilebilirlik sağlayan fermuarlı dil ve yaka yastıkları,','b4.jpg',NULL,12,NULL,'True'),(10,'ayakkabı5','ayakkabı5 key','ayakkabı5 des',NULL,NULL,10,450,550,NULL,'Suya (Yağmura) dayanıklı sentetik yüzey,\n-Rahat bir kullanım sağlayan yumuşak Smart Foam iç taban.\n-Ayağı sıcak tutan, polar kaplamalı iç astar,\n-Kolay giyilebilirlik sağlayan fermuarlı dil ve yaka yastıkları,','b1.jpg',NULL,12,NULL,'True'),(11,'sandisk','sandiisk','sandisk',NULL,NULL,20,200,30,NULL,'USB Flash Sürücü küçük görünebilir ama bu sürücüde müziklerinizi, fotoğraflarınızı, videolarınızı, sunumlarınızı ve elektronik tablolarınızı istediğiniz zaman depolayabilmeniz ve paylaşmanız için gerekenalan vardır.','6.jpg',NULL,10,NULL,'True'),(12,'sandisk2','sandisk2','sandisk2',NULL,NULL,30,50,60,NULL,'USB Flash Sürücü küçük görünebilir ama bu sürücüde müziklerinizi, fotoğraflarınızı, videolarınızı, sunumlarınızı ve elektronik tablolarınızı istediğiniz zaman depolayabilmeniz ve paylaşmanız için gerekenalan vardır.','7.jpg',NULL,10,NULL,'True'),(13,'sandisk3','sandisk3','sandisk3',NULL,NULL,40,25,15,NULL,'USB Flash Sürücü küçük görünebilir ama bu sürücüde müziklerinizi, fotoğraflarınızı, videolarınızı, sunumlarınızı ve elektronik tablolarınızı istediğiniz zaman depolayabilmeniz ve paylaşmanız için gerekenalan vardır.','8.jpg',NULL,10,NULL,'True'),(14,'sandisk4','sandisk4','sandisk4',NULL,NULL,30,45,55,NULL,'USB Flash Sürücü küçük görünebilir ama bu sürücüde müziklerinizi, fotoğraflarınızı, videolarınızı, sunumlarınızı ve elektronik tablolarınızı istediğiniz zaman depolayabilmeniz ve paylaşmanız için gerekenalan vardır.','10.jpg',NULL,10,NULL,'True'),(15,'sandisk5','sandisk5','sandisk5',NULL,NULL,30,25,10,NULL,'USB Flash Sürücü küçük görünebilir ama bu sürücüde müziklerinizi, fotoğraflarınızı, videolarınızı, sunumlarınızı ve elektronik tablolarınızı istediğiniz zaman depolayabilmeniz ve paylaşmanız için gerekenalan vardır.','12.jpg',NULL,10,NULL,'True'),(19,'Zımba Detaylı Çanta','Zımba Detaylı Çanta','Zımba Detaylı Çanta',NULL,NULL,20,39.99,10,NULL,NULL,'d5859a5d8dd0de594341e3ceafd1009d.jpeg',NULL,13,NULL,'True'),(20,'Deri Görünümlü Omuz Çantası','Deri Görünümlü Omuz Çantası','Deri Görünümlü Omuz Çantası',NULL,NULL,10,29.99,10,NULL,'<p><strong>Açıklama:</strong>Fermuar Detaylı, Deri Görünümlü Omuz Çantası</p>','8e88d7c796cd9f5c12ee2f5b69ba506a.jpeg',NULL,13,NULL,'True'),(21,'Deri Görünümlü Kol Çantası','Deri Görünümlü Kol Çantası','Deri Görünümlü Kol Çantası',NULL,NULL,10,59.99,59.99,NULL,'<p><strong>Açıklama:</strong>Deri Görünümlü Kol Çantası</p>','a206e0d164bd8d2cf513adf4a599396a.jpeg',NULL,13,NULL,'True'),(22,'Deri Görünümlü Bel Çantası','Deri Görünümlü Bel Çantası','Deri Görünümlü Bel Çantası',NULL,NULL,10,49.99,49.99,NULL,'<p><strong>Açıklama:</strong>Fermuar Detaylı Bel Çantası</p>','2c7eb5d58248deea1115e48d824aac5e.jpeg',NULL,13,NULL,'True'),(23,'Deri Görünümlü Omuz Çantası','Deri Görünümlü Omuz Çantası','Deri Görünümlü Omuz Çantası',NULL,NULL,10,59.99,59.99,NULL,'<p><strong>Açıklama:</strong>Deri Görünümlü Omuz Çantası</p>','18af3fe87438275b3c10d89572f43f56.jpeg',NULL,13,NULL,'True'),(24,'Güneş Gözlüğü','Güneş Gözlüğü','Güneş Gözlüğü',NULL,NULL,10,35.99,35.99,NULL,'<p><strong>Açıklama:</strong>Güneş Gözlüğü</p>','05f1e3cf7849c4bd6425cbb75dfe07b4.jpeg',NULL,16,NULL,'True'),(25,'Açıklama:Güneş Gözlüğü','Açıklama:Güneş Gözlüğü','Açıklama:Güneş Gözlüğü',NULL,NULL,10,29.99,29.99,NULL,'<p><strong>Açıklama:</strong>Güneş Gözlüğü</p>','37fd4e02d42666482403c19ce48b209e.jpeg',NULL,16,NULL,'True'),(26,'Güneş Gözlüğü','Güneş Gözlüğü','Güneş Gözlüğü',NULL,NULL,10,24.99,24.99,NULL,'<p><strong>Açıklama:</strong>Çerçeve Detaylı Güneş Gözlüğü</p>','aab36e91d61891dc8e77d45353efd5fa.jpeg',NULL,16,NULL,'True'),(27,'Kahverengi Kadın Gözlük','Kahverengi Kadın Gözlük','Kahverengi Kadın Gözlük',NULL,NULL,10,19.95,19.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1033116</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Plastik</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Gözlük</td></tr><tr><th><strong>Renk</strong></th><td>Kahverengi</td></tr></tbody></table></figure>','c3d587c2bf5693b60952282b4e362500.jpeg',NULL,16,NULL,'True'),(28,'Yeşil Kadın Gözlük','Yeşil Kadın Gözlük','Yeşil Kadın Gözlük',NULL,NULL,10,19.95,19.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1033093</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Metal</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Gözlük</td></tr><tr><th><strong>Renk</strong></th><td>Yeşil</td></tr></tbody></table></figure>','43930238a05e1058fdb2b04b35f516ce.jpeg',NULL,16,NULL,'True'),(29,'Lacivert Kadın Saat','Lacivert Kadın Saat','Lacivert Kadın Saat',NULL,NULL,10,99.95,99.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1036561</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Metal</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Saat</td></tr><tr><th><strong>Renk</strong></th><td>Lacivert</td></tr></tbody></table></figure>','11e238205549b08710896cbb503e8ccd.jpeg',NULL,17,NULL,'True'),(30,'Siyah Kadın Saat','Siyah Kadın Saat','Siyah Kadın Saat',NULL,NULL,10,49.95,49.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1036572</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Poliüretan</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Saat</td></tr><tr><th><strong>Renk</strong></th><td>Siyah</td></tr></tbody></table></figure>','225a913ef7f7b396ad9205225dff2deb.jpeg',NULL,17,NULL,'True'),(31,'Gümüş Kadın Saat','Gümüş Kadın Saat','Gümüş Kadın Saat',NULL,NULL,10,49.95,49.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1036570</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Poliüretan</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Saat</td></tr><tr><th><strong>Renk</strong></th><td>Gümüş</td></tr></tbody></table></figure>','74d18b70fc6d3dfc93d22ca09326b55f.jpeg',NULL,17,NULL,'True'),(32,'Siyah Kadın Saat','Siyah Kadın Saat','Siyah Kadın Saat',NULL,NULL,10,49.99,49.99,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1030740</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>BOŞ</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Saat</td></tr><tr><th><strong>Renk</strong></th><td>Siyah</td></tr></tbody></table></figure>','793f50cf2f234ed6c2928894bccb1dd2.jpeg',NULL,17,NULL,'True'),(33,'Pembe Kadın Saat','Pembe Kadın Saat','Pembe Kadın Saat',NULL,NULL,10,49.95,49.95,NULL,'<figure class=\"table\"><table><tbody><tr><th><strong>ÜRÜN KODU</strong></th><td>CL1036570</td></tr><tr><th><strong>ÜRÜN İÇERİĞİ</strong></th><td>%100 Poliüretan</td></tr></tbody></table></figure><figure class=\"table\"><table><tbody><tr><th><strong>Beden</strong></th><td>STND</td></tr><tr><th><strong>CİNSİYET</strong></th><td>Kadın</td></tr><tr><th><strong>Fit</strong></th><td>Modern Fit</td></tr><tr><th><strong>Kategori</strong></th><td>Saat</td></tr><tr><th><strong>Renk</strong></th><td>Pembe</td></tr></tbody></table></figure>','c9ae0bd600879bbec0ca3c3642e4682a.jpeg',NULL,17,NULL,'True'),(34,'FST500 FİTNESS / KARDİYO ŞORTU - ERKEK - HAKİ / SİYAH DOMYOS',NULL,NULL,NULL,NULL,3,64.99,64.99,NULL,'Fitness tutkunları olarak bizler bu ürünü orta seviyede ve orta yoğunlukta, haftada 2 - 3 defa fitness antrenmanları yapan sizler için tasarladık.','d80d2a315ac95e0c2e9022981d8d2e1c.jpeg',NULL,18,NULL,'True'),(35,'FST520 2\'Sİ 1 ARADA FITNESS / KARDİYO ŞORTU - ERKEK - GRİ / MAVİ DOMYOS',NULL,NULL,NULL,NULL,84,NULL,84.99,NULL,'Haftada 2 - 3 defa orta yoğunlukta fitness - kardiyo antrenmanları yapanlar için tasarlandı.','1780067362450251cd15d10a728c6cda.jpeg',NULL,18,NULL,'True'),(36,'FST 500 FİTNESS / KARDİYO ŞORTU - ERKEK - BORDO / SİYAH DOMYOS',NULL,NULL,NULL,NULL,10,74.99,74.99,NULL,'Tasarım ekibimiz bu ürünü, hiçbir kursu kaçırmayan ve düzenli olarak egzersiz yapan fitness tutkunları için tasarladı.','dadfc248cda087bfd9849bbf8dd9ac84.jpeg',NULL,18,NULL,'True'),(37,'FST 520 FİTNESS / KARDİYO ŞORTU - ERKEK - SİYAH DOMYOS',NULL,NULL,NULL,NULL,10,99.99,99.99,NULL,'Tasarım ekibimiz bu ürünü, hiçbir kursu kaçırmayan ve düzenli olarak egzersiz yapan fitness tutkunları için tasarladı.','1e90218b24ca536f065dbe552f4f3fb7.jpeg',NULL,18,NULL,'True'),(38,'FST100 FITNESS / KARDİYO ŞORTU - ERKEK - SİYAH DOMYOS',NULL,NULL,NULL,NULL,10,29.99,29.99,NULL,'Fitness tutkunları olarak bizler bu ürünü fitness yapmaya başlayan ve orta yoğunlukta, haftada 1 - 2 defa antrenman yapan sizler için tasarladık.','4e5f1b8674ce7733e94120c7efada3bf.jpeg',NULL,18,NULL,'True'),(39,'RUN ACTİVE GRİP KOŞU AYAKKABISI - KADIN - YEŞİL KALENJI',NULL,NULL,NULL,NULL,10,159.99,159.99,NULL,'Haftada 1 - 2 kere, yollarda, maksimum 1 saat, koşu antrenmanı yapan kadınlar için tasarlandı.','69936c04b460a09d40e08c833a5fd3f0.jpeg',NULL,19,NULL,'True'),(40,'RUN ACTİVE GRİP KOŞU AYAKKABISI - ERKEK - GRİ / SİYAH KALENJI',NULL,NULL,NULL,NULL,10,179.99,179.99,NULL,'Haftada 1 - 2 kere, yollarda ve parkurlarda 1 saatlik koşu antrenmanları yapan erkekler için tasarlandı','0c3fb727dc34d674bfb761eabd55df95.jpeg',NULL,19,NULL,'True'),(41,'RUN ACTİVE KOŞU AYAKKABISI - ERKEK - SİYAH / SARI KALENJI',NULL,NULL,NULL,NULL,10,159.99,159.99,NULL,'Bu koşu ayakkabısını haftada bir veya iki defa maksimum 45 dakika koşu antrenmanı yapanlara darbe emicilik ve rahatlık sağlaması için tasarladık','5090ab04f60a4dbf79939c9fb36281ea.jpeg',NULL,19,NULL,'True'),(42,'RUN CUSHION JOGGING AYAKKABISI - KADIN - AÇIK YEŞİL KALENJI',NULL,NULL,NULL,NULL,NULL,99.99,99.99,NULL,'Tasarım ekiplerimiz bu ayakkabıyı haftada 1 defa, yolda ya da koşu bandında yapacağınız ilk koşu antrenmanlarınız için geliştirdi','ca88d911b93497c69b7b8d6e22a227a4.jpeg',NULL,19,NULL,'True'),(43,'KIPRUN GRIP ATLETİZM AYAKKABISI - ÇOCUK - GRİ / SİYAH / NEON TURUNCU KALENJI',NULL,NULL,NULL,NULL,10,129.99,129.99,NULL,'Rahat, çim veya taşlı zeminlerde yol tutuş sağlayan bir ayakkabı ile atletizm yaparak kendini geliştirmek isteyen çocuklar için tasarlandı','0feb3eb50fb80e3ac5d9aed41910a214.jpeg',NULL,19,NULL,'True'),(47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>&nbsp;</p>','1.png',NULL,20,NULL,'True'),(48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>&nbsp;</p>','2.png',NULL,NULL,NULL,'True'),(49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>&nbsp;</p>','3.png',NULL,NULL,NULL,'True'),(50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>&nbsp;</p>','4.png',NULL,NULL,NULL,'True');

#
# Structure for table "setting"
#

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smptppassw` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpport` int(11) DEFAULT NULL,
  `aboutus` longtext COLLATE utf8mb4_unicode_ci,
  `contact` longtext COLLATE utf8mb4_unicode_ci,
  `referances` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpserver` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtpemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "setting"
#

INSERT INTO `setting` VALUES (1,'online avm','description key','deneme key','company key','adress key','fax key',NULL,NULL,NULL,NULL,'<ol><li><strong>Hakkımızda sayfası içinde ekibinize de yer verin</strong></li><li>Büyük&nbsp;</li><li>kurumsal&nbsp;</li><li>firmalar</li></ol><p>&nbsp;için bunu yapmak biraz zor olabilir. Özellikle çok fazla çalışan bulunuyorsa, ekibinizin tümüne burada yer veremeyebilirsiniz. Ancak daha orta ölçekli veya küçük girişimler bu tür bir yaklaşımdan yararlanabilirler.</p><p>Tüketiciler, alışveriş yaparken karşılarındaki firmayı da tanımak isteyeceklerdir. Ekibinizin fotoğraflarını paylaşmak, tüketicilerin güven algısını da olumlu yönde etkiler. Ekibinizdeki kişilerin yaptıkları işleri, hangi alanda uzman olduklarını, şirkette hangi pozisyonda olduklarını bu alana ekleyerek, kişisel bilgiler paylaşabilirsiniz.</p><h2><strong>Müşteri yorumlarını ekleyin</strong></h2><p>Müşterilerinizin yorumlarını paylaşmak da oldukça etkili yöntemlerden biridiri. Bunun sebebi ise, sizin hizmet verdiğiniz kişilerin markanız hakkındaki yorumları, sitenizi ilk kez ziyaret edenlerin de algısını etkileyecektir.</p><p>Gerçek kullanıcı yorumlarına yer verdiğinizde, bu kişilerin size güvendiklerini ve aldıkları hizmetten memnun olduklarını da yeni ziyaretçilere yansıtacaktır. Bu da tabii ki tüketicilerin gözünde, marka algınızı sağlamlaştıracaktır.</p><h2><strong>Şirket içi fotoğraflar veya videolar koyun</strong></h2><p>Kendinizi karşı tarafa daha iyi yansıtmak, şeffaflığınızı göst</p>','<p><strong>Adres</strong></p><p>Bizi ziyaret gelin:</p><p>Tantavi Mah. Menteşoğlu Cad. No:25 Kat:2 Terra Plaza&nbsp;<br>Ümraniye/İSTANBUL / TÜRKİYE (34696)<br>&nbsp;</p><p><strong>Tel:</strong> +90 850 200 0 444&nbsp;<br><strong>Fax:</strong> +90 216 606 29 89</p><p>info [at] isimtescil.net<br>destek [at] isimtescil.net</p>','<p>referanslar</p>','False',NULL,NULL),(2,'aaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'bbb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "shopcart"
#

DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "shopcart"
#

INSERT INTO `shopcart` VALUES (1,1,1,5);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'mehmetakif@gmail.com','ROLE_ADMIN','$2y$13$q97AMqZAmtOHzQq89HzL2.LAGBGwntLmmlRB8pC07lXnQuKe.Lm5S','Mehmet Akif KUŞ','True','kılavuzlar','karabuk','0530'),(2,'kullanici@gmail.com','ROLE_USER','$2y$13$q97AMqZAmtOHzQq89HzL2.LAGBGwntLmmlRB8pC07lXnQuKe.Lm5S','mehmet','True','öğretmenler','karabuk','540');
