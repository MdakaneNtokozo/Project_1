INSERT INTO destination_rating (dest_rating_id, dest_rating_name) VALUES
(1, 'Excellent'),
(2, 'Very Good'),
(3, 'Good'),
(4, 'Fair'),
(5, 'Poor');

INSERT INTO currency (curr_id, curr_name, curr_symbol) VALUES
(1, 'South African Rand', 'ZAR'),
(2, 'Japanese Yen', 'JPY'),
(3, 'US Dollar', 'USD'),
(4, 'Euro', 'EUR'),
(5, 'British Pound', 'GBP'),
(6, 'Australian Dollar', 'AUD'),
(7, 'Canadian Dollar', 'CAD'),
(8, 'Swiss Franc', 'CHF'),
(9, 'Chinese Yuan', 'CNY'),
(10, 'Brazilian Real', 'BRL');

INSERT INTO destination (dest_id, dest_name, dest_country, dest_rating_id, curr_id) VALUES
(1, 'Cape Town', 'South Africa', 1, 1),
(2, 'Johannesburg', 'South Africa', 2, 1),
(3, 'Durban', 'South Africa', 3, 1),
(4, 'Pretoria', 'South Africa', 2, 1),
(5, 'Port Elizabeth', 'South Africa', 3, 1),
(6, 'Tokyo', 'Japan', 1, 2),
(7, 'Kyoto', 'Japan', 2, 2),
(8, 'Osaka', 'Japan', 2, 2),
(9, 'Hokkaido', 'Japan', 3, 2),
(10, 'Hiroshima', 'Japan', 2, 2),
(11, 'New York City', 'USA', 1, 3),
(12, 'Los Angeles', 'USA', 2, 3),
(13, 'Chicago', 'USA', 3, 3),
(14, 'Miami', 'USA', 2, 3),
(15, 'San Francisco', 'USA', 1, 3),
(16, 'Paris', 'France', 1, 4),
(17, 'Berlin', 'Germany', 2, 4),
(18, 'Rome', 'Italy', 2, 4),
(19, 'Amsterdam', 'Netherlands', 2, 4),
(20, 'Barcelona', 'Spain', 1, 4),
(21, 'London', 'United Kingdom', 1, 5),
(22, 'Manchester', 'United Kingdom', 2, 5),
(23, 'Edinburgh', 'Scotland', 2, 5),
(24, 'Belfast', 'Northern Ireland', 3, 5),
(25, 'Cardiff', 'Wales', 2, 5),
(26, 'Sydney', 'Australia', 1, 6),
(27, 'Melbourne', 'Australia', 2, 6),
(28, 'Brisbane', 'Australia', 2, 6),
(29, 'Perth', 'Australia', 3, 6),
(30, 'Adelaide', 'Australia', 2, 6),
(31, 'Toronto', 'Canada', 1, 7),
(32, 'Vancouver', 'Canada', 1, 7),
(33, 'Montreal', 'Canada', 2, 7),
(34, 'Ottawa', 'Canada', 2, 7),
(35, 'Calgary', 'Canada', 3, 7),
(36, 'Zurich', 'Switzerland', 1, 8),
(37, 'Geneva', 'Switzerland', 2, 8),
(38, 'Basel', 'Switzerland', 2, 8),
(39, 'Bern', 'Switzerland', 3, 8),
(40, 'Lausanne', 'Switzerland', 2, 8),
(41, 'Beijing', 'China', 1, 9),
(42, 'Shanghai', 'China', 2, 9),
(43, 'Guangzhou', 'China', 2, 9),
(44, 'Shenzhen', 'China', 3, 9),
(45, 'Chengdu', 'China', 2, 9),
(46, 'Rio de Janeiro', 'Brazil', 1, 10),
(47, 'São Paulo', 'Brazil', 2, 10),
(48, 'Brasília', 'Brazil', 2, 10),
(49, 'Salvador', 'Brazil', 3, 10),
(50, 'Curitiba', 'Brazil', 2, 10);

INSERT INTO transportation_type (transp_type_id, transp_type_name) VALUES
(1, 'Air'),
(2, 'Rail'),
(3, 'Road'),
(4, 'Water'),
(5, 'Public Transit');

------------------------------------------------------
-- SOUTH AFRICA
------------------------------------------------------
INSERT INTO transportation VALUES
-- Cape Town (1)
(1, 'Cape Town International Airport', 50, 300, 1, 1),
(2, 'MyCiTi Bus Service', 1, 5, 5, 1),
(3, 'Cape Town Train Station', 2, 12, 2, 1),
(4, 'Uber/Local Taxi', 5, 40, 3, 1),
(5, 'Cape Town Harbour Ferry', 3, 20, 4, 1),
-- Johannesburg (2)
(6, 'O. R. Tambo International Airport', 60, 350, 1, 2),
(7, 'Gautrain Rapid Rail', 5, 20, 2, 2),
(8, 'Metrobus Service', 2, 8, 5, 2),
(9, 'Minibus Taxi Network', 1, 10, 3, 2),
(10, 'Lanseria Airport Shuttle', 20, 60, 1, 2),
-- Durban (3)
(11, 'King Shaka International Airport', 50, 250, 1, 3),
(12, 'People Mover Bus', 1, 6, 5, 3),
(13, 'Durban Station Rail', 2, 15, 2, 3),
(14, 'Metered Taxis', 5, 35, 3, 3),
(15, 'Durban Harbour Ferry', 3, 18, 4, 3),
-- Pretoria (4)
(16, 'Wonderboom Airport', 40, 200, 1, 4),
(17, 'Gautrain Rail Link', 5, 18, 2, 4),
(18, 'A Re Yeng BRT', 1, 7, 5, 4),
(19, 'Local Taxi Services', 3, 25, 3, 4),
(20, 'Car Hire Pretoria CBD', 25, 90, 3, 4),
-- Port Elizabeth (5)
(21, 'Chief Dawid Stuurman Airport', 45, 220, 1, 5),
(22, 'Algoa Bus Company', 1, 7, 5, 5),
(23, 'Metrorail Eastern Cape', 2, 12, 2, 5),
(24, 'Minibus Taxis', 2, 15, 3, 5),
(25, 'Port Elizabeth Harbour Ferry', 3, 20, 4, 5);

------------------------------------------------------
-- JAPAN
------------------------------------------------------
INSERT INTO transportation VALUES
-- Tokyo (6)
(26, 'Narita International Airport', 80, 400, 1, 6),
(27, 'Tokyo Metro', 2, 10, 5, 6),
(28, 'Shinkansen Bullet Train', 50, 200, 2, 6),
(29, 'JR Rail Network', 10, 50, 2, 6),
(30, 'Tokyo Bus System', 1, 5, 5, 6),
-- Kyoto (7)
(31, 'Kansai International Airport', 60, 300, 1, 7),
(32, 'Kyoto Subway', 2, 8, 5, 7),
(33, 'JR Kyoto Line', 5, 25, 2, 7),
(34, 'City Bus Service', 1, 4, 5, 7),
(35, 'Taxi Services Kyoto', 5, 40, 3, 7),
-- Osaka (8)
(36, 'Itami Airport', 50, 250, 1, 8),
(37, 'Osaka Metro', 2, 9, 5, 8),
(38, 'Shinkansen Osaka Hub', 50, 180, 2, 8),
(39, 'Hanshin Highway Bus', 5, 25, 5, 8),
(40, 'Taxi Services Osaka', 6, 45, 3, 8),
-- Hokkaido (9)
(41, 'New Chitose Airport', 70, 280, 1, 9),
(42, 'Hokkaido Shinkansen', 40, 150, 2, 9),
(43, 'Sapporo Subway', 2, 10, 5, 9),
(44, 'Local Buses Hokkaido', 2, 12, 5, 9),
(45, 'Taxi Services Sapporo', 7, 35, 3, 9),
-- Hiroshima (10)
(46, 'Hiroshima Airport', 55, 220, 1, 10),
(47, 'JR Sanyo Line', 10, 40, 2, 10),
(48, 'Hiroshima Electric Railway (Tram)', 1, 5, 5, 10),
(49, 'Taxi Services Hiroshima', 5, 30, 3, 10),
(50, 'Miyajima Ferry', 3, 15, 4, 10);

------------------------------------------------------
-- USA
------------------------------------------------------
INSERT INTO transportation VALUES
-- New York City (11)
(51, 'JFK International Airport', 100, 500, 1, 11),
(52, 'New York Subway', 3, 10, 5, 11),
(53, 'Amtrak Penn Station', 30, 200, 2, 11),
(54, 'Yellow Cabs', 5, 50, 3, 11),
(55, 'Staten Island Ferry', 0, 2, 4, 11),
-- Los Angeles (12)
(56, 'LAX International Airport', 120, 550, 1, 12),
(57, 'Metro Rail LA', 2, 15, 5, 12),
(58, 'Amtrak Union Station', 30, 180, 2, 12),
(59, 'LA Metro Bus', 1, 8, 5, 12),
(60, 'Uber/Lyft Rides', 10, 60, 3, 12),
-- Chicago (13)
(61, 'O’Hare International Airport', 110, 480, 1, 13),
(62, 'Chicago CTA Train (L)', 2, 10, 5, 13),
(63, 'Amtrak Chicago Union', 25, 160, 2, 13),
(64, 'CTA Bus Service', 1, 7, 5, 13),
(65, 'Taxi Services Chicago', 5, 45, 3, 13),
-- Miami (14)
(66, 'Miami International Airport', 90, 420, 1, 14),
(67, 'Tri-Rail Train', 5, 20, 2, 14),
(68, 'Miami-Dade Bus Service', 2, 10, 5, 14),
(69, 'Port of Miami Ferry', 5, 25, 4, 14),
(70, 'Taxi Services Miami', 6, 50, 3, 14),
-- San Francisco (15)
(71, 'SFO International Airport', 100, 500, 1, 15),
(72, 'BART Rail System', 2, 15, 2, 15),
(73, 'MUNI Metro', 2, 8, 5, 15),
(74, 'Cable Cars SF', 6, 15, 5, 15),
(75, 'Golden Gate Ferry', 5, 20, 4, 15);

------------------------------------------------------
-- EUROPE
------------------------------------------------------
-- Paris (16)
INSERT INTO transportation VALUES
(76, 'Charles de Gaulle Airport', 90, 400, 1, 16),
(77, 'Paris Metro', 2, 10, 5, 16),
(78, 'TGV High-Speed Rail', 40, 150, 2, 16),
(79, 'Paris City Buses', 2, 8, 5, 16),
(80, 'Seine River Ferry', 5, 20, 4, 16),
-- Berlin (17)
(81, 'Berlin Brandenburg Airport', 80, 350, 1, 17),
(82, 'Berlin U-Bahn', 2, 9, 5, 17),
(83, 'Deutsche Bahn Intercity', 30, 120, 2, 17),
(84, 'Berlin Tram System', 2, 6, 5, 17),
(85, 'Taxi Services Berlin', 5, 40, 3, 17),
-- Rome (18)
(86, 'Leonardo da Vinci–Fiumicino Airport', 75, 300, 1, 18),
(87, 'Rome Metro', 2, 7, 5, 18),
(88, 'Trenitalia Rail', 25, 110, 2, 18),
(89, 'Rome Bus Service', 1, 6, 5, 18),
(90, 'Taxi Services Rome', 5, 35, 3, 18),
-- Amsterdam (19)
(91, 'Schiphol Airport', 70, 280, 1, 19),
(92, 'Amsterdam Metro', 2, 8, 5, 19),
(93, 'Dutch National Rail (NS)', 20, 100, 2, 19),
(94, 'Amsterdam Tram Network', 2, 6, 5, 19),
(95, 'Canal Ferry Service', 5, 15, 4, 19),
-- Barcelona (20)
(96, 'Barcelona El Prat Airport', 65, 270, 1, 20),
(97, 'Barcelona Metro', 2, 7, 5, 20),
(98, 'Renfe High-Speed Train', 30, 120, 2, 20),
(99, 'TMB Bus Service', 1, 5, 5, 20),
(100, 'Barcelona Harbour Ferry', 4, 18, 4, 20);

------------------------------------------------------
-- UNITED KINGDOM
------------------------------------------------------
-- London (21)
INSERT INTO transportation VALUES
(101, 'Heathrow Airport', 100, 450, 1, 21),
(102, 'London Underground (Tube)', 3, 10, 5, 21),
(103, 'National Rail London', 20, 120, 2, 21),
(104, 'London Bus Network', 2, 7, 5, 21),
(105, 'Thames River Ferry', 5, 15, 4, 21),
-- Manchester (22)
(106, 'Manchester Airport', 70, 300, 1, 22),
(107, 'Manchester Metrolink Tram', 2, 8, 5, 22),
(108, 'National Rail Manchester', 20, 100, 2, 22),
(109, 'Stagecoach Buses', 2, 6, 5, 22),
(110, 'Taxi Services Manchester', 5, 35, 3, 22),
-- Edinburgh (23)
(111, 'Edinburgh Airport', 65, 280, 1, 23),
(112, 'Edinburgh Trams', 2, 7, 5, 23),
(113, 'ScotRail Services', 15, 90, 2, 23),
(114, 'Edinburgh Bus Service', 2, 6, 5, 23),
(115, 'Taxi Services Edinburgh', 6, 40, 3, 23),
-- Belfast (24)
(116, 'Belfast International Airport', 55, 250, 1, 24),
(117, 'Translink Rail', 10, 60, 2, 24),
(118, 'Metro Bus Service Belfast', 2, 6, 5, 24),
(119, 'Harbour Ferry Belfast', 5, 18, 4, 24),
(120, 'Taxi Services Belfast', 5, 30, 3, 24),
-- Cardiff (25)
(121, 'Cardiff Airport', 50, 220, 1, 25),
(122, 'Transport for Wales Rail', 12, 70, 2, 25),
(123, 'Cardiff Bus', 2, 6, 5, 25),
(124, 'Local Taxi Services', 5, 28, 3, 25),
(125, 'Ferry to Bristol Channel', 6, 20, 4, 25);

------------------------------------------------------
-- AUSTRALIA
------------------------------------------------------
-- Sydney (26)
INSERT INTO transportation VALUES
(126, 'Sydney Kingsford Smith Airport', 80, 350, 1, 26),
(127, 'Sydney Trains', 3, 15, 2, 26),
(128, 'Sydney Metro', 2, 8, 5, 26),
(129, 'Sydney Ferry Network', 5, 18, 4, 26),
(130, 'Sydney Buses', 2, 7, 5, 26),
-- Melbourne (27)
(131, 'Melbourne Tullamarine Airport', 75, 320, 1, 27),
(132, 'Metro Trains Melbourne', 3, 14, 2, 27),
(133, 'Yarra Trams', 2, 8, 5, 27),
(134, 'SkyBus Airport Express', 15, 25, 3, 27),
(135, 'Melbourne Bus Network', 2, 6, 5, 27),
-- Brisbane (28)
(136, 'Brisbane International Airport', 70, 300, 1, 28),
(137, 'Queensland Rail City Network', 3, 12, 2, 28),
(138, 'Brisbane CityCat Ferry', 5, 20, 4, 28),
(139, 'TransLink Bus Service', 2, 7, 5, 28),
(140, 'Local Taxi/Uber Services', 5, 35, 3, 28),
-- Perth (29)
(141, 'Perth Airport', 65, 280, 1, 29),
(142, 'Transperth Train Services', 3, 10, 2, 29),
(143, 'Transperth Buses', 2, 7, 5, 29),
(144, 'Swan River Ferry', 4, 15, 4, 29),
(145, 'Taxi Services Perth', 6, 40, 3, 29),
-- Adelaide (30)
(146, 'Adelaide Airport', 60, 250, 1, 30),
(147, 'Adelaide Metro Trains', 3, 11, 2, 30),
(148, 'Adelaide Metro Trams', 2, 6, 5, 30),
(149, 'Adelaide Metro Buses', 2, 7, 5, 30),
(150, 'Taxi Services Adelaide', 5, 30, 3, 30);

------------------------------------------------------
-- CANADA
------------------------------------------------------
-- Toronto (31)
INSERT INTO transportation VALUES
(151, 'Toronto Pearson International Airport', 90, 400, 1, 31),
(152, 'TTC Subway', 3, 10, 5, 31),
(153, 'GO Transit Rail', 5, 25, 2, 31),
(154, 'Toronto Buses', 2, 8, 5, 31),
(155, 'Taxi/Uber Services Toronto', 6, 40, 3, 31),
-- Vancouver (32)
(156, 'Vancouver International Airport', 80, 350, 1, 32),
(157, 'SkyTrain', 3, 12, 2, 32),
(158, 'TransLink Buses', 2, 7, 5, 32),
(159, 'SeaBus Ferry', 5, 15, 4, 32),
(160, 'Taxi/Uber Services Vancouver', 5, 35, 3, 32),
-- Montreal (33)
(161, 'Montréal–Trudeau Airport', 85, 380, 1, 33),
(162, 'Montreal Metro', 2, 9, 5, 33),
(163, 'Exo Commuter Rail', 4, 20, 2, 33),
(164, 'STM Bus Network', 2, 7, 5, 33),
(165, 'Taxi/Uber Services Montreal', 5, 35, 3, 33),
-- Ottawa (34)
(166, 'Ottawa Macdonald-Cartier Airport', 70, 300, 1, 34),
(167, 'OC Transpo Bus', 2, 6, 5, 34),
(168, 'O-Train Light Rail', 3, 12, 2, 34),
(169, 'Taxi/Uber Services Ottawa', 5, 30, 3, 34),
(170, 'Ottawa River Ferry', 3, 15, 4, 34),
-- Calgary (35)
(171, 'Calgary International Airport', 75, 320, 1, 35),
(172, 'CTrain Light Rail', 3, 12, 2, 35),
(173, 'Calgary Bus Network', 2, 7, 5, 35),
(174, 'Taxi/Uber Services Calgary', 5, 35, 3, 35),
(175, 'Bow River Ferry', 3, 15, 4, 35);

------------------------------------------------------
-- SWITZERLAND
------------------------------------------------------
-- Zurich (36)
INSERT INTO transportation VALUES
(176, 'Zurich Airport', 80, 350, 1, 36),
(177, 'SBB Swiss Rail', 15, 60, 2, 36),
(178, 'Zurich Trams', 2, 8, 5, 36),
(179, 'Zurich Buses', 2, 7, 5, 36),
(180, 'Taxi Services Zurich', 6, 40, 3, 36),
-- Geneva (37)
(181, 'Geneva Airport', 75, 330, 1, 37),
(182, 'Geneva Tram Network', 2, 7, 5, 37),
(183, 'Geneva Bus Service', 2, 6, 5, 37),
(184, 'Swiss Rail Geneva', 15, 55, 2, 37),
(185, 'Taxi Services Geneva', 5, 35, 3, 37),
-- Basel (38)
(186, 'EuroAirport Basel-Mulhouse-Freiburg', 70, 320, 1, 38),
(187, 'Basel Trams', 2, 6, 5, 38),
(188, 'Basel Bus Network', 2, 7, 5, 38),
(189, 'SBB Swiss Rail Basel', 12, 50, 2, 38),
(190, 'Taxi Services Basel', 5, 35, 3, 38),
-- Bern (39)
(191, 'Bern Airport', 60, 280, 1, 39),
(192, 'Bern Tram & Bus', 2, 6, 5, 39),
(193, 'Swiss Rail Bern', 10, 50, 2, 39),
(194, 'Taxi Services Bern', 5, 30, 3, 39),
(195, 'Aare River Ferry', 3, 15, 4, 39),
-- Lausanne (40)
(196, 'Lausanne Airport Shuttle', 50, 250, 1, 40),
(197, 'Lausanne Metro & Bus', 2, 7, 5, 40),
(198, 'Swiss Rail Lausanne', 10, 45, 2, 40),
(199, 'Taxi Services Lausanne', 5, 30, 3, 40),
(200, 'Lake Geneva Ferry', 3, 15, 4, 40);

------------------------------------------------------
-- CHINA
------------------------------------------------------
-- Beijing (41)
INSERT INTO transportation VALUES
(201, 'Beijing Capital International Airport', 80, 400, 1, 41),
(202, 'Beijing Subway', 2, 8, 5, 41),
(203, 'China Railway Beijing', 20, 100, 2, 41),
(204, 'Beijing Bus Network', 1, 6, 5, 41),
(205, 'Taxi Services Beijing', 5, 35, 3, 41),
-- Shanghai (42)
(206, 'Shanghai Pudong Airport', 85, 420, 1, 42),
(207, 'Shanghai Metro', 2, 8, 5, 42),
(208, 'China Railway Shanghai', 20, 100, 2, 42),
(209, 'Shanghai Bus Network', 1, 6, 5, 42),
(210, 'Taxi Services Shanghai', 5, 40, 3, 42),
-- Guangzhou (43)
(211, 'Guangzhou Baiyun International Airport', 70, 350, 1, 43),
(212, 'Guangzhou Metro', 2, 7, 5, 43),
(213, 'China Railway Guangzhou', 15, 90, 2, 43),
(214, 'Guangzhou Bus Network', 1, 6, 5, 43),
(215, 'Taxi Services Guangzhou', 5, 35, 3, 43), 
-- Shenzhen (44)
(216, 'Shenzhen Bao’an International Airport', 75, 360, 1, 44),
(217, 'Shenzhen Metro', 2, 7, 5, 44),
(218, 'China Railway Shenzhen', 15, 90, 2, 44),
(219, 'Shenzhen Bus Network', 1, 5, 5, 44),
(220, 'Taxi Services Shenzhen', 5, 35, 3, 44), 
-- Chengdu (45)
(221, 'Chengdu Shuangliu Airport', 70, 340, 1, 45),
(222, 'Chengdu Metro', 2, 7, 5, 45),
(223, 'China Railway Chengdu', 15, 90, 2, 45),
(224, 'Chengdu Bus Network', 1, 5, 5, 45),
(225, 'Taxi Services Chengdu', 5, 35, 3, 45);

------------------------------------------------------
-- BRAZIL
------------------------------------------------------
-- Rio de Janeiro (46)
INSERT INTO transportation VALUES
(226, 'Galeão International Airport', 70, 350, 1, 46),
(227, 'Rio de Janeiro Metro', 2, 8, 5, 46),
(228, 'VLT Light Rail', 2, 6, 5, 46),
(229, 'Rio Bus Network', 1, 5, 5, 46),
(230, 'Taxi Services Rio', 5, 35, 3, 46),
-- São Paulo (47)
(231, 'São Paulo Guarulhos Airport', 75, 380, 1, 47),
(232, 'São Paulo Metro', 2, 8, 5, 47),
(233, 'CPTM Train', 3, 12, 2, 47),
(234, 'São Paulo Bus Network', 1, 6, 5, 47),
(235, 'Taxi Services São Paulo', 5, 35, 3, 47), 
-- Brasília (48)
(236, 'Brasília International Airport', 65, 300, 1, 48),
(237, 'Brasília Bus Rapid Transit', 2, 7, 5, 48),
(238, 'Taxi Services Brasília', 5, 30, 3, 48),
(239, 'Local Shuttle Services', 3, 15, 3, 48),
(240, 'Ferry Services Lake Paranoá', 3, 15, 4, 48),
-- Salvador (49)
(241, 'Deputado Luís Eduardo Magalhães Airport', 60, 280, 1, 49),
(242, 'Salvador Metro', 2, 7, 5, 49),
(243, 'Salvador Bus Network', 1, 6, 5, 49),
(244, 'Taxi Services Salvador', 5, 30, 3, 49),
(245, 'Ferry to Itaparica', 3, 15, 4, 49),
-- Curitiba (50)
(246, 'Afonso Pena International Airport', 60, 300, 1, 50),
(247, 'Curitiba Metro', 2, 7, 5, 50),
(248, 'Curitiba Bus Rapid Transit', 2, 6, 5, 50),
(249, 'Taxi Services Curitiba', 5, 35, 3, 50),
(250, 'Local Shuttle Services', 3, 15, 3, 50);

INSERT INTO accomodation_type (acc_type_id, acc_type_name) VALUES
(1, 'Hotel'),
(2, 'Hostel'),
(3, 'Guesthouse'),
(4, 'Apartment'),
(5, 'Resort');

--------------------------------------------------
-- south Africa
--------------------------------------------------
-- CAPE TOWN (1)
INSERT INTO accomodation VALUES
(1, 'The Table Bay Hotel', 'Quay 6, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa', 150, 500, 2, 1, 1),
(2, 'Atlantic Point Backpackers', '2 Cavalcade Road, Green Point, Cape Town, 8005, South Africa', 25, 80, 6, 2, 1),
(3, 'A Sunflower Stop Guesthouse', '179 Main Road, Green Point, Cape Town, 8005, South Africa', 40, 110, 4, 3, 1),
(4, 'Lawhill Luxury Apartments', 'Dock Road, V&A Waterfront, Cape Town, 8001, South Africa', 90, 250, 4, 4, 1),
(5, 'One&Only Cape Town', 'Dock Road, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa', 250, 800, 2, 5, 1),
-- JOHANNESBURG (2)
(6, 'The Maslow Hotel', 'Corner Grayston Drive & Rivonia Road, Sandton, Johannesburg, 2031, South Africa', 120, 400, 2, 1, 2),
(7, 'Once in Joburg', '90 De Korte Street, Braamfontein, Johannesburg, 2001, South Africa', 20, 60, 5, 2, 2),
(8, 'Remote Corner Guesthouse', '47 4th Avenue, Parkhurst, Johannesburg, 2193, South Africa', 50, 120, 3, 3, 2),
(9, 'Sandton Executive Suites', '125 Daisy Street, Sandown, Sandton, Johannesburg, 2196, South Africa', 100, 250, 4, 4, 2),
(10, 'Four Seasons Hotel The Westcliff', '67 Jan Smuts Avenue, Westcliff, Johannesburg, 2193, South Africa', 220, 600, 2, 5, 2),
-- DURBAN (3)
(11, 'The Oyster Box Hotel', '2 Lighthouse Road, Umhlanga, Durban, 4319, South Africa', 180, 500, 2, 1, 3),
(12, 'Curiocity Durban', '55 Mahatma Gandhi Road, Point, Durban, 4001, South Africa', 25, 75, 6, 2, 3),
(13, 'Cowrie Cove Guesthouse', '4 Cowrie Terrace, La Lucia, Durban, 4051, South Africa', 60, 150, 3, 3, 3),
(14, 'Point Waterfront Apartments', '14 Timeball Boulevard, Point Waterfront, Durban, 4001, South Africa', 90, 230, 4, 4, 3),
(15, 'Southern Sun Elangeni & Maharani', '63 Snell Parade, North Beach, Durban, 4001, South Africa', 200, 600, 2, 5, 3),
-- PRETORIA (4)
(16, 'Sheraton Pretoria Hotel', '643 Corner Church and Wessels Streets, Arcadia, Pretoria, 0007, South Africa', 130, 400, 2, 1, 4),
(17, '1322 Backpackers International', '1322 Arcadia Street, Hatfield, Pretoria, 0083, South Africa', 20, 60, 6, 2, 4),
(18, 'Cricklewood Manor Guesthouse', '193 Albert Street, Waterkloof, Pretoria, 0181, South Africa', 70, 180, 4, 3, 4),
(19, 'Menlyn Maine Residences', '202 Amarand Avenue, Waterkloof Glen, Pretoria, 0181, South Africa', 100, 250, 4, 4, 4),
(20, 'Protea Hotel Fire & Ice! by Marriott Pretoria Menlyn', '221 Garsfontein Road, Menlyn, Pretoria, 0181, South Africa', 180, 500, 2, 5, 4),
-- PORT ELIZABETH (5)
(21, 'The Boardwalk Hotel', 'Marine Drive, Summerstrand, Port Elizabeth, 6001, South Africa', 130, 420, 2, 1, 5),
(22, 'Island Vibe Port Elizabeth', '4 Jenvey Road, Summerstrand, Port Elizabeth, 6001, South Africa', 25, 70, 6, 2, 5),
(23, 'Admiralty Beach House', '9 Admiralty Way, Summerstrand, Port Elizabeth, 6001, South Africa', 70, 160, 3, 3, 5),
(24, 'Brookes Hill Suites Apartments', 'Brookes Hill Drive, Humewood, Port Elizabeth, 6001, South Africa', 90, 220, 4, 4, 5),
(25, 'Radisson Blu Hotel Port Elizabeth', 'Marine Drive, Summerstrand, Port Elizabeth, 6001, South Africa', 200, 550, 2, 5, 5);

----------------------------------------
---- Japan
----------------------------------------
-- TOKYO (6)
INSERT INTO accomodation VALUES
(26, 'Park Hyatt Tokyo', '3-7-1-2 Nishi-Shinjuku, Shinjuku-ku, Tokyo 163-1055, Japan', 350, 1200, 2, 1, 6),
(27, 'Khaosan Tokyo Origami Hostel', '3-4-12 Asakusa, Taito-ku, Tokyo 111-0032, Japan', 30, 80, 8, 2, 6),
(28, 'Ryokan Sawanoya', '2-3-11 Yanaka, Taito-ku, Tokyo 110-0001, Japan', 60, 150, 4, 3, 6),
(29, 'Tokyu Stay Shinjuku', '3-7-1 Shinjuku, Shinjuku-ku, Tokyo 160-0022, Japan', 100, 250, 3, 4, 6),
(30, 'The Prince Park Tower Tokyo', '4-8-1 Shibakoen, Minato-ku, Tokyo 105-8563, Japan', 250, 700, 2, 5, 6),
-- KYOTO (7)
(31, 'Hotel Granvia Kyoto', 'JR Kyoto Station, Karasuma Chuo-guchi, Kyoto 600-8216, Japan', 180, 500, 2, 1, 7),
(32, 'Piece Hostel Kyoto', '21-1 Higashikujo Higashisanno-cho, Minami-ku, Kyoto 601-8004, Japan', 25, 70, 6, 2, 7),
(33, 'Gion Hatanaka Ryokan', '505 Yasaka Shrine Minamimon-mae, Higashiyama-ku, Kyoto 605-0074, Japan', 120, 350, 4, 3, 7),
(34, 'RESI STAY Higashiyama Sanjo', '44-1 Sanjo-dori, Higashiyama-ku, Kyoto 605-0005, Japan', 90, 200, 3, 4, 7),
(35, 'The Ritz-Carlton Kyoto', 'Kamogawa Nijo-Ohashi Hotori, Nakagyo-ku, Kyoto 604-0902, Japan', 350, 1000, 2, 5, 7),
-- OSAKA (8)
(36, 'Swissôtel Nankai Osaka', '5-1-60 Namba, Chuo-ku, Osaka 542-0076, Japan', 180, 600, 2, 1, 8),
(37, 'Khaosan World Namba Hostel', '1-2-13 Motomachi, Naniwa-ku, Osaka 556-0016, Japan', 20, 60, 8, 2, 8),
(38, 'Kaneyoshi Ryokan', '3-12 Soemoncho, Chuo-ku, Osaka 542-0084, Japan', 70, 180, 4, 3, 8),
(39, 'Citadines Namba Osaka', '1-2-3 Nippombashi, Chuo-ku, Osaka 542-0073, Japan', 90, 220, 3, 4, 8),
(40, 'The St. Regis Osaka', '3-6-12 Honmachi, Chuo-ku, Osaka 541-0053, Japan', 300, 900, 2, 5, 8),
-- SAPPORO (9)
(41, 'JR Tower Hotel Nikko Sapporo', '2-5 Kita 5-jo Nishi, Chuo-ku, Sapporo 060-0005, Japan', 150, 450, 2, 1, 9),
(42, 'UNTAPPED HOSTEL', 'Kita 18 Nishi 4-1-8, Kita-ku, Sapporo 001-0018, Japan', 25, 65, 6, 2, 9),
(43, 'Ryokan Nupuri', '3-10-2 Kita 6-jo Nishi, Kita-ku, Sapporo 060-0806, Japan', 60, 140, 4, 3, 9),
(44, 'Hotel Mystays Sapporo Station', 'Nishi 4-15 Kita 8-jo, Kita-ku, Sapporo 060-0808, Japan', 80, 200, 3, 4, 9),
(45, 'Sapporo Grand Hotel', 'Nishi 4-chome, Kita 1-jo, Chuo-ku, Sapporo 060-0001, Japan', 200, 600, 2, 5, 9),
-- HIROSHIMA (10)
(46, 'Sheraton Grand Hiroshima Hotel', '12-1 Wakakusa-cho, Higashi-ku, Hiroshima 732-0053, Japan', 160, 450, 2, 1, 10),
(47, 'Santiago Guesthouse Hiroshima', '4-18 Dobashi-cho, Naka-ku, Hiroshima 730-0854, Japan', 20, 50, 8, 2, 10),
(48, 'Ryokan Sansui', '4-17 Koami-cho, Naka-ku, Hiroshima 730-0855, Japan', 50, 130, 4, 3, 10),
(49, 'Hiroshima Washington Hotel', '2-7 Shintenchi, Naka-ku, Hiroshima 730-0034, Japan', 90, 200, 3, 4, 10),
(50, 'RIHGA Royal Hotel Hiroshima', '6-78 Motomachi, Naka-ku, Hiroshima 730-0011, Japan', 220, 600, 2, 5, 10);

-------------------------------------------------------
-- USA
------------------------------------------------------
-- NEW YORK CITY (11)
INSERT INTO accomodation VALUES
(51, 'The Plaza Hotel', '768 5th Ave, New York, NY 10019, USA', 400, 1200, 2, 1, 11),
(52, 'HI New York City Hostel', '891 Amsterdam Ave, New York, NY 10025, USA', 40, 100, 8, 2, 11),
(53, 'Chelsea Pines Inn', '317 W 14th St, New York, NY 10014, USA', 120, 250, 3, 3, 11),
(54, 'Radio City Apartments', '142 W 49th St, New York, NY 10019, USA', 150, 350, 4, 4, 11),
(55, 'Four Seasons Hotel New York Downtown', '27 Barclay St, New York, NY 10007, USA', 500, 1500, 2, 5, 11),
-- LOS ANGELES (12)
(56, 'The Beverly Hills Hotel', '9641 Sunset Blvd, Beverly Hills, CA 90210, USA', 450, 1200, 2, 1, 12),
(57, 'Samesun Venice Beach Hostel', '25 Windward Ave, Venice, CA 90291, USA', 35, 80, 6, 2, 12),
(58, 'The Anderson Estates Guesthouse', '1932 Rochester Cir, Los Angeles, CA 90018, USA', 60, 150, 5, 3, 12),
(59, 'LEVEL Los Angeles Downtown', '888 S Olive St, Los Angeles, CA 90014, USA', 150, 350, 4, 4, 12),
(60, 'Waldorf Astoria Beverly Hills', '9850 Wilshire Blvd, Beverly Hills, CA 90210, USA', 600, 1800, 2, 5, 12),
-- CHICAGO (13)
(61, 'The Langham Chicago', '330 N Wabash Ave, Chicago, IL 60611, USA', 250, 700, 2, 1, 13),
(62, 'HI Chicago Hostel', '24 E Ida B. Wells Dr, Chicago, IL 60605, USA', 30, 75, 6, 2, 13),
(63, 'The Publishing House Bed & Breakfast', '108 N May St, Chicago, IL 60607, USA', 100, 250, 3, 3, 13),
(64, 'Staypineapple, An Iconic Hotel', '1 W Washington St, Chicago, IL 60602, USA', 120, 280, 4, 4, 13),
(65, 'Four Seasons Hotel Chicago', '120 E Delaware Pl, Chicago, IL 60611, USA', 300, 900, 2, 5, 13),
-- MIAMI (14)
(66, 'The Biltmore Hotel Miami Coral Gables', '1200 Anastasia Ave, Coral Gables, FL 33134, USA', 220, 650, 2, 1, 14),
(67, 'Freehand Miami Hostel', '2727 Indian Creek Dr, Miami Beach, FL 33140, USA', 35, 90, 8, 2, 14),
(68, 'The Copper Door B&B', '439 NW 4th Ave, Miami, FL 33128, USA', 90, 200, 3, 3, 14),
(69, 'Fortune House Hotel Suites', '185 SE 14th Terrace, Miami, FL 33131, USA', 120, 300, 4, 4, 14),
(70, 'Faena Hotel Miami Beach', '3201 Collins Ave, Miami Beach, FL 33140, USA', 500, 1500, 2, 5, 14),
-- SAN FRANCISCO (15)
(71, 'Fairmont San Francisco', '950 Mason St, San Francisco, CA 94108, USA', 300, 800, 2, 1, 15),
(72, 'HI San Francisco Downtown Hostel', '312 Mason St, San Francisco, CA 94102, USA', 40, 90, 8, 2, 15),
(73, 'Parker Guest House', '520 Church St, San Francisco, CA 94114, USA', 110, 250, 3, 3, 15),
(74, 'The Donatello Hotel', '501 Post St, San Francisco, CA 94102, USA', 150, 320, 4, 4, 15),
(75, 'The Ritz-Carlton San Francisco', '600 Stockton St, San Francisco, CA 94108, USA', 450, 1300, 2, 5, 15);

------------------------------------------------------
-- France
------------------------------------------------------
-- PARIS (16)
INSERT INTO accomodation VALUES
(76, 'Hotel Le Meurice', '228 Rue de Rivoli, 75001 Paris, France', 350, 1200, 2, 1, 16),
(77, 'Generator Paris Hostel', '9-11 Place du Colonel Fabien, 75010 Paris, France', 40, 100, 8, 2, 16),
(78, 'Hotel du College de France', '7 Rue Thénard, 75005 Paris, France', 100, 250, 3, 3, 16),
(79, 'Citadines Les Halles Paris', '4 Rue des Innocents, 75001 Paris, France', 150, 300, 4, 4, 16),
(80, 'Four Seasons Hotel George V', '31 Avenue George V, 75008 Paris, France', 450, 1500, 2, 5, 16),
-- BERLIN (17)
(81, 'Hotel Adlon Kempinski Berlin', 'Unter den Linden 77, 10117 Berlin, Germany', 300, 900, 2, 1, 17),
(82, 'The Circus Hostel', 'Weinbergsweg 1A, 10119 Berlin, Germany', 30, 80, 8, 2, 17),
(83, 'Gorki Apartments', 'Weinbergsweg 25, 10119 Berlin, Germany', 120, 250, 3, 4, 17),
(84, 'Hotel Pension Funk', 'Fasanenstraße 69, 10719 Berlin, Germany', 80, 160, 4, 3, 17),
(85, 'Regent Berlin', 'Charlottenstraße 49, 10117 Berlin, Germany', 350, 1100, 2, 5, 17),
-- ROME (18)
(86, 'Hotel Eden Rome', 'Via Ludovisi 49, 00187 Rome, Italy', 280, 900, 2, 1, 18),
(87, 'The Beehive Hostel', 'Via Marghera 8, 00185 Rome, Italy', 25, 70, 8, 2, 18),
(88, 'Nerva Boutique Hotel', 'Via Tor de’ Conti 3/4, 00184 Rome, Italy', 100, 230, 3, 3, 18),
(89, 'Navona Luxury Apartments', 'Corso del Rinascimento 69, 00186 Rome, Italy', 120, 300, 4, 4, 18),
(90, 'Palazzo Manfredi', 'Via Labicana 125, 00184 Rome, Italy', 400, 1300, 2, 5, 18),
-- AMSTERDAM (19)
(91, 'Hotel De L’Europe Amsterdam', 'Nieuwe Doelenstraat 2-14, 1012 CP Amsterdam, Netherlands', 250, 750, 2, 1, 19),
(92, 'ClinkNOORD Hostel', 'Badhuiskade 3, 1031 KV Amsterdam, Netherlands', 30, 80, 8, 2, 19),
(93, 'Hotel Sebastians', 'Keizersgracht 15, 1015 CC Amsterdam, Netherlands', 120, 250, 3, 3, 19),
(94, 'Eric Vökel Boutique Apartments', 'Nassaukade 45, 1052 CS Amsterdam, Netherlands', 100, 220, 4, 4, 19),
(95, 'Waldorf Astoria Amsterdam', 'Herengracht 542-556, 1017 CG Amsterdam, Netherlands', 400, 1300, 2, 5, 19),
-- BARCELONA (20)
(96, 'Hotel Arts Barcelona', 'Marina 19-21, 08005 Barcelona, Spain', 280, 900, 2, 1, 20),
(97, 'Kabul Party Hostel Barcelona', 'Plaça Reial 17, 08002 Barcelona, Spain', 25, 70, 8, 2, 20),
(98, 'Hostal Grau Barcelona', 'Carrer de les Ramelleres 27, 08001 Barcelona, Spain', 90, 200, 3, 3, 20),
(99, 'Apartments Sixtyfour', 'Passeig de Gràcia 64, 08007 Barcelona, Spain', 130, 300, 4, 4, 20),
(100, 'Majestic Hotel & Spa Barcelona', 'Passeig de Gràcia 68, 08007 Barcelona, Spain', 400, 1200, 2, 5, 20);

-------------------------------------------------------
-- United Kingdom
-------------------------------------------------------
-- LONDON (21)
INSERT INTO accomodation VALUES
(101, 'The Savoy Hotel', 'Strand, London WC2R 0EZ, United Kingdom', 350, 1200, 2, 1, 21),
(102, 'YHA London St Pancras', '79-81 Euston Rd, London NW1 2QE, United Kingdom', 40, 100, 8, 2, 21),
(103, 'The Fielding Hotel', '4 Broad Court, London WC2B 5QZ, United Kingdom', 120, 250, 3, 3, 21),
(104, 'Native Bankside Apartments', '1 Bear Gardens, London SE1 9ED, United Kingdom', 150, 350, 4, 4, 21),
(105, 'The Ritz London', '150 Piccadilly, London W1J 9BR, United Kingdom', 500, 1500, 2, 5, 21),
-- MANCHESTER (22)
(106, 'The Midland Manchester', '16 Peter St, Manchester M60 2DS, United Kingdom', 200, 600, 2, 1, 22),
(107, 'Selina NQ1 Manchester Hostel', '15 Hilton St, Manchester M1 1JJ, United Kingdom', 30, 80, 8, 2, 22),
(108, 'The Abel Heywood Boutique Hotel', '38 Turner St, Manchester M4 1DZ, United Kingdom', 100, 200, 3, 3, 22),
(109, 'Staycity Aparthotels Manchester Piccadilly', '8B Gateway House, Piccadilly Station Approach, Manchester M1 2GH, United Kingdom', 120, 280, 4, 4, 22),
(110, 'Hotel Gotham', '100 King St, Manchester M2 4WU, United Kingdom', 250, 700, 2, 5, 22),
-- EDINBURGH (23)
(111, 'The Balmoral Hotel', '1 Princes St, Edinburgh EH2 2EQ, United Kingdom', 300, 800, 2, 1, 23),
(112, 'Kick Ass Hostel Edinburgh', '2 West Port, Edinburgh EH1 2JA, United Kingdom', 30, 75, 8, 2, 23),
(113, 'The Inn on the Mile', '82 High St, Edinburgh EH1 1LL, United Kingdom', 120, 250, 3, 3, 23),
(114, 'Cheval Old Town Chambers', 'Roxburgh’s Court, 323 High St, Edinburgh EH1 1LW, United Kingdom', 150, 350, 4, 4, 23),
(115, 'Waldorf Astoria Edinburgh – The Caledonian', 'Princes St, Edinburgh EH1 2AB, United Kingdom', 400, 1200, 2, 5, 23),
-- BELFAST ( = 24)
(116, 'The Fitzwilliam Hotel Belfast', '1-3 Great Victoria St, Belfast BT2 7BQ, Northern Ireland', 200, 600, 2, 1, 24),
(117, 'Vagabonds Hostel Belfast', '9 University Rd, Belfast BT7 1NA, Northern Ireland', 25, 70, 8, 2, 24),
(118, 'The Warren Belfast', '7 Malone Rd, Belfast BT9 6RT, Northern Ireland', 90, 180, 3, 3, 24),
(119, 'Dream Apartments Belfast', '10-24 The Arc, 2J Queens Rd, Belfast BT3 9FD, Northern Ireland', 120, 250, 4, 4, 24),
(120, 'The Merchant Hotel', '16 Skipper St, Belfast BT1 2DZ, Northern Ireland', 300, 900, 2, 5, 24),
-- CARDIFF (25)
(121, 'The Parkgate Hotel', 'Westgate St, Cardiff CF10 1DA, Wales', 180, 500, 2, 1, 25),
(122, 'NosDa Hostel & Bar', '53-59 Despenser St, Cardiff CF11 6AG, Wales', 30, 80, 8, 2, 25),
(123, 'Cathedral 64 Guesthouse', '64 Cathedral Rd, Cardiff CF11 9LL, Wales', 100, 220, 3, 3, 25),
(124, 'Staybridge Suites Cardiff', 'Longueil Close, Cardiff CF10 4EE, Wales', 120, 280, 4, 4, 25),
(125, 'The St. David’s Hotel Cardiff', 'Havannah St, Cardiff CF10 5SD, Wales', 250, 700, 2, 5, 25);

------------------------------------------------------
-- Australia
------------------------------------------------------
-- SYDNEY (26)
INSERT INTO accomodation VALUES
(126, 'Park Hyatt Sydney', '7 Hickson Rd, The Rocks NSW 2000, Australia', 400, 1300, 2, 1, 26),
(127, 'Wake Up! Sydney Central Hostel', '509 Pitt St, Haymarket NSW 2000, Australia', 35, 90, 8, 2, 26),
(128, 'The Ultimo Hotel', '37 Ultimo Rd, Haymarket NSW 2000, Australia', 120, 260, 3, 3, 26),
(129, 'Meriton Suites Kent Street', '528 Kent St, Sydney NSW 2000, Australia', 150, 350, 4, 4, 26),
(130, 'Shangri-La Sydney', '176 Cumberland St, The Rocks NSW 2000, Australia', 350, 1000, 2, 5, 26),
-- MELBOURNE (27)
(131, 'Crown Towers Melbourne', '8 Whiteman St, Southbank VIC 3006, Australia', 380, 1200, 2, 1, 27),
(132, 'Space Hotel', '380 Russell St, Melbourne VIC 3000, Australia', 30, 80, 8, 2, 27),
(133, 'Treasury on Collins Apartment Hotel', '394 Collins St, Melbourne VIC 3000, Australia', 120, 280, 3, 3, 27),
(134, 'Adina Apartment Hotel Melbourne', '189 Queen St, Melbourne VIC 3000, Australia', 130, 300, 4, 4, 27),
(135, 'The Langham Melbourne', '1 Southgate Ave, Southbank VIC 3006, Australia', 320, 900, 2, 5, 27),
-- BRISBANE (28)
(136, 'Emporium Hotel South Bank', '267 Grey St, South Brisbane QLD 4101, Australia', 280, 800, 2, 1, 28),
(137, 'Bunk Brisbane Hostel', '11 Gipps St, Fortitude Valley QLD 4006, Australia', 25, 70, 8, 2, 28),
(138, 'The Point Brisbane Hotel', '21 Lambert St, Kangaroo Point QLD 4169, Australia', 120, 250, 3, 3, 28),
(139, 'Oaks Brisbane on Charlotte Suites', '128 Charlotte St, Brisbane City QLD 4000, Australia', 130, 300, 4, 4, 28),
(140, 'W Brisbane', '81 N Quay, Brisbane City QLD 4000, Australia', 350, 950, 2, 5, 28),
-- PERTH (29)
(141, 'COMO The Treasury', '1 Cathedral Ave, Perth WA 6000, Australia', 400, 1100, 2, 1, 29),
(142, 'Billabong Backpackers Resort Hostel', '381 Beaufort St, Perth WA 6000, Australia', 30, 80, 8, 2, 29),
(143, 'Criterion Hotel Perth', '560 Hay St, Perth WA 6000, Australia', 100, 220, 3, 3, 29),
(144, 'Quest Mounts Bay Road', '130 Mounts Bay Rd, Perth WA 6000, Australia', 130, 300, 4, 4, 29),
(145, 'The Ritz-Carlton Perth', '1 Barrack St, Perth WA 6000, Australia', 380, 1000, 2, 5, 29),
-- ADELAIDE (30
(146, 'Mayfair Hotel', '45 King William St, Adelaide SA 5000, Australia', 220, 650, 2, 1, 30),
(147, 'Tequila Sunrise Hostel', '123 Waymouth St, Adelaide SA 5000, Australia', 25, 70, 8, 2, 30),
(148, 'The Soho Hotel', '264 Flinders St, Adelaide SA 5000, Australia', 100, 200, 3, 3, 30),
(149, 'Franklin Apartments', '36 Franklin St, Adelaide SA 5000, Australia', 120, 280, 4, 4, 30),
(150, 'Eos by SkyCity', 'Festival Dr, Adelaide SA 5000, Australia', 300, 850, 2, 5, 30);

------------------------------------------------------
-- Canada
-------------------------------------------------------
-- TORONTO (31)
INSERT INTO accomodation VALUES
(151, 'Fairmont Royal York', '100 Front St W, Toronto, ON M5J 1E3, Canada', 250, 700, 2, 1, 31),
(152, 'HI Toronto Hostel', '76 Church St, Toronto, ON M5C 2G1, Canada', 35, 90, 8, 2, 31),
(153, 'The Rex Hotel Jazz & Blues Bar', '194 Queen St W, Toronto, ON M5V 1Z1, Canada', 120, 220, 3, 3, 31),
(154, 'Sonder The Elm', '159 Elm St, Toronto, ON M5T 1T8, Canada', 140, 300, 4, 4, 31),
(155, 'The Ritz-Carlton Toronto', '181 Wellington St W, Toronto, ON M5V 3G7, Canada', 400, 1200, 2, 5, 31),
-- VANCOUVER (32)
(156, 'Rosewood Hotel Georgia', '801 W Georgia St, Vancouver, BC V6C 1P7, Canada', 280, 850, 2, 1, 32),
(157, 'Samesun Vancouver Hostel', '1018 Granville St, Vancouver, BC V6Z 1L5, Canada', 30, 85, 8, 2, 32),
(158, 'Blue Horizon Hotel', '1225 Robson St, Vancouver, BC V6E 1C3, Canada', 140, 260, 3, 3, 32),
(159, 'Level Yaletown – Richards', '1388 Richards St, Vancouver, BC V6B 3G6, Canada', 160, 350, 4, 4, 32),
(160, 'Fairmont Pacific Rim', '1038 Canada Pl, Vancouver, BC V6C 0B9, Canada', 400, 1100, 2, 5, 32),
-- MONTREAL (33)
(161, 'Hotel William Gray', '421 Rue Saint-Vincent, Montreal, QC H2Y 3A6, Canada', 220, 600, 2, 1, 33),
(162, 'M Montreal Hostel', '1245 Rue Saint-André, Montreal, QC H2L 3T1, Canada', 25, 80, 8, 2, 33),
(163, 'Hotel Le Dauphin Montreal Centre-Ville', '1025 Rue de Bleury, Montreal, QC H2Z 1M7, Canada', 120, 220, 3, 3, 33),
(164, 'Sonder Maisonneuve Apartments', '1180 Rue de Maisonneuve O, Montreal, QC H3A 0A3, Canada', 130, 280, 4, 4, 33),
(165, 'Fairmont The Queen Elizabeth', '900 Rene-Levesque Blvd W, Montreal, QC H3B 4A5, Canada', 300, 900, 2, 5, 33),
-- OTTAWA (34)
(166, 'Fairmont Château Laurier', '1 Rideau St, Ottawa, ON K1N 8S7, Canada', 240, 650, 2, 1, 34),
(167, 'HI Ottawa Jail Hostel', '75 Nicholas St, Ottawa, ON K1N 7B9, Canada', 30, 85, 8, 2, 34),
(168, 'The Business Inn & Suites', '180 MacLaren St, Ottawa, ON K2P 0L3, Canada', 120, 230, 3, 3, 34),
(169, 'Les Suites Hotel Ottawa', '130 Besserer St, Ottawa, ON K1N 9M9, Canada', 130, 300, 4, 4, 34),
(170, 'The Westin Ottawa', '11 Colonel By Dr, Ottawa, ON K1N 9H4, Canada', 260, 700, 2, 5, 34),
-- CALGARY (35)
(171, 'Fairmont Palliser', '133 9 Ave SW, Calgary, AB T2P 2M3, Canada', 200, 550, 2, 1, 35),
(172, 'Wicked Hostels Calgary', '1505 Macleod Trail SE, Calgary, AB T2G 2N6, Canada', 25, 75, 8, 2, 35),
(173, 'Alt Hotel Calgary East Village', '635 Confluence Way SE, Calgary, AB T2G 0G1, Canada', 110, 220, 3, 3, 35),
(174, 'Sonder The Teal', '1020 9 Ave SE, Calgary, AB T2G 0S7, Canada', 130, 300, 4, 4, 35),
(175, 'Hotel Le Germain Calgary', '899 Centre St S, Calgary, AB T2G 1B8, Canada', 280, 750, 2, 5, 35);

-------------------------------------------------------
-- Switzerland
------------------------------------------------------
-- ZURICH (36)
INSERT INTO accomodation VALUES
(176, 'Baur Au Lac', 'Talstrasse 1, 8001 Zürich, Switzerland', 500, 1500, 2, 1, 36),
(177, 'Oldtown Hostel Otter', 'Oberdorfstrasse 7, 8001 Zürich, Switzerland', 45, 120, 8, 2, 36),
(178, 'Hotel Adler Zürich', 'Rosengasse 10, 8001 Zürich, Switzerland', 160, 280, 3, 3, 36),
(179, 'EMA House Hotel Suites', 'Nordstrasse 1, 8006 Zürich, Switzerland', 200, 400, 4, 4, 36),
(180, 'The Dolder Grand', 'Kurhausstrasse 65, 8032 Zürich, Switzerland', 600, 1800, 2, 5, 36),
-- GENEVA (37)
(181, 'Hotel d’Angleterre', 'Quai du Mont-Blanc 17, 1201 Geneva, Switzerland', 400, 1200, 2, 1, 37),
(182, 'Geneva Hostel', 'Rue Rothschild 28-30, 1202 Geneva, Switzerland', 40, 100, 8, 2, 37),
(183, 'Hotel Kipling Manotel', 'Rue de la Navigation 27, 1201 Geneva, Switzerland', 140, 260, 3, 3, 37),
(184, 'Fraser Suites Geneva', 'Rue de la Rôtisserie 1, 1204 Geneva, Switzerland', 180, 350, 4, 4, 37),
(185, 'Four Seasons Hotel des Bergues Geneva', 'Quai des Bergues 33, 1201 Geneva, Switzerland', 600, 1600, 2, 5, 37),
-- BASEL (38)
(186, 'Grand Hotel Les Trois Rois', 'Blumenrain 8, 4001 Basel, Switzerland', 350, 1000, 2, 1, 38),
(187, 'Basel Backpack Hostel', 'Dornacherstrasse 192, 4053 Basel, Switzerland', 35, 85, 8, 2, 38),
(188, 'Hotel Spalentor Basel', 'Schönbeinstrasse 1, 4056 Basel, Switzerland', 130, 240, 3, 3, 38),
(189, 'Adagio Basel City', 'Hammerstrasse 46, 4058 Basel, Switzerland', 150, 300, 4, 4, 38),
(190, 'Hyperion Hotel Basel', 'Messeplatz 12, 4058 Basel, Switzerland', 250, 600, 2, 5, 38),
-- BERN (39)
(191, 'Hotel Schweizerhof Bern & Spa', 'Bahnhofpl. 11, 3011 Bern, Switzerland', 280, 850, 2, 1, 39),
(192, 'Bern Backpackers Hotel Glocke', 'Rathausgasse 75, 3011 Bern, Switzerland', 35, 90, 8, 2, 39),
(193, 'Hotel Alpenblick Bern', 'Kasernenstrasse 29, 3013 Bern, Switzerland', 120, 220, 3, 3, 39),
(194, 'Sorell Hotel Ador', 'Laupenstrasse 15, 3001 Bern, Switzerland', 150, 280, 4, 4, 39),
(195, 'Bellevue Palace Bern', 'Kochergasse 3-5, 3011 Bern, Switzerland', 320, 950, 2, 5, 39),
-- LAUSANNE (40)
(196, 'Beau-Rivage Palace', 'Place du Port 17-19, 1006 Lausanne, Switzerland', 400, 1300, 2, 1, 40),
(197, 'Lausanne Guesthouse & Backpacker', 'Chemin des Epinettes 4, 1007 Lausanne, Switzerland', 35, 100, 8, 2, 40),
(198, 'Hotel des Voyageurs Boutique', 'Rue Grand-St-Jean 19, 1003 Lausanne, Switzerland', 140, 260, 3, 3, 40),
(199, 'Lausanne Palace', 'Rue du Grand-Chêne 7-9, 1002 Lausanne, Switzerland', 250, 600, 4, 4, 40),
(200, 'Royal Savoy Hotel & Spa Lausanne', 'Avenue d’Ouchy 40, 1006 Lausanne, Switzerland', 380, 1000, 2, 5, 40);

-------------------------------------------------------
-- China
-------------------------------------------------------
-- BEIJING (41)
INSERT INTO accomodation VALUES
(201, 'The Peninsula Beijing', '8 Jinyu Hutong, Wangfujing, Dongcheng, Beijing, China', 300, 900, 2, 1, 41),
(202, 'Peking Youth Hostel', 'No. 113 Nan Luo Gu Xiang, Dongcheng, Beijing, China', 20, 60, 8, 2, 41),
(203, 'Novotel Beijing Peace', '3 Jinyu Hutong, Wangfujing, Dongcheng, Beijing, China', 120, 250, 3, 3, 41),
(204, 'Beijing Double Happiness Courtyard Hotel', '37 Dongsi Sitiao, Dongcheng, Beijing, China', 150, 300, 3, 4, 41),
(205, 'Rosewood Beijing', 'Jing Guang Center, Hujialou, Chaoyang District, Beijing, China', 400, 1000, 2, 5, 41),
-- SHANGHAI (42)
(206, 'The Ritz-Carlton Shanghai, Pudong', 'Shanghai IFC, 8 Century Ave, Pudong, Shanghai, China', 350, 950, 2, 1, 42),
(207, 'Blue Mountain Bund Youth Hostel', '6F, No.350 South Shanxi Road, Huangpu, Shanghai, China', 25, 70, 8, 2, 42),
(208, 'Campanile Shanghai Bund Hotel', 'No.33 Fujian South Road, Huangpu, Shanghai, China', 100, 220, 3, 3, 42),
(209, 'Green Court Residence City Center', '55 Beijing West Road, Huangpu, Shanghai, China', 180, 320, 4, 4, 42),
(210, 'Waldorf Astoria Shanghai on the Bund', 'No.2 Zhongshan Dong Yi Road, Huangpu, Shanghai, China', 400, 1200, 2, 5, 42),
-- GUANGZHOU (43)
(211, 'Four Seasons Hotel Guangzhou', '5 Zhujiang West Road, Tianhe District, Guangzhou, China', 280, 850, 2, 1, 43),
(212, 'Lazy Gaga Hostel', 'No. 31 Shamian Street, Liwan District, Guangzhou, China', 20, 60, 8, 2, 43),
(213, 'Holiday Inn Guangzhou Shifu', 'No.188 Di Shi Fu Road, Liwan District, Guangzhou, China', 120, 240, 3, 3, 43),
(214, 'Ascott IFC Guangzhou', 'No.5 Zhujiang West Road, Tianhe District, Guangzhou, China', 160, 300, 4, 4, 43),
(215, 'The Garden Hotel Guangzhou', '368 Huanshi Dong Road, Yuexiu District, Guangzhou, China', 230, 500, 2, 5, 43),
-- CHENGDU (44)
(216, 'The Temple House', 'No.81 Bitieshi Street, Jinjiang District, Chengdu, China', 250, 700, 2, 1, 44),
(217, 'Chengdu Flipflop Lounge Hostel', 'No.98 Dongsheng Street, Jinjiang District, Chengdu, China', 15, 50, 8, 2, 44),
(218, 'Tibet Hotel Chengdu', '10 North Renmin Road, Jinniu District, Chengdu, China', 110, 220, 3, 3, 44),
(219, 'Somerset Riverview Chengdu', 'No.1 Section 3, Renmin South Road, Chengdu, China', 160, 300, 4, 4, 44),
(220, 'Shangri-La Hotel Chengdu', '9 Binjiang East Road, Jinjiang District, Chengdu, China', 280, 650, 2, 5, 44),
-- XI’AN (45)
(221, 'Sofitel Legend People’s Grand Hotel Xi’an', '319 Dongxin Street, Xincheng District, Xi’an, China', 240, 650, 2, 1, 45),
(222, 'Han Tang Inn Hostel', 'No.7 Nan Chang Xiang, Xincheng District, Xi’an, China', 20, 60, 8, 2, 45),
(223, 'Grand Noble Hotel Xi’an', '334 Dong Da Jie, Xincheng District, Xi’an, China', 130, 250, 3, 3, 45),
(224, 'Citadines Central Xi’an', '36 Zhubashi, Beilin District, Xi’an, China', 140, 280, 4, 4, 45),
(225, 'Wyndham Grand Xian South', '208 Ci’en East Road, Qujiang New District, Xi’an, China', 200, 500, 2, 5, 45);

-------------------------------------------------------
-- Brazil
--------------------------------------------------------
-- RIO DE JANEIRO (46)
INSERT INTO accomodation VALUES
(226, 'Copacabana Palace, A Belmond Hotel', 'Avenida Atlântica 1702, Copacabana, Rio de Janeiro, Brazil', 350, 900, 2, 1, 46),
(227, 'Selina Lapa Rio de Janeiro', 'Rua Visc. de Maranguape 9, Centro, Rio de Janeiro, Brazil', 25, 80, 6, 2, 46),
(228, 'Hotel Atlântico Prime', 'Rua do Resende 87, Lapa, Rio de Janeiro, Brazil', 80, 180, 3, 3, 46),
(229, 'Arena Copacabana Hotel', 'Avenida Atlântica 2064, Copacabana, Rio de Janeiro, Brazil', 180, 350, 3, 4, 46),
(230, 'Windsor California Copacabana', 'Avenida Atlântica 2616, Copacabana, Rio de Janeiro, Brazil', 200, 420, 3, 5, 46),
-- SÃO PAULO (47)
(231, 'Hotel Unique', 'Avenida Brigadeiro Luís Antônio 4700, Jardim Paulista, São Paulo, Brazil', 250, 600, 2, 1, 47),
(232, 'O de Casa Hostel Bar', 'Rua Inácio Pereira da Rocha 385, Vila Madalena, São Paulo, Brazil', 20, 70, 8, 2, 47),
(233, 'Transamerica Prime International Plaza', 'Alameda Santos 981, Bela Vista, São Paulo, Brazil', 120, 240, 3, 3, 47),
(234, 'Melia Paulista', 'Avenida Paulista 2181, Consolação, São Paulo, Brazil', 180, 360, 3, 4, 47),
(235, 'Renaissance São Paulo Hotel', 'Alameda Santos 2233, Jardins, São Paulo, Brazil', 300, 700, 2, 5, 47),
-- BRASÍLIA (48)
(236, 'B Hotel Brasília', 'SHN Quadra 5, Bloco J, Asa Norte, Brasília, Brazil', 180, 400, 2, 1, 48),
(237, 'Hostel 7 Brasília', 'SCLRN 708, Bloco H, Asa Norte, Brasília, Brazil', 18, 60, 8, 2, 48),
(238, 'Cullinan Hplus Premium', 'SHN Quadra 4, Bloco E, Asa Norte, Brasília, Brazil', 140, 250, 3, 3, 48),
(239, 'Royal Tulip Brasília Alvorada', 'SHTN Trecho 1, Conj. 1B, Brasília, Brazil', 250, 500, 2, 4, 48),
(240, 'Vision Hplus Express+', 'SHN Quadra 1, Bloco F, Asa Norte, Brasília, Brazil', 100, 180, 3, 5, 48),
-- SALVADOR (49)
(241, 'Fera Palace Hotel', 'Rua Chile 20, Centro Histórico, Salvador, Brazil', 180, 420, 2, 1, 49),
(242, 'Hostel Galeria 13', 'Rua da Ordem Terceira 23, Pelourinho, Salvador, Brazil', 20, 60, 6, 2, 49),
(243, 'Hotel Villa Bahia', 'Largo do Cruzeiro de São Francisco 16, Pelourinho, Salvador, Brazil', 150, 280, 3, 3, 49),
(244, 'Fiesta Bahia Hotel', 'Av. Antônio Carlos Magalhães 741, Pituba, Salvador, Brazil', 100, 200, 3, 4, 49),
(245, 'Monte Pascoal Praia Hotel', 'Av. Oceânica 591, Barra, Salvador, Brazil', 180, 350, 3, 5, 49),
-- CURITIBA (50)
(246, 'Nomaa Hotel', 'Rua Gutemberg 168, Batel, Curitiba, Brazil', 180, 380, 2, 1, 50),
(247, 'Curitiba Casa Hostel', 'Rua Brasilio Itiberê 73, Jardim Botânico, Curitiba, Brazil', 20, 60, 8, 2, 50),
(248, 'NH Curitiba The Five', 'Rua Nunes Machado 68, Batel, Curitiba, Brazil', 130, 260, 3, 3, 50),
(249, 'Hotel Moov Curitiba', 'Rua Des. Motta 2044, Batel, Curitiba, Brazil', 100, 180, 3, 4, 50),
(250, 'Radisson Hotel Curitiba', 'Av. Sete de Setembro 5190, Batel, Curitiba, Brazil', 180, 320, 2, 5, 50);

INSERT INTO food_place_type (foodp_type_id, foodp_type_name) VALUES
(1, 'Restaurant'),
(2, 'Cafe'),
(3, 'Fast Food'),
(4, 'Food Truck'),
(5, 'Bakery');

-----------------------------------
-- South Africa
-----------------------------------

-- Cape Town (dest_id = 1)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(1, 'The Test Kitchen', 'The Old Biscuit Mill, 375 Albert Rd, Woodstock, Cape Town, 7915, South Africa', 300, 1200, 'Tasting Menu, Wine Pairing, Contemporary Cuisine', 5, 1, 1),
(2, 'Truth Coffee Roasting', '36 Buitenkant St, Cape Town City Centre, Cape Town, 8000, South Africa', 50, 150, 'Coffee, Pastries, Brunch', 5, 2, 1),
(3, 'Gibson’s Gourmet Burgers & Ribs', 'V&A Waterfront, Shop 155, Cape Town, 8001, South Africa', 120, 350, 'Burgers, Ribs, Milkshakes', 4, 3, 1),
(4, 'Lekker Vegan', '106 Hout St, Cape Town City Centre, Cape Town, 8000, South Africa', 80, 250, 'Vegan Fast Food, Burgers, Wraps', 4, 3, 1),
(5, 'Jason Bakery', '185 Bree St, Cape Town City Centre, Cape Town, 8001, South Africa', 40, 180, 'Artisan Breads, Croissants, Coffee', 5, 5, 1),
-- Johannesburg (dest_id = 2)
(6, 'Marble Restaurant', 'Trumpet on Keyes, 19 Keyes Ave, Rosebank, Johannesburg, 2196, South Africa', 350, 1000, 'Grilled Meats, Fine Dining, Cocktails', 5, 1, 2),
(7, 'Father Coffee', '73 Juta St, Braamfontein, Johannesburg, 2001, South Africa', 40, 120, 'Espresso, Pastries, Toasts', 4, 2, 2),
(8, 'RocoMamas Melrose Arch', 'High St, Melrose Arch, Johannesburg, 2076, South Africa', 120, 300, 'Smash Burgers, Fries, Wings', 4, 3, 2),
(9, 'Taco Truck', '44 Stanley Ave, Milpark, Johannesburg, 2092, South Africa', 70, 180, 'Tacos, Nachos, Burritos', 4, 4, 2),
(10, 'Belle’s Patisserie', 'Blubird Shopping Centre, 97 Atholl Oaklands Rd, Melrose, Johannesburg, 2196, South Africa', 60, 250, 'Cakes, Macarons, Coffee', 5, 5, 2),

-- Durban (dest_id = 3)
(11, '9th Avenue Waterside', '2 Maritime Pl, Harbour, Durban, 4001, South Africa', 250, 900, 'Seafood, Fine Dining, Wine', 5, 1, 3),
(12, 'Freedom Café', '37 St Marys Ave, Greyville, Durban, 4001, South Africa', 60, 200, 'Coffee, Brunch, Salads', 4, 2, 3),
(13, 'Steers Durban North', '39 Umhlanga Rocks Dr, Durban North, 4051, South Africa', 50, 180, 'Burgers, Chips, Milkshakes', 4, 3, 3),
(14, 'The Curry Truck', 'Florida Rd, Morningside, Durban, 4001, South Africa', 70, 200, 'Bunny Chow, Curry, Wraps', 4, 4, 3),
(15, 'The Glenwood Bakery', '398 Esther Roberts Rd, Glenwood, Durban, 4001, South Africa', 50, 200, 'Sourdough Bread, Pastries, Pizza', 5, 5, 3),

-- Pretoria (dest_id = 4)
(16, 'Restaurant Mosaic', 'The Orient Boutique Hotel, Crocodile River Valley, Elandsfontein, Pretoria, 0026, South Africa', 500, 1500, 'French Cuisine, Fine Dining, Tasting Menu', 5, 1, 4),
(17, 'Afro-Boer', 'Cnr Meerlust Rd & Lynwood Rd, Equestria, Pretoria, 0184, South Africa', 80, 250, 'Coffee, Pastries, Brunch', 5, 2, 4),
(18, 'McDonald’s Hatfield', '1065 Burnett St, Hatfield, Pretoria, 0083, South Africa', 40, 150, 'Burgers, Fries, Sundaes', 3, 3, 4),
(19, 'Kota King Truck', 'Sunnypark Mall, Pretoria Central, 0002, South Africa', 50, 120, 'Kotas, Chips, Sausages', 4, 4, 4),
(20, 'Vovo Telo Bakery', 'Brooklyn Mall, 45 Fehrsen St, Brooklyn, Pretoria, 0181, South Africa', 60, 220, 'Breads, Pastries, Coffee', 5, 5, 4),

-- Port Elizabeth (dest_id = 5)
(21, 'Ginger The Restaurant', 'Marine Dr, Summerstrand, Gqeberha, 6001, South Africa', 200, 700, 'Seafood, Steak, Wine', 5, 1, 5),
(22, 'Urban Espress Coffee Co.', '16 Stanley St, Richmond Hill, Gqeberha, 6001, South Africa', 50, 150, 'Coffee, Bagels, Smoothies', 4, 2, 5),
(23, 'KFC Summerstrand', 'Marine Dr, Summerstrand, Gqeberha, 6001, South Africa', 40, 120, 'Fried Chicken, Burgers, Chips', 3, 3, 5),
(24, 'Boerie Truck', 'Humewood Beach Parking Lot, Port Elizabeth, 6001, South Africa', 60, 150, 'Boerewors Rolls, Chips, Drinks', 4, 4, 5),
(25, 'Pastryworks Bakery', '10 Heugh Rd, Walmer, Gqeberha, 6001, South Africa', 45, 180, 'Cakes, Croissants, Coffee', 5, 5, 5);

-- =====================================
-- JAPAN
-- =====================================

-- Tokyo (dest_id = 6)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(26, 'Sukiyabashi Jiro', '4-2-15 Ginza, Chuo City, Tokyo 104-0061, Japan', 3000, 6000, 'Sushi Omakase', 5, 1, 6),
(27, 'Streamer Coffee Company', '1-20-28 Shibuya, Tokyo 150-0002, Japan', 50, 200, 'Coffee, Lattes, Pastries', 5, 2, 6),
(28, 'Mos Burger Shibuya', '2-25-7 Dogenzaka, Shibuya City, Tokyo 150-0043, Japan', 80, 200, 'Burgers, Fries, Shakes', 4, 3, 6),
(29, 'Tokyo Taco Truck', 'Yoyogi Park, Tokyo 151-0052, Japan', 100, 300, 'Tacos, Burritos, Nachos', 4, 4, 6),
(30, 'Andersen Bakery Tokyo', 'Tokyo Station, 1-9-1 Marunouchi, Chiyoda City, Tokyo 100-0005, Japan', 60, 250, 'Breads, Danish Pastries, Coffee', 5, 5, 6),

-- Kyoto (dest_id = 7)
(31, 'Gion Karyo', '570-235 Gionmachi Minamigawa, Higashiyama Ward, Kyoto, Japan', 500, 1500, 'Kaiseki Cuisine', 5, 1, 7),
(32, '% Arabica Kyoto', '87-5 Hoshino-cho, Higashiyama Ward, Kyoto, 605-0088, Japan', 50, 180, 'Coffee, Espresso, Matcha Latte', 5, 2, 7),
(33, 'Lotteria Kyoto Station', '901 Higashishiokojicho, Shimogyo Ward, Kyoto, 600-8216, Japan', 60, 200, 'Fast Food, Burgers, Fries', 4, 3, 7),
(34, 'Kyoto Bento Truck', 'Nishiki Market, Nakagyo Ward, Kyoto, Japan', 80, 300, 'Bento Boxes, Takoyaki, Yakitori', 4, 4, 7),
(35, 'Marble Bakery', '35-2 Matsubara-cho, Higashiyama Ward, Kyoto, 605-0062, Japan', 70, 220, 'Cakes, Bread, Pastries', 5, 5, 7),

-- Osaka (dest_id = 8)
(36, 'Matsuzakagyu Yakiniku M, Hozenji Yokocho', '1-1-19 Nanba, Chuo Ward, Osaka 542-0076, Japan', 300, 1200, 'Yakiniku, Wagyu Beef, Sake', 5, 1, 8),
(37, 'Lilo Coffee Roasters', '1-10-28 Nishishinsaibashi, Chuo Ward, Osaka 542-0086, Japan', 60, 180, 'Coffee, Pastries, Latte Art', 5, 2, 8),
(38, 'McDonald’s Namba', '1-8-16 Namba, Chuo Ward, Osaka 542-0076, Japan', 50, 150, 'Burgers, Fries, Nuggets', 4, 3, 8),
(39, 'Takoyaki Wanaka Truck', '1-2-3 Namba, Chuo Ward, Osaka 542-0076, Japan', 80, 200, 'Takoyaki, Okonomiyaki, Yakisoba', 5, 4, 8),
(40, 'Boulangerie Le Sucre-Coeur', '2-39-9 Tenjinbashi, Kita Ward, Osaka 530-0041, Japan', 60, 220, 'Baguettes, Croissants, Viennoiserie', 5, 5, 8),

-- Hokkaido (dest_id = 9)
(41, 'Soup Curry GARAKU', '2-6 Minami 3 Jonishi, Chuo Ward, Sapporo, Hokkaido 060-0063, Japan', 200, 800, 'Soup Curry, Rice, Beer', 5, 1, 9),
(42, 'Miyakoshiya Coffee', '1-1 Minami 2 Jonishi, Chuo Ward, Sapporo, Hokkaido 060-0062, Japan', 50, 180, 'Coffee, Cheesecake, Toast', 4, 2, 9),
(43, 'MOS Burger Sapporo', '2-1 Kita 3 Jonishi, Chuo Ward, Sapporo, Hokkaido 060-0003, Japan', 60, 200, 'Burgers, Fries, Shakes', 4, 3, 9),
(44, 'Hokkaido Ramen Truck', 'Odori Park, Chuo Ward, Sapporo, Hokkaido, Japan', 80, 250, 'Ramen, Gyoza, Takoyaki', 5, 4, 9),
(45, 'Kinotoya Bake', 'JR Sapporo Station, Kita 5 Jonishi, Chuo Ward, Sapporo, Hokkaido 060-0005, Japan', 70, 200, 'Cheesetarts, Pastries, Coffee', 5, 5, 9),

-- Hiroshima (dest_id = 10)
(46, 'Okonomimura', '5-13 Shintenchi, Naka Ward, Hiroshima 730-0034, Japan', 150, 600, 'Okonomiyaki, Yakisoba, Teppanyaki', 5, 1, 10),
(47, 'OBSCURA Coffee Roasters', '3-28 Fukuro-machi, Naka Ward, Hiroshima 730-0036, Japan', 50, 180, 'Coffee, Espresso, Snacks', 5, 2, 10),
(48, 'Freshness Burger Hiroshima', '10-1 Nakamachi, Naka Ward, Hiroshima 730-0037, Japan', 60, 200, 'Burgers, Fries, Hot Dogs', 4, 3, 10),
(49, 'Hiroshima Street Food Truck', 'Peace Boulevard, Naka Ward, Hiroshima, Japan', 80, 300, 'Oysters, Yakitori, Karaage', 4, 4, 10),
(50, 'Andersen Hiroshima', '7-1 Hondori, Naka Ward, Hiroshima 730-0035, Japan', 60, 250, 'Danish Bread, Pastries, Coffee', 5, 5, 10);

-- =====================================
-- USA
-- =====================================

-- New York City (dest_id = 11)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(51, 'Le Bernardin', '155 W 51st St, New York, NY 10019, USA', 800, 2500, 'Seafood, Fine Dining, Wine Pairing', 5, 1, 11),
(52, 'Blue Bottle Coffee Bryant Park', '54 W 40th St, New York, NY 10018, USA', 60, 200, 'Coffee, Pastries, Cold Brew', 5, 2, 11),
(53, 'Shake Shack Madison Square Park', 'Madison Ave & E 23rd St, New York, NY 10010, USA', 80, 250, 'Burgers, Fries, Milkshakes', 5, 3, 11),
(54, 'Korilla BBQ Truck', 'Various locations in Manhattan, New York, NY, USA', 100, 300, 'Korean BBQ Bowls, Tacos, Wraps', 4, 4, 11),
(55, 'Levain Bakery', '167 W 74th St, New York, NY 10023, USA', 70, 200, 'Cookies, Breads, Coffee', 5, 5, 11),

-- Los Angeles (dest_id = 12)
(56, 'Spago Beverly Hills', '176 N Canon Dr, Beverly Hills, CA 90210, USA', 500, 1500, 'California Cuisine, Fine Dining', 5, 1, 12),
(57, 'Intelligentsia Coffee Silver Lake', '3922 Sunset Blvd, Los Angeles, CA 90029, USA', 60, 180, 'Espresso, Pour Over, Pastries', 5, 2, 12),
(58, 'In-N-Out Burger Hollywood', '7009 Sunset Blvd, Los Angeles, CA 90028, USA', 50, 150, 'Burgers, Fries, Shakes', 5, 3, 12),
(59, 'Kogi BBQ Truck', 'Varies: Los Angeles County, CA, USA', 100, 300, 'Korean Tacos, Burritos, Short Rib Sliders', 5, 4, 12),
(60, 'Porto’s Bakery & Café', '3614 W Magnolia Blvd, Burbank, CA 91505, USA', 60, 250, 'Cuban Pastries, Sandwiches, Cakes', 5, 5, 12),

-- Chicago (dest_id = 13)
(61, 'Alinea', '1723 N Halsted St, Chicago, IL 60614, USA', 700, 2500, 'Modern American, Tasting Menu', 5, 1, 13),
(62, 'Sawada Coffee', '112 N Green St, Chicago, IL 60607, USA', 50, 180, 'Coffee, Lattes, Matcha', 5, 2, 13),
(63, 'McDonald’s Headquarters', '1035 W Randolph St, Chicago, IL 60607, USA', 50, 150, 'Burgers, Fries, Chicken Sandwiches', 4, 3, 13),
(64, 'The Fat Shallot Truck', 'Downtown Loop, Chicago, IL 60602, USA', 80, 250, 'Sandwiches, Grilled Cheese, Salads', 4, 4, 13),
(65, 'Do-Rite Donuts & Coffee', '50 W Randolph St, Chicago, IL 60601, USA', 50, 180, 'Donuts, Coffee, Breakfast Sandwiches', 5, 5, 13),

-- Miami (dest_id = 14)
(66, 'Joe’s Stone Crab', '11 Washington Ave, Miami Beach, FL 33139, USA', 400, 1200, 'Seafood, Steak, Key Lime Pie', 5, 1, 14),
(67, 'Panther Coffee Wynwood', '2390 NW 2nd Ave, Miami, FL 33127, USA', 50, 180, 'Coffee, Cold Brew, Pastries', 5, 2, 14),
(68, 'Five Guys Miami Beach', '1500 Washington Ave, Miami Beach, FL 33139, USA', 60, 180, 'Burgers, Fries, Hot Dogs', 4, 3, 14),
(69, 'Ms. Cheezious Food Truck', '7418 Biscayne Blvd, Miami, FL 33138, USA', 80, 250, 'Grilled Cheese, Tomato Soup, Mac n Cheese', 4, 4, 14),
(70, 'Zak the Baker', '295 NW 26th St, Miami, FL 33127, USA', 60, 200, 'Artisan Bread, Croissants, Sandwiches', 5, 5, 14),

-- San Francisco (dest_id = 15)
(71, 'Gary Danko', '800 N Point St, San Francisco, CA 94109, USA', 600, 2000, 'Fine Dining, Seafood, Wine Pairing', 5, 1, 15),
(72, 'Blue Bottle Coffee Mint Plaza', '66 Mint St, San Francisco, CA 94103, USA', 60, 180, 'Coffee, Espresso, Snacks', 5, 2, 15),
(73, 'Super Duper Burgers Market Street', '721 Market St, San Francisco, CA 94103, USA', 70, 200, 'Burgers, Fries, Shakes', 5, 3, 15),
(74, 'Curry Up Now Truck', 'Various locations, San Francisco Bay Area, CA, USA', 100, 300, 'Indian Street Food, Burritos, Bowls', 5, 4, 15),
(75, 'Tartine Bakery', '600 Guerrero St, San Francisco, CA 94110, USA', 70, 250, 'Pastries, Bread, Coffee', 5, 5, 15);

-- =====================================
-- EUROPE
-- =====================================

-- Paris (dest_id = 16)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(76, 'Le Meurice Alain Ducasse', '228 Rue de Rivoli, 75001 Paris, France', 500, 2500, 'Haute Cuisine, French Fine Dining, Wine Pairing', 5, 1, 16),
(77, 'Café de Flore', '172 Boulevard Saint-Germain, 75006 Paris, France', 70, 250, 'Coffee, Croissants, French Breakfast', 5, 2, 16),
(78, 'Quick Burger Champs-Élysées', '146 Avenue des Champs-Élysées, 75008 Paris, France', 60, 180, 'Burgers, Fries, Drinks', 4, 3, 16),
(79, 'Le Camion Qui Fume', 'Place de la Madeleine, 75008 Paris, France', 100, 250, 'Gourmet Burgers, Fries, Wraps', 5, 4, 16),
(80, 'Du Pain et des Idées', '34 Rue Yves Toudic, 75010 Paris, France', 70, 200, 'Croissants, Escargots, Coffee', 5, 5, 16),

-- Berlin (dest_id = 17)
(81, 'Restaurant Tim Raue', 'Rudi-Dutschke-Straße 26, 10969 Berlin, Germany', 300, 1200, 'Asian Fusion, Fine Dining', 5, 1, 17),
(82, 'The Barn Coffee Roasters', 'Auguststraße 58, 10119 Berlin, Germany', 50, 180, 'Coffee, Pastries, Sandwiches', 5, 2, 17),
(83, 'McDonald’s Alexanderplatz', 'Alexanderplatz 2, 10178 Berlin, Germany', 50, 150, 'Burgers, Fries, Nuggets', 4, 3, 17),
(84, 'Burger de Ville Truck', 'Breitscheidplatz, 10789 Berlin, Germany', 70, 200, 'Burgers, Salads, Wraps', 4, 4, 17),
(85, 'Zeit für Brot', 'Alte Schönhauser Str. 4, 10119 Berlin, Germany', 60, 220, 'Cinnamon Rolls, Bread, Coffee', 5, 5, 17),

-- Rome (dest_id = 18)
(86, 'La Pergola', 'Via Alberto Cadlolo, 101, 00136 Roma RM, Italy', 400, 2000, 'Italian Fine Dining, Tasting Menu', 5, 1, 18),
(87, 'Tazza D’Oro Coffee Shop', 'Via degli Orfani, 84, 00186 Roma RM, Italy', 40, 150, 'Espresso, Cappuccino, Pastries', 5, 2, 18),
(88, 'Spizzico Roma Termini', 'Piazza dei Cinquecento, 1, 00185 Roma RM, Italy', 50, 180, 'Pizza Slices, Pasta, Drinks', 4, 3, 18),
(89, 'Trapizzino Food Truck', 'Piazza Trilussa, 00153 Roma RM, Italy', 80, 250, 'Pizza Pockets, Fried Snacks, Pasta', 5, 4, 18),
(90, 'Roscioli Caffè Pasticceria', 'Piazza Benedetto Cairoli, 16, 00186 Roma RM, Italy', 60, 200, 'Pastries, Coffee, Breakfast', 5, 5, 18),

-- Amsterdam (dest_id = 19)
(91, 'Restaurant De Kas', 'Kamerlingh Onneslaan 3, 1097 DE Amsterdam, Netherlands', 250, 900, 'Organic, Farm-to-Table, Fine Dining', 5, 1, 19),
(92, 'Coffee & Coconuts', 'Ceintuurbaan 282-284, 1072 GK Amsterdam, Netherlands', 60, 200, 'Coffee, Smoothies, Brunch', 5, 2, 19),
(93, 'FEBO Amsterdam', 'Damrak 6, 1012 LG Amsterdam, Netherlands', 40, 120, 'Fast Food Snacks, Croquettes, Fries', 4, 3, 19),
(94, 'Rolling Kitchen Food Truck', 'Westerpark, Amsterdam, Netherlands', 80, 250, 'Street Food, Burgers, Vegan Bowls', 4, 4, 19),
(95, 'Bakhuys Bakery', 'Sarphatistraat 61, 1018 EX Amsterdam, Netherlands', 50, 180, 'Artisan Bread, Pastries, Coffee', 5, 5, 19),

-- Barcelona (dest_id = 20)
(96, 'Disfrutar', 'Carrer de Villarroel, 163, 08036 Barcelona, Spain', 400, 1500, 'Mediterranean, Avant-Garde Cuisine', 5, 1, 20),
(97, 'Satan’s Coffee Corner', 'Gran Via de les Corts Catalanes, 700, 08010 Barcelona, Spain', 50, 200, 'Coffee, Breakfast, Pastries', 5, 2, 20),
(98, 'Pans & Company', 'La Rambla, 121, 08002 Barcelona, Spain', 50, 150, 'Sandwiches, Salads, Fast Meals', 4, 3, 20),
(99, 'La Furgoneta Food Truck', 'Parc de la Ciutadella, Barcelona, Spain', 80, 220, 'Tapas, Burgers, Craft Beer', 4, 4, 20),
(100, 'Baluard Barceloneta Bakery', 'Carrer del Baluard, 38, 08003 Barcelona, Spain', 60, 180, 'Bread, Croissants, Coffee', 5, 5, 20);

-- =====================================
-- UNITED KINGDOM
-- =====================================

-- London (dest_id = 21)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(101, 'Restaurant Gordon Ramsay', '68 Royal Hospital Rd, London SW3 4HP, United Kingdom', 400, 1800, 'Fine Dining, Modern European, Tasting Menu', 5, 1, 21),
(102, 'Monmouth Coffee Company', '27 Monmouth St, London WC2H 9EU, United Kingdom', 60, 200, 'Espresso, Pastries, Breakfast', 5, 2, 21),
(103, 'Five Guys Leicester Square', '1-3 Long Acre, London WC2E 9LH, United Kingdom', 80, 250, 'Burgers, Fries, Hot Dogs', 4, 3, 21),
(104, 'The Orange Buffalo Truck', 'Brick Lane Market, London E1 6QR, United Kingdom', 70, 220, 'Wings, Burgers, Street Food', 5, 4, 21),
(105, 'Bread Ahead Bakery', 'Borough Market, Cathedral St, London SE1 9DE, United Kingdom', 60, 180, 'Doughnuts, Bread, Coffee', 5, 5, 21),

-- Manchester (dest_id = 22)
(106, 'Mana Restaurant', '42 Blossom St, Ancoats, Manchester M4 6BF, United Kingdom', 300, 1200, 'Modern British, Tasting Menu', 5, 1, 22),
(107, 'Takk Coffee House', '6 Tariff St, Manchester M1 2FF, United Kingdom', 50, 180, 'Coffee, Brunch, Pastries', 5, 2, 22),
(108, 'McDonald’s Piccadilly Gardens', '6-8 Piccadilly, Manchester M1 1LS, United Kingdom', 40, 130, 'Burgers, Fries, Drinks', 4, 3, 22),
(109, 'Archie’s Food Truck', 'Oxford Rd, Manchester M1 5QA, United Kingdom', 70, 200, 'Burgers, Milkshakes, Wraps', 4, 4, 22),
(110, 'Pollen Bakery', 'Cotton Field Wharf, 8 New Union St, Manchester M4 6FQ, United Kingdom', 60, 180, 'Sourdough, Croissants, Coffee', 5, 5, 22),

-- Edinburgh (dest_id = 23)
(111, 'The Kitchin', '78 Commercial Quay, Leith, Edinburgh EH6 6LX, United Kingdom', 350, 1300, 'Scottish Fine Dining, Seafood', 5, 1, 23),
(112, 'The Milkman Café', '7 Cockburn St, Edinburgh EH1 1BP, United Kingdom', 50, 170, 'Coffee, Cakes, Sandwiches', 5, 2, 23),
(113, 'Burger King Princes Street', 'Princes St, Edinburgh EH2 2ER, United Kingdom', 50, 150, 'Burgers, Fries, Nuggets', 4, 3, 23),
(114, 'Scoff Food Truck', 'Grassmarket, Edinburgh EH1 2JU, United Kingdom', 80, 220, 'Scottish Street Food, Wraps, Burgers', 4, 4, 23),
(115, 'Mimi’s Bakehouse', '63 Shore, Leith, Edinburgh EH6 6RA, United Kingdom', 70, 180, 'Cakes, Coffee, Afternoon Tea', 5, 5, 23),

-- Belfast (dest_id = 24)
(116, 'OX Belfast', '1 Oxford St, Belfast BT1 3LA, United Kingdom', 250, 950, 'Irish Fine Dining, Seasonal Dishes', 5, 1, 24),
(117, 'Established Coffee', '54 Hill St, Belfast BT1 2LB, United Kingdom', 50, 180, 'Coffee, Pastries, Toasts', 5, 2, 24),
(118, 'KFC Belfast City Centre', '35-39 Castle Ln, Belfast BT1 5DB, United Kingdom', 40, 130, 'Fried Chicken, Burgers, Drinks', 4, 3, 24),
(119, 'The Hatch Food Truck', 'Custom House Square, Belfast BT1 3ET, United Kingdom', 70, 220, 'Street Burgers, Chips, Wraps', 4, 4, 24),
(120, 'Bread & Banjo Bakery', '353 Ormeau Rd, Belfast BT7 3GL, United Kingdom', 60, 180, 'Bread, Pastries, Coffee', 5, 5, 24),

-- Cardiff (dest_id = 25)
(121, 'Heathcock Restaurant', '58-60 Bridge St, Llandaff, Cardiff CF5 2EN, United Kingdom', 220, 800, 'Modern Welsh Cuisine, Local Produce', 5, 1, 25),
(122, 'Uncommon Ground Coffee Roastery', '10-12 Royal Arcade, Cardiff CF10 1AE, United Kingdom', 50, 180, 'Coffee, Toasts, Pastries', 5, 2, 25),
(123, 'McDonald’s Queen Street', 'Queen St, Cardiff CF10 2BY, United Kingdom', 40, 130, 'Burgers, Fries, Drinks', 4, 3, 25),
(124, 'The Grazing Shed Truck', 'Sophia Gardens, Cardiff CF11 9XR, United Kingdom', 70, 200, 'Burgers, Chips, Wraps', 4, 4, 25),
(125, 'Brød The Danish Bakery', '126 Wyndham Cres, Cardiff CF11 9ED, United Kingdom', 60, 180, 'Danish Pastries, Coffee, Bread', 5, 5, 25);

-- =====================================
-- AUSTRALIA
-- =====================================

-- Sydney (dest_id = 26)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(126, 'Quay Restaurant', 'Upper Level, Overseas Passenger Terminal, The Rocks, Sydney NSW 2000, Australia', 400, 2000, 'Fine Dining, Contemporary Australian Cuisine', 5, 1, 26),
(127, 'Single O Surry Hills', '60-64 Reservoir St, Surry Hills NSW 2010, Australia', 70, 200, 'Specialty Coffee, Brunch, Pastries', 5, 2, 26),
(128, 'McDonald’s Circular Quay', 'Cnr Pitt St & Alfred St, Circular Quay NSW 2000, Australia', 50, 150, 'Burgers, Fries, Drinks', 4, 3, 26),
(129, 'Eat Art Truck', 'The Domain, Art Gallery Rd, Sydney NSW 2000, Australia', 80, 220, 'Gourmet Street Food, Burgers, Wraps', 4, 4, 26),
(130, 'Bourke Street Bakery', '633 Bourke St, Surry Hills NSW 2010, Australia', 60, 180, 'Bread, Pastries, Coffee', 5, 5, 26),

-- Melbourne (dest_id = 27)
(131, 'Attica Restaurant', '74 Glen Eira Rd, Ripponlea VIC 3185, Australia', 450, 1800, 'Modern Australian, Tasting Menu', 5, 1, 27),
(132, 'Higher Ground Café', '650 Little Bourke St, Melbourne VIC 3000, Australia', 70, 220, 'Coffee, Brunch, Pastries', 5, 2, 27),
(133, 'Hungry Jack’s Flinders Street', '1 Flinders St, Melbourne VIC 3000, Australia', 50, 130, 'Burgers, Fries, Drinks', 4, 3, 27),
(134, 'Mr. Burger Truck', 'Various Locations, Melbourne VIC, Australia', 80, 200, 'Burgers, Fries, Wraps', 4, 4, 27),
(135, 'Lune Croissanterie', '119 Rose St, Fitzroy VIC 3065, Australia', 60, 200, 'Croissants, Pastries, Coffee', 5, 5, 27),

-- Brisbane (dest_id = 28)
(136, 'Esquire Restaurant', '145 Eagle St, Brisbane City QLD 4000, Australia', 350, 1300, 'Contemporary Australian, Degustation', 5, 1, 28),
(137, 'John Mills Himself Café', '40 Charlotte St, Brisbane City QLD 4000, Australia', 60, 180, 'Coffee, Toasts, Pastries', 5, 2, 28),
(138, 'KFC Queen Street Mall', 'Queen St Mall, Brisbane City QLD 4000, Australia', 40, 120, 'Fried Chicken, Burgers, Drinks', 4, 3, 28),
(139, 'The Bun Mobile Truck', 'Various Locations, Brisbane QLD, Australia', 80, 200, 'Asian-Inspired Buns, Street Food', 5, 4, 28),
(140, 'Flour & Chocolate Bakery', '621 Wynnum Rd, Morningside QLD 4170, Australia', 60, 180, 'Pastries, Bread, Coffee', 5, 5, 28),

-- Perth (dest_id = 29)
(141, 'Wildflower Restaurant', '1 Cathedral Ave, Perth WA 6000, Australia', 400, 1600, 'Fine Dining, Native Australian Cuisine', 5, 1, 29),
(142, 'La Veen Coffee', '90 King St, Perth WA 6000, Australia', 70, 200, 'Coffee, Brunch, Toasts', 5, 2, 29),
(143, 'Red Rooster Perth CBD', '15 Barrack St, Perth WA 6000, Australia', 40, 130, 'Chicken Meals, Wraps, Fries', 4, 3, 29),
(144, 'Comida Do Sul Truck', 'Elizabeth Quay, Perth WA 6000, Australia', 80, 220, 'Brazilian Street Food, Grilled Meats', 4, 4, 29),
(145, 'Mary Street Bakery', '272 Beaufort St, Perth WA 6003, Australia', 60, 180, 'Pastries, Bread, Coffee', 5, 5, 29),

-- Adelaide (dest_id = 30)
(146, 'Restaurant Orana', '285 Rundle St, Adelaide SA 5000, Australia', 350, 1500, 'Modern Australian, Native Ingredients', 5, 1, 30),
(147, 'Exchange Specialty Coffee', '12-18 Vardon Ave, Adelaide SA 5000, Australia', 60, 180, 'Coffee, Toasts, Pastries', 5, 2, 30),
(148, 'McDonald’s Rundle Mall', '76 Rundle Mall, Adelaide SA 5000, Australia', 50, 140, 'Burgers, Fries, Drinks', 4, 3, 30),
(149, 'Burger Theory Truck', 'Hindmarsh Square, Adelaide SA 5000, Australia', 80, 200, 'Burgers, Chips, Wraps', 4, 4, 30),
(150, 'Bakery on O’Connell', '128 O’Connell St, North Adelaide SA 5006, Australia', 60, 190, 'Pies, Pastries, Coffee', 5, 5, 30);

-- =====================================
-- CANADA
-- =====================================

-- Toronto (dest_id = 31)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(151, 'Alo Restaurant', '163 Spadina Ave, Toronto, ON M5V 2L6, Canada', 350, 1300, 'Contemporary French, Tasting Menu', 5, 1, 31),
(152, 'Jimmy’s Coffee', '84 Gerrard St W, Toronto, ON M5G 1J5, Canada', 60, 180, 'Coffee, Sandwiches, Pastries', 5, 2, 31),
(153, 'McDonald’s Yonge-Dundas Square', '356 Yonge St, Toronto, ON M5B 1S5, Canada', 40, 130, 'Burgers, Fries, Drinks', 4, 3, 31),
(154, 'Toronto Food Trucks - Fidel Gastro’s', 'Various Locations, Toronto, ON, Canada', 80, 200, 'Gourmet Sandwiches, Street Food', 5, 4, 31),
(155, 'Delysees Luxury Desserts', '780 King St W, Toronto, ON M5V 1N6, Canada', 60, 200, 'Pastries, Macarons, Coffee', 5, 5, 31),

-- Vancouver (dest_id = 32)
(156, 'Hawksworth Restaurant', '801 W Georgia St, Vancouver, BC V6C 1P7, Canada', 350, 1200, 'Modern Canadian Cuisine, Fine Dining', 5, 1, 32),
(157, 'Revolver Coffee', '325 Cambie St, Vancouver, BC V6B 2N4, Canada', 60, 200, 'Specialty Coffee, Pastries', 5, 2, 32),
(158, 'A&W Canada Downtown', '650 W Pender St, Vancouver, BC V6B 1V8, Canada', 40, 120, 'Burgers, Onion Rings, Drinks', 4, 3, 32),
(159, 'Japadog Truck', '530 Robson St, Vancouver, BC V6B 2B7, Canada', 80, 200, 'Japanese Hot Dogs, Fries, Drinks', 5, 4, 32),
(160, 'Purebread Bakery', '159 W Hastings St, Vancouver, BC V6B 1H5, Canada', 60, 180, 'Cakes, Pastries, Coffee', 5, 5, 32),

-- Montreal (dest_id = 33)
(161, 'Toqué!', '900 Jean Paul Riopelle Pl, Montreal, QC H2Z 2B2, Canada', 400, 1400, 'Quebecois Fine Dining, Seasonal Menu', 5, 1, 33),
(162, 'Café Olimpico', '124 Rue Saint Viateur O, Montreal, QC H2T 2L1, Canada', 50, 160, 'Espresso, Croissants, Sandwiches', 5, 2, 33),
(163, 'Burger King Montreal Centre', '444 Sainte-Catherine St W, Montreal, QC H3B 1A6, Canada', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 33),
(164, 'Le Cheese Truck', 'Various Locations, Montreal, QC, Canada', 70, 180, 'Grilled Cheese, Fries, Soups', 4, 4, 33),
(165, 'Boulangerie Guillaume', '5134 Boul St-Laurent, Montreal, QC H2T 1R8, Canada', 60, 180, 'Bread, Pastries, Coffee', 5, 5, 33),

-- Ottawa (dest_id = 34)
(166, 'Beckta Dining & Wine', '150 Elgin St, Ottawa, ON K2P 1L4, Canada', 300, 1100, 'Fine Dining, Wine Pairings', 5, 1, 34),
(167, 'Bridgehead Coffeehouse', '130 Anderson St, Ottawa, ON K1R 6T7, Canada', 50, 160, 'Coffee, Pastries, Sandwiches', 5, 2, 34),
(168, 'Wendy’s Bank Street', '1579 Bank St, Ottawa, ON K1H 7Z3, Canada', 40, 120, 'Burgers, Chicken Sandwiches, Drinks', 4, 3, 34),
(169, 'Ad Mare Seafood Truck', 'Various Locations, Ottawa, ON, Canada', 80, 220, 'Lobster Rolls, Fish Tacos, Fries', 5, 4, 34),
(170, 'Art-Is-In Bakery', '250 City Centre Ave, Ottawa, ON K1R 6K7, Canada', 60, 200, 'Bread, Sandwiches, Pastries', 5, 5, 34),

-- Calgary (dest_id = 35)
(171, 'River Café', '25 Prince’s Island, Calgary, AB T2P 0R1, Canada', 300, 1000, 'Local Cuisine, Seasonal Menu', 5, 1, 35),
(172, 'Analog Coffee', '740 17 Ave SW, Calgary, AB T2S 0B7, Canada', 60, 180, 'Coffee, Brunch, Pastries', 5, 2, 35),
(173, 'McDonald’s 17th Avenue', '411 17 Ave SW, Calgary, AB T2S 0A5, Canada', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 35),
(174, 'Perogy Boyz Truck', 'Various Locations, Calgary, AB, Canada', 70, 200, 'Perogies, Street Food, Fries', 4, 4, 35),
(175, 'Yann Haute Patisserie', '329 23 Ave SW, Calgary, AB T2S 0J3, Canada', 60, 180, 'French Pastries, Cakes, Coffee', 5, 5, 35);

-----------------------------------
-- SWITZERLAND
-----------------------------------

-- Zürich (dest_id = 36)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(176, 'Restaurant Zeughauskeller', 'Bahnhofstrasse 28a, 8001 Zürich, Switzerland', 300, 950, 'Traditional Swiss Dishes, Rösti, Sausages', 5, 1, 36),
(177, 'Café Schober', 'Napfgasse 4, 8001 Zürich, Switzerland', 70, 200, 'Coffee, Pastries, Chocolates', 5, 2, 36),
(178, 'McDonald’s Zürich Stadelhofen', 'Stadelhoferstrasse 8, 8001 Zürich, Switzerland', 45, 130, 'Burgers, Fries, Soft Drinks', 4, 3, 36),
(179, 'Wrap House Food Truck', 'Paradeplatz, 8001 Zürich, Switzerland', 90, 200, 'Wraps, Fries, Street Snacks', 4, 4, 36),
(180, 'John Baker Sihlcity', 'Kalanderplatz 1, 8045 Zürich, Switzerland', 70, 220, 'Organic Bread, Pastries, Coffee', 5, 5, 36),

-- Geneva (dest_id = 37)
(181, 'Le Chat-Botté', 'Quai du Mont-Blanc 13, 1201 Genève, Switzerland', 400, 1400, 'French Fine Dining, Seasonal Dishes', 5, 1, 37),
(182, 'Boréal Coffee Shop', 'Rue du Stand 60, 1204 Genève, Switzerland', 80, 220, 'Coffee, Cakes, Sandwiches', 5, 2, 37),
(183, 'Burger King Cornavin', 'Rue de Lausanne 18, 1201 Genève, Switzerland', 45, 120, 'Burgers, Fries, Drinks', 4, 3, 37),
(184, 'Street Gourmet Food Truck', 'Quai Gustave-Ador 54, 1207 Genève, Switzerland', 100, 250, 'Gourmet Sandwiches, Wraps, Fries', 5, 4, 37),
(185, 'Boulangerie Eric Emery', 'Rue du Mont-Blanc 27, 1201 Genève, Switzerland', 70, 190, 'Croissants, Bread, Pastries', 5, 5, 37),

-- Basel (dest_id = 38)
(186, 'Restaurant Kunsthalle', 'Steinenberg 7, 4051 Basel, Switzerland', 320, 1100, 'Swiss-European Cuisine, Local Wines', 5, 1, 38),
(187, 'Café Frühling', 'Klybeckstrasse 69, 4057 Basel, Switzerland', 70, 220, 'Coffee, Cakes, Light Breakfast', 5, 2, 38),
(188, 'McDonald’s Basel Marktplatz', 'Marktplatz 27, 4001 Basel, Switzerland', 45, 130, 'Fast Food, Burgers, Drinks', 4, 3, 38),
(189, 'Basel Street Bites Truck', 'Barfüsserplatz, 4051 Basel, Switzerland', 80, 200, 'Hot Dogs, Wraps, Chips', 4, 4, 38),
(190, 'Beschle Bäckerei Café', 'Gerbergasse 45, 4001 Basel, Switzerland', 70, 200, 'Pastries, Coffee, Sandwiches', 5, 5, 38),

-- Bern (dest_id = 39)
(191, 'Restaurant Kornhauskeller', 'Kornhausplatz 18, 3011 Bern, Switzerland', 350, 1200, 'Swiss Gourmet, Local Dishes', 5, 1, 39),
(192, 'Adriano’s Bar & Café', 'Theaterplatz 2, 3011 Bern, Switzerland', 70, 180, 'Espresso, Pastries, Sandwiches', 5, 2, 39),
(193, 'McDonald’s Bern Marktgasse', 'Marktgasse 49, 3011 Bern, Switzerland', 45, 130, 'Burgers, Fries, Drinks', 4, 3, 39),
(194, 'Bern Food Truck Co.', 'Bundesplatz, 3011 Bern, Switzerland', 90, 210, 'Wraps, Burgers, Fries', 4, 4, 39),
(195, 'Beck Glatz Confiseur', 'Marktgasse 32, 3011 Bern, Switzerland', 70, 200, 'Bakery, Cakes, Bread', 5, 5, 39),

-- Lausanne (dest_id = 40)
(196, 'Restaurant Anne-Sophie Pic', 'Place du Port 17, 1006 Lausanne, Switzerland', 500, 1800, 'French Fine Dining, Michelin-Starred', 5, 1, 40),
(197, 'Café de Grancy', 'Avenue du Rond-Point 1, 1006 Lausanne, Switzerland', 80, 200, 'Brunch, Coffee, Desserts', 5, 2, 40),
(198, 'McDonald’s Lausanne Gare', 'Place de la Gare 4, 1003 Lausanne, Switzerland', 45, 130, 'Fast Food, Drinks', 4, 3, 40),
(199, 'Lausanne Street Kitchen', 'Place de la Riponne, 1005 Lausanne, Switzerland', 100, 240, 'Burgers, Wraps, Fries', 4, 4, 40),
(200, 'Maison Buet Bakery', 'Rue de Bourg 5, 1003 Lausanne, Switzerland', 70, 220, 'Pastries, Coffee, Breads', 5, 5, 40);

-----------------------------------
-- CHINA
-----------------------------------

-- Beijing (dest_id = 41)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(201, 'TRB Hutong', '23 Shatan North St, Dongcheng, Beijing, China', 350, 1300, 'Modern European, Fine Dining', 5, 1, 41),
(202, 'Moka Bros Café', '6 Dongsi North St, Dongcheng, Beijing, China', 60, 180, 'Coffee, Smoothies, Light Meals', 5, 2, 41),
(203, 'McDonald’s Wangfujing', 'No. 99 Wangfujing St, Dongcheng, Beijing, China', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 41),
(204, 'Beijing Street Eats Truck', 'Qianmen St, Dongcheng, Beijing, China', 80, 200, 'Street Food, Dumplings, Wraps', 5, 4, 41),
(205, '85°C Bakery Cafe', 'No. 101 Jian Guo Men St, Beijing, China', 60, 200, 'Pastries, Coffee, Cakes', 5, 5, 41),

-- Shanghai (dest_id = 42)
(206, 'Ultraviolet by Paul Pairet', '31st Floor, The Bund, Shanghai, China', 500, 2000, 'Avant-Garde Cuisine, Tasting Menu', 5, 1, 42),
(207, 'Seesaw Coffee', '111 Wuding Rd, Jing’an, Shanghai, China', 60, 180, 'Coffee, Brunch, Pastries', 5, 2, 42),
(208, 'KFC Nanjing Road', 'No. 300 Nanjing Rd, Huangpu, Shanghai, China', 40, 120, 'Chicken, Burgers, Fries', 4, 3, 42),
(209, 'Shanghai Street Food Truck', 'Yuyuan Garden, Huangpu, Shanghai, China', 80, 200, 'Street Food, Dumplings, Snacks', 5, 4, 42),
(210, 'Awfully Chocolate Bakery', 'No. 137 Wuding Rd, Jing’an, Shanghai, China', 60, 200, 'Chocolate Cakes, Pastries, Coffee', 5, 5, 42),

-- Guangzhou (dest_id = 43)
(211, 'Bingsheng Pinwei', 'No. 88 Dongfeng Rd, Tianhe, Guangzhou, China', 300, 1000, 'Cantonese Fine Dining, Dim Sum', 5, 1, 43),
(212, 'Maan Coffee', 'No. 10 Tianhe Rd, Tianhe, Guangzhou, China', 50, 180, 'Coffee, Toasts, Desserts', 5, 2, 43),
(213, 'McDonald’s Tianhe', 'No. 123 Tianhe Rd, Guangzhou, China', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 43),
(214, 'Guangzhou Food Truck', 'Beijing Rd, Yuexiu, Guangzhou, China', 80, 200, 'Street Snacks, Dumplings, Wraps', 5, 4, 43),
(215, 'Ladurée Bakery', 'No. 98 Huanshi E Rd, Guangzhou, China', 60, 200, 'Pastries, Macarons, Coffee', 5, 5, 43),

-- Shenzhen (dest_id = 44)
(216, 'The Kitchen Table', 'Hilton Shenzhen, Futian, Shenzhen, China', 350, 1200, 'International Cuisine, Fine Dining', 5, 1, 44),
(217, 'Seesaw Coffee Shenzhen', 'No. 218 Huaqiang Rd, Futian, Shenzhen, China', 60, 180, 'Coffee, Pastries, Brunch', 5, 2, 44),
(218, 'KFC Huaqiangbei', 'No. 300 Huaqiang Rd, Futian, Shenzhen, China', 40, 120, 'Fried Chicken, Burgers, Drinks', 4, 3, 44),
(219, 'Shenzhen Street Eats Truck', 'Kingkey 100, Futian, Shenzhen, China', 80, 200, 'Wraps, Skewers, Snacks', 5, 4, 44),
(220, '85°C Bakery Café', 'No. 101 Shennan Rd, Futian, Shenzhen, China', 60, 200, 'Cakes, Coffee, Pastries', 5, 5, 44),

-- Chengdu (dest_id = 45)
(221, 'Yu’s Family Kitchen', 'No. 12 Shufeng St, Jinjiang, Chengdu, China', 300, 1000, 'Sichuan Cuisine, Fine Dining', 5, 1, 45),
(222, 'Maan Coffee Chengdu', 'No. 88 Chunxi Rd, Jinjiang, Chengdu, China', 50, 180, 'Coffee, Cakes, Toasts', 5, 2, 45),
(223, 'McDonald’s Chengdu Chunxi', 'No. 123 Chunxi Rd, Jinjiang, Chengdu, China', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 45),
(224, 'Sichuan Street Food Truck', 'Kuanzhai Alley, Qingyang, Chengdu, China', 80, 200, 'Street Snacks, Dumplings, Skewers', 5, 4, 45),
(225, 'BreadTalk Chengdu', 'No. 56 Hongxing Rd, Jinjiang, Chengdu, China', 60, 200, 'Pastries, Bread, Coffee', 5, 5, 45);

-----------------------------------
-- BRAZIL
-----------------------------------

-- Rio de Janeiro (dest_id = 46)
INSERT INTO food_place (foodp_id, foodp_name, foodp_address, foodp_min_price, foodp_max_price, foodp_menu_items, foodp_rating, foodp_type_id, dest_id) VALUES
(226, 'Oro Restaurant', 'Rua General San Martin 35, Leblon, Rio de Janeiro, Brazil', 350, 1400, 'Brazilian Fine Dining, Tasting Menu', 5, 1, 46),
(227, 'Café do Alto', 'Rua Dias Ferreira 220, Leblon, Rio de Janeiro, Brazil', 60, 200, 'Coffee, Regional Snacks, Pastries', 5, 2, 46),
(228, 'McDonald’s Copacabana', 'Av. Atlântica 1702, Copacabana, Rio de Janeiro, Brazil', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 46),
(229, 'Rio Street Food Truck', 'Praia do Leme, Leme, Rio de Janeiro, Brazil', 80, 220, 'Coxinha, Hot Dogs, Pastel', 5, 4, 46),
(230, 'Padaria Colombo', 'Rua Gonçalves Dias 32, Centro, Rio de Janeiro, Brazil', 60, 200, 'Bakery, Pastries, Coffee', 5, 5, 46),

-- São Paulo (dest_id = 47)
(231, 'D.O.M.', 'Rua Barão de Capanema 549, Jardins, São Paulo, Brazil', 400, 1500, 'Brazilian Fine Dining, Modern Cuisine', 5, 1, 47),
(232, 'Santo Grão Café', 'Rua Oscar Freire 1188, Jardins, São Paulo, Brazil', 60, 180, 'Coffee, Sandwiches, Pastries', 5, 2, 47),
(233, 'McDonald’s Paulista Avenue', 'Av. Paulista 1578, São Paulo, Brazil', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 47),
(234, 'Food Truck SP Gourmet', 'Praça Roosevelt, São Paulo, Brazil', 80, 220, 'Gourmet Sandwiches, Wraps, Fries', 5, 4, 47),
(235, 'Benjamin Bakery', 'Rua Augusta 1450, Consolação, São Paulo, Brazil', 60, 200, 'Pastries, Coffee, Cakes', 5, 5, 47),

-- Brasília (dest_id = 48)
(236, 'Mangai', 'SCN Quadra 9, Bloco A, Asa Norte, Brasília, Brazil', 300, 1000, 'Northeastern Brazilian Cuisine', 5, 1, 48),
(237, 'Café do Ponto', 'SCLN 204, Bloco B, Asa Norte, Brasília, Brazil', 50, 180, 'Coffee, Sandwiches, Pastries', 5, 2, 48),
(238, 'McDonald’s Brasília Shopping', 'SHN QI 5, Brasília, Brazil', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 48),
(239, 'Street Eats DF', 'Praça dos Três Poderes, Brasília, Brazil', 80, 200, 'Snacks, Wraps, Hot Dogs', 5, 4, 48),
(240, 'Padaria Real', 'CLS 203, Bloco C, Asa Norte, Brasília, Brazil', 60, 200, 'Bakery, Pastries, Coffee', 5, 5, 48),

-- Salvador (dest_id = 49)
(241, 'Casa de Tereza', 'Rua Alagoinhas 18, Pelourinho, Salvador, Brazil', 300, 1200, 'Bahian Cuisine, Seafood', 5, 1, 49),
(242, 'Café Terrasse', 'Largo do Terreiro de Jesus, Pelourinho, Salvador, Brazil', 50, 180, 'Coffee, Cakes, Light Meals', 5, 2, 49),
(243, 'McDonald’s Salvador', 'Av. Sete de Setembro 123, Salvador, Brazil', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 49),
(244, 'Bahia Street Food Truck', 'Pelourinho, Salvador, Brazil', 80, 200, 'Pastel, Coxinha, Snacks', 5, 4, 49),
(245, 'Padaria São José', 'Rua Chile 12, Salvador, Brazil', 60, 200, 'Pastries, Bread, Coffee', 5, 5, 49),

-- Curitiba (dest_id = 50)
(246, 'Madero Steak House', 'Av. do Batel 1863, Batel, Curitiba, Brazil', 300, 1200, 'Brazilian Steaks, Grill', 5, 1, 50),
(247, 'Lucca Café', 'Rua Padre Anchieta 150, Curitiba, Brazil', 50, 180, 'Coffee, Pastries, Sandwiches', 5, 2, 50),
(248, 'McDonald’s Curitiba', 'Rua XV de Novembro 123, Curitiba, Brazil', 40, 120, 'Burgers, Fries, Drinks', 4, 3, 50),
(249, 'Curitiba Food Truck', 'Praça Osório, Curitiba, Brazil', 80, 200, 'Wraps, Snacks, Fries', 5, 4, 50),
(250, 'Confeitaria das Famílias', 'Rua 24 de Maio 65, Curitiba, Brazil', 60, 200, 'Pastries, Bread, Cakes', 5, 5, 50);

INSERT INTO user (user_id, user_name, user_surname, user_email, user_bio, user_password, user_created_date, notification_on, curr_id) VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', 'Coffee in one hand, ideas in the other. Always two steps ahead—or at least trying to be. ☕💡', 'AQAAAAIAAYagAAAAENSCnr/j1Qq9//e7nU1QcaglsolbX2+tXWmxAiNI7tEwl70Bi00+OU647nPd+ZLeNg==', '2025-10-04', 1, 1),
(2, 'Suzzane', 'Smith', 'suzzane.smith@gmail.com', 'Sunshine mixed with a bit of storm. Loves art, laughter, and late-night deep talks. 🌦️🎨',  'AQAAAAIAAYagAAAAELDsgeDzTS0YTpbrYgTHfs3jsiAbzzASRX1JfPk4JZc6lz904Y66EKWZqYvqUY+LiA==', '2025-10-04', 1, 1),
(3, 'Michael', 'Brown', 'michael.brown@gmail.com', 'Tech geek by day, pizza critic by night. Forever chasing the next big adventure. 🍕💻',  'AQAAAAIAAYagAAAAEDngUIuaQLkVw4zjAGv8TqPPbpp6SPid0ZfWRl3modn2MtIVWz/SwWsqdCFmyHMtvA==', '2025-10-04', 1, 1),
(4, 'Emma', 'Johnson', 'emma.johnson@gmail.com', 'Book lover, dog cuddler, and unstoppable optimist. Making chaos look cute since day one. 📚🐾✨',  'AQAAAAIAAYagAAAAEA2CghGZBaYX8RQ2S5AQY52/LHQABOiJ2A9WjCVeBl4R9s0bgphyCgJfaY6WPFNkHA==', '2025-10-04', 1, 1),
(5, 'David', 'Williams', 'david.williams@gmail.com', 'Gym, gadgets, and good vibes only. Known to drop random fun facts mid-conversation. 💪🔋🧠', 'AQAAAAIAAYagAAAAEHRdNktfsv5pbkG5mgCHwkgsgQilLwy+ksnXjefLMzAu1OuC/ZhwhflzokVkj76Rpg==', '2025-10-04', 1, 1);

INSERT INTO spender_type (spender_type_id, spender_type_name, spender_type_level) VALUES
(1, 'Very Low Spender', 1),
(2, 'Low Spender', 2),
(3, 'Medium Spender', 3),
(4, 'High Spender', 4),
(5, 'Very High Spender', 5);

INSERT INTO admin (admin_id, admin_name, admin_surname, admin_email, admin_password) VALUES
(1, 'Alice', 'Taylor', 'alice.taylor@work.com', 'AQAAAAIAAYagAAAAEJ6xO75Hry9BroOZYKY5KTn3ngiDV2QTXszuCketPdmrGIPp5zHe+mhds+icMgPSYg=='),
(2, 'Brian', 'Clark', 'brian.clark@work.com', 'AQAAAAIAAYagAAAAEFGqOsatIMLPzJRc9/Ub3h+g9q+gquOQ/Gppk4IWl9ICGbWIOgPS+kNnZ5XCcIiBUA=='),
(3, 'Catherine', 'Lewis', 'catherine.lewis@work.com', 'AQAAAAIAAYagAAAAEKPMP4YO6ACgeUeA6SQGFH53HsEUdtKlzhUW8pXqbKYNihBK90XdPr83Ri1ym5WQ9g=='),
(4, 'Daniel', 'Walker', 'daniel.walker@work.com', 'AQAAAAIAAYagAAAAENoKml13+H56SdXmAWQhfZRMayRGtlQgJzz6fCqU5yoECs4DtxEcevt3DBq0u4n5Fw=='),
(5, 'Fiona', 'Hall', 'fiona.hall@work.com', 'AQAAAAIAAYagAAAAEATAzZ5L0R0/dylh8KQk9zjkWfLfbuYh/Yj8Y5BD9eLt3Eg4OrwVTahVcRosLPQhZQ==');

INSERT INTO error_type (err_type_id, err_type_name, err_type_level) VALUES
(1, 'Login/Authentication Error', 4),
(2, 'Page Not Loading', 5),
(3, 'Broken Link', 2),
(4, 'Slow Performance', 3),
(5, 'UI Display Error', 2),
(6, 'Incorrect Data Display', 4);

----------------------------------
-- SOUTH AFRICA
----------------------------------

-- Cape Town (1)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(1, 'Table Mountain Aerial Cableway', 'Tafelberg Rd, Gardens, Cape Town, 8001, South Africa', 250, 400, 1),
(2, 'V&A Waterfront', '19 Dock Rd, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa', 0, 300, 1),
(3, 'Kirstenbosch National Botanical Garden', 'Rhodes Dr, Newlands, Cape Town, 7735, South Africa', 80, 220, 1),
(4, 'Cape Point Nature Reserve', 'Cape Point Rd, Cape Town, 7975, South Africa', 100, 350, 1),
(5, 'Boulders Beach Penguin Colony', 'Kleintuin Rd, Simon’s Town, Cape Town, 7995, South Africa', 50, 160, 1),

-- Johannesburg (2)
(6, 'Apartheid Museum', 'Northern Parkway & Gold Reef Rd, Johannesburg, 2001, South Africa', 100, 250, 2),
(7, 'Gold Reef City Theme Park', 'Shaft 14, Northern Pkwy, Ormonde, Johannesburg, 2091, South Africa', 200, 400, 2),
(8, 'Nelson Mandela Square', '5th St, Sandown, Sandton, 2031, South Africa', 0, 0, 2),
(9, 'Constitution Hill Human Rights Precinct', '11 Kotze St, Braamfontein, Johannesburg, 2001, South Africa', 50, 150, 2),
(10, 'Johannesburg Botanical Garden', 'Olifants Rd, Emmarentia, Johannesburg, 2195, South Africa', 0, 50, 2),

-- Durban (3)
(11, 'uShaka Marine World', '1 King Shaka Ave, Point, Durban, 4001, South Africa', 180, 350, 3),
(12, 'Durban Botanic Gardens', '70 John Zikhali Rd, Berea, Durban, 4001, South Africa', 0, 50, 3),
(13, 'Moses Mabhida Stadium', '44 Isaiah Ntshangase Rd, Stamford Hill, Durban, 4001, South Africa', 120, 300, 3),
(14, 'Golden Mile Beachfront', 'Snell Parade, North Beach, Durban, 4001, South Africa', 0, 0, 3),
(15, 'Mitchell Park Zoo', '10 Ferndale Rd, Morningside, Durban, 4001, South Africa', 35, 80, 3),

-- Pretoria (4)
(16, 'Union Buildings', 'Government Ave, Pretoria, 0002, South Africa', 0, 0, 4),
(17, 'National Zoological Gardens of South Africa', '232 Boom St, Daspoort 319-Jr, Pretoria, 0001, South Africa', 120, 250, 4),
(18, 'Voortrekker Monument', 'Eeufees Rd, Groenkloof 358-Jr, Pretoria, 0027, South Africa', 100, 200, 4),
(19, 'Freedom Park Heritage Site', 'Koch St, Salvokop, Pretoria, 0002, South Africa', 80, 150, 4),
(20, 'Rietvlei Nature Reserve', 'Nelmapious Dr, Irene, Pretoria, 0157, South Africa', 60, 200, 4),

-- Port Elizabeth (5)
(21, 'Addo Elephant National Park', 'Addo, Eastern Cape, South Africa', 100, 300, 5),
(22, 'Bayworld Museum Complex', 'Beach Rd, Humewood, Gqeberha, 6001, South Africa', 50, 120, 5),
(23, 'Kragga Kamma Game Park', 'Kragga Kamma Rd, Theescombe, Gqeberha, 6070, South Africa', 120, 250, 5),
(24, 'Donkin Reserve', 'Upper Hill St, Central, Gqeberha, 6001, South Africa', 0, 0, 5),
(25, 'Boardwalk Mall and Casino', 'Marine Dr, Summerstrand, Gqeberha, 6001, South Africa', 0, 300, 5);

----------------------------------
-- JAPAN
----------------------------------

-- Tokyo (6)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(26, 'Tokyo Skytree', '1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan', 1000, 3000, 6),
(27, 'Senso-ji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo 111-0032, Japan', 0, 0, 6),
(28, 'Shinjuku Gyoen National Garden', '11 Naitomachi, Shinjuku City, Tokyo 160-0014, Japan', 500, 1000, 6),
(29, 'Tokyo Disneyland', '1-1 Maihama, Urayasu, Chiba 279-0031, Japan', 7400, 8900, 6),
(30, 'Meiji Shrine', '1-1 Yoyogikamizonochō, Shibuya City, Tokyo 151-8557, Japan', 0, 0, 6),

-- Kyoto (7)
(31, 'Fushimi Inari Taisha', '68 Fukakusa Yabunouchicho, Fushimi Ward, Kyoto, 612-0882, Japan', 0, 0, 7),
(32, 'Kinkaku-ji (Golden Pavilion)', '1 Kinkakujicho, Kita Ward, Kyoto, 603-8361, Japan', 500, 1000, 7),
(33, 'Arashiyama Bamboo Grove', 'Sagaogurayama Tabuchiyamacho, Ukyo Ward, Kyoto, 616-8394, Japan', 0, 0, 7),
(34, 'Nijo Castle', '541 Nijojocho, Nakagyo Ward, Kyoto, 604-8301, Japan', 800, 1300, 7),
(35, 'Gion District', 'Gionmachi, Higashiyama Ward, Kyoto, 605-0074, Japan', 0, 0, 7),

-- Osaka (8)
(36, 'Osaka Castle', '1-1 Osakajo, Chuo Ward, Osaka, 540-0002, Japan', 600, 1200, 8),
(37, 'Dotonbori District', 'Dotonbori, Chuo Ward, Osaka, 542-0071, Japan', 0, 0, 8),
(38, 'Universal Studios Japan', '2 Chome-1-33 Sakurajima, Konohana Ward, Osaka, 554-0031, Japan', 8600, 9400, 8),
(39, 'Umeda Sky Building', '1 Chome-1-88 Oyodonaka, Kita Ward, Osaka, 531-6023, Japan', 1500, 2000, 8),
(40, 'Osaka Aquarium Kaiyukan', '1 Chome-1-10 Kaigandori, Minato Ward, Osaka, 552-0022, Japan', 2400, 3000, 8),

-- Hokkaido (9)
(41, 'Sapporo Snow Festival', 'Odori Park, Chuo Ward, Sapporo, Hokkaido, Japan', 0, 0, 9),
(42, 'Otaru Canal', 'Minatomachi, Otaru, Hokkaido 047-0007, Japan', 0, 0, 9),
(43, 'Niseko Ski Resort', 'Niseko, Abuta District, Hokkaido, Japan', 4000, 10000, 9),
(44, 'Asahiyama Zoo', 'Kuranuma, Higashiasahikawacho, Asahikawa, Hokkaido 078-8205, Japan', 1000, 1200, 9),
(45, 'Furano Flower Fields', 'Nakafurano, Sorachi District, Hokkaido 071-0704, Japan', 0, 0, 9),

-- Hiroshima (10)
(46, 'Hiroshima Peace Memorial Park', '1-2 Nakajimacho, Naka Ward, Hiroshima, 730-0811, Japan', 0, 0, 10),
(47, 'Hiroshima Castle', '21-1 Motomachi, Naka Ward, Hiroshima, 730-0011, Japan', 370, 720, 10),
(48, 'Miyajima Itsukushima Shrine', '1-1 Miyajimacho, Hatsukaichi, Hiroshima 739-0588, Japan', 300, 1000, 10),
(49, 'Hiroshima Museum of Art', '3-2 Motomachi, Naka Ward, Hiroshima, 730-0011, Japan', 600, 1300, 10),
(50, 'Shukkeien Garden', '2-11 Kaminoboricho, Naka Ward, Hiroshima, 730-0014, Japan', 260, 500, 10);

----------------------------------
-- USA
----------------------------------
-- New York City (11)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(51, 'Statue of Liberty', 'Liberty Island, New York, NY 10004, USA', 25, 45, 11),
(52, 'Central Park', 'New York, NY 10024, USA', 0, 0, 11),
(53, 'Metropolitan Museum of Art', '1000 5th Ave, New York, NY 10028, USA', 30, 35, 11),
(54, 'Empire State Building Observatory', '20 W 34th St, New York, NY 10001, USA', 44, 79, 11),
(55, 'Times Square', 'Manhattan, NY 10036, USA', 0, 0, 11),

-- Los Angeles (12)
(56, 'Hollywood Walk of Fame', 'Hollywood Blvd, Los Angeles, CA 90028, USA', 0, 0, 12),
(57, 'Griffith Observatory', '2800 E Observatory Rd, Los Angeles, CA 90027, USA', 0, 15, 12),
(58, 'Santa Monica Pier', '200 Santa Monica Pier, Santa Monica, CA 90401, USA', 0, 20, 12),
(59, 'Universal Studios Hollywood', '100 Universal City Plaza, Universal City, CA 91608, USA', 109, 149, 12),
(60, 'The Getty Center', '1200 Getty Center Dr, Los Angeles, CA 90049, USA', 0, 0, 12),

-- Chicago (13)
(61, 'Millennium Park', '201 E Randolph St, Chicago, IL 60602, USA', 0, 0, 13),
(62, 'Willis Tower Skydeck', '233 S Wacker Dr, Chicago, IL 60606, USA', 35, 45, 13),
(63, 'Art Institute of Chicago', '111 S Michigan Ave, Chicago, IL 60603, USA', 25, 32, 13),
(64, 'Navy Pier', '600 E Grand Ave, Chicago, IL 60611, USA', 0, 25, 13),
(65, 'Chicago Riverwalk', 'Chicago Riverwalk, Chicago, IL 60601, USA', 0, 0, 13),

-- Miami (14)
(66, 'Miami Beach', 'Miami Beach, FL 33139, USA', 0, 0, 14),
(67, 'Wynwood Walls', '2520 NW 2nd Ave, Miami, FL 33127, USA', 10, 15, 14),
(68, 'Vizcaya Museum & Gardens', '3251 S Miami Ave, Miami, FL 33129, USA', 25, 35, 14),
(69, 'Little Havana', 'SW 8th St, Miami, FL 33135, USA', 0, 0, 14),
(70, 'Bayside Marketplace', '401 Biscayne Blvd, Miami, FL 33132, USA', 0, 50, 14),

-- San Francisco (15)
(71, 'Golden Gate Bridge', 'Golden Gate Bridge, San Francisco, CA 94129, USA', 0, 0, 15),
(72, 'Alcatraz Island', 'Alcatraz Island, San Francisco, CA 94133, USA', 45, 55, 15),
(73, 'Fisherman’s Wharf', 'Fisherman’s Wharf, San Francisco, CA 94133, USA', 0, 0, 15),
(74, 'Golden Gate Park', '501 Stanyan St, San Francisco, CA 94117, USA', 0, 15, 15),
(75, 'Chinatown', 'Grant Ave, San Francisco, CA 94108, USA', 0, 0, 15);

----------------------------------
-- Europe
----------------------------------

-- Paris (16)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(76, 'Eiffel Tower', 'Champ de Mars, 5 Av. Anatole France, 75007 Paris, France', 18, 30, 16),
(77, 'Louvre Museum', 'Rue de Rivoli, 75001 Paris, France', 17, 25, 16),
(78, 'Notre-Dame Cathedral', '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France', 0, 10, 16),
(79, 'Montmartre & Sacré-Cœur', '35 Rue du Chevalier de la Barre, 75018 Paris, France', 0, 5, 16),
(80, 'Palace of Versailles', 'Place d’Armes, 78000 Versailles, France', 21, 30, 16),

-- Berlin (17)
(81, 'Brandenburg Gate', 'Pariser Platz, 10117 Berlin, Germany', 0, 0, 17),
(82, 'Berlin Wall Memorial', 'Bernauer Str. 111, 13355 Berlin, Germany', 0, 0, 17),
(83, 'Museum Island', 'Bodestraße 1-3, 10178 Berlin, Germany', 15, 25, 17),
(84, 'Reichstag Building', 'Platz der Republik 1, 11011 Berlin, Germany', 0, 0, 17),
(85, 'Checkpoint Charlie Museum', 'Friedrichstraße 43-45, 10117 Berlin, Germany', 12, 17, 17),

-- Rome (18)
(86, 'Colosseum', 'Piazza del Colosseo, 1, 00184 Roma RM, Italy', 16, 25, 18),
(87, 'Trevi Fountain', 'Piazza di Trevi, 00187 Roma RM, Italy', 0, 0, 18),
(88, 'Pantheon', 'Piazza della Rotonda, 00186 Roma RM, Italy', 0, 0, 18),
(89, 'Vatican Museums', 'Viale Vaticano, 00165 Roma RM, Italy', 20, 30, 18),
(90, 'Roman Forum', 'Via della Salara Vecchia, 5/6, 00186 Roma RM, Italy', 16, 25, 18),

-- Amsterdam (19)
(91, 'Rijksmuseum', 'Museumstraat 1, 1071 XX Amsterdam, Netherlands', 22, 25, 19),
(92, 'Anne Frank House', 'Prinsengracht 263-267, 1016 GV Amsterdam, Netherlands', 14, 16, 19),
(93, 'Van Gogh Museum', 'Museumplein 6, 1071 DJ Amsterdam, Netherlands', 19, 22, 19),
(94, 'Dam Square', 'Dam, 1012 JS Amsterdam, Netherlands', 0, 0, 19),
(95, 'Vondelpark', 'Amsterdam, Netherlands', 0, 0, 19),

-- Barcelona (20)
(96, 'Sagrada Família', 'C/ de Mallorca, 401, 08013 Barcelona, Spain', 26, 33, 20),
(97, 'Park Güell', 'Carrer d’Olot, 7, 08024 Barcelona, Spain', 10, 13, 20),
(98, 'La Rambla', 'La Rambla, 08002 Barcelona, Spain', 0, 0, 20),
(99, 'Casa Batlló', 'Passeig de Gràcia, 43, 08007 Barcelona, Spain', 25, 35, 20),
(100, 'Magic Fountain of Montjuïc', 'Pl. de Carles Buïgas, 1, 08038 Barcelona, Spain', 0, 5, 20);

----------------------------------
-- United Kingdom
----------------------------------

-- London (21)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(101, 'The British Museum', 'Great Russell St, London WC1B 3DG, United Kingdom', 0, 0, 21),
(102, 'Tower of London', 'London EC3N 4AB, United Kingdom', 29, 35, 21),
(103, 'Buckingham Palace', 'London SW1A 1AA, United Kingdom', 25, 30, 21),
(104, 'London Eye', 'Riverside Building, County Hall, London SE1 7PB, United Kingdom', 30, 40, 21),
(105, 'Big Ben & Westminster Abbey', '20 Deans Yd, London SW1P 3PA, United Kingdom', 10, 25, 21),

-- Manchester (22)
(106, 'Old Trafford Stadium', 'Sir Matt Busby Way, Old Trafford, Manchester M16 0RA, United Kingdom', 20, 30, 22),
(107, 'Manchester Art Gallery', 'Mosley St, Manchester M2 3JL, United Kingdom', 0, 0, 22),
(108, 'Science and Industry Museum', 'Liverpool Rd, Manchester M3 4FP, United Kingdom', 0, 0, 22),
(109, 'Heaton Park', 'Middleton Rd, Manchester M25 2SW, United Kingdom', 0, 0, 22),
(110, 'Etihad Stadium Tour', 'Ashton New Rd, Manchester M11 3FF, United Kingdom', 20, 30, 22),

-- Edinburgh (23)
(111, 'Edinburgh Castle', 'Castlehill, Edinburgh EH1 2NG, United Kingdom', 18, 25, 23),
(112, 'Arthur’s Seat', 'Queen’s Dr, Edinburgh EH8 8HG, United Kingdom', 0, 0, 23),
(113, 'Royal Mile', 'High St, Edinburgh EH1 1SG, United Kingdom', 0, 0, 23),
(114, 'National Museum of Scotland', 'Chambers St, Edinburgh EH1 1JF, United Kingdom', 0, 0, 23),
(115, 'Palace of Holyroodhouse', 'Canongate, Edinburgh EH8 8DX, United Kingdom', 18, 25, 23),

-- Belfast (24)
(116, 'Titanic Belfast', '1 Olympic Way, Queen’s Rd, Belfast BT3 9EP, United Kingdom', 19, 25, 24),
(117, 'Belfast City Hall', 'Donegall Square N, Belfast BT1 5GS, United Kingdom', 0, 0, 24),
(118, 'Crumlin Road Gaol', '53-55 Crumlin Rd, Belfast BT14 6ST, United Kingdom', 12, 18, 24),
(119, 'Botanic Gardens', 'College Park Ave, Belfast BT7 1LP, United Kingdom', 0, 0, 24),
(120, 'Ulster Museum', 'Botanic Gardens, Belfast BT9 5AB, United Kingdom', 0, 0, 24),

-- Cardiff (25)
(121, 'Cardiff Castle', 'Castle St, Cardiff CF10 3RB, United Kingdom', 15, 20, 25),
(122, 'Principality Stadium', 'Westgate St, Cardiff CF10 1NS, United Kingdom', 18, 30, 25),
(123, 'Cardiff Bay', 'Cardiff CF10 4LY, United Kingdom', 0, 0, 25),
(124, 'National Museum Cardiff', 'Cathays Park, Cardiff CF10 3NP, United Kingdom', 0, 0, 25),
(125, 'Bute Park', 'North Rd, Cardiff CF10 3DX, United Kingdom', 0, 0, 25);

----------------------------------
-- Australia
----------------------------------

-- Sydney (26)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(126, 'Sydney Opera House', 'Bennelong Point, Sydney NSW 2000, Australia', 25, 45, 26),
(127, 'Sydney Harbour Bridge Climb', '3 Cumberland St, The Rocks NSW 2000, Australia', 150, 300, 26),
(128, 'Bondi Beach', 'Queen Elizabeth Dr, Bondi Beach NSW 2026, Australia', 0, 0, 26),
(129, 'Taronga Zoo Sydney', 'Bradleys Head Rd, Mosman NSW 2088, Australia', 45, 60, 26),
(130, 'Darling Harbour', 'Sydney NSW 2000, Australia', 0, 0, 26),

-- Melbourne (27)
(131, 'Royal Botanic Gardens Victoria', 'Birdwood Ave, South Yarra VIC 3141, Australia', 0, 0, 27),
(132, 'Federation Square', 'Swanston St & Flinders St, Melbourne VIC 3000, Australia', 0, 0, 27),
(133, 'Melbourne Zoo', 'Elliott Ave, Parkville VIC 3052, Australia', 30, 40, 27),
(134, 'Eureka Skydeck', '7 Riverside Quay, Southbank VIC 3006, Australia', 25, 35, 27),
(135, 'Queen Victoria Market', 'Queen St, Melbourne VIC 3000, Australia', 0, 0, 27),

-- Brisbane (28)
(136, 'South Bank Parklands', 'Stanley St Plaza, South Brisbane QLD 4101, Australia', 0, 0, 28),
(137, 'Lone Pine Koala Sanctuary', '708 Jesmond Rd, Fig Tree Pocket QLD 4069, Australia', 30, 45, 28),
(138, 'Story Bridge Adventure Climb', '170 Main St, Kangaroo Point QLD 4169, Australia', 130, 160, 28),
(139, 'Brisbane City Botanic Gardens', '147 Alice St, Brisbane City QLD 4000, Australia', 0, 0, 28),
(140, 'Gallery of Modern Art (GOMA)', 'Stanley Pl, South Brisbane QLD 4101, Australia', 0, 0, 28),

-- Perth (29)
(141, 'Kings Park and Botanic Garden', 'Fraser Ave, Perth WA 6005, Australia', 0, 0, 29),
(142, 'Elizabeth Quay', 'The Esplanade, Perth WA 6000, Australia', 0, 0, 29),
(143, 'Perth Zoo', '20 Labouchere Rd, South Perth WA 6151, Australia', 30, 40, 29),
(144, 'Fremantle Prison', '1 The Terrace, Fremantle WA 6160, Australia', 22, 32, 29),
(145, 'Cottesloe Beach', 'Marine Parade, Cottesloe WA 6011, Australia', 0, 0, 29),

-- Adelaide (30)
(146, 'Adelaide Zoo', 'Frome Rd, Adelaide SA 5000, Australia', 35, 45, 30),
(147, 'Adelaide Botanic Garden', 'North Terrace, Adelaide SA 5000, Australia', 0, 0, 30),
(148, 'Glenelg Beach', 'Glenelg SA 5045, Australia', 0, 0, 30),
(149, 'Art Gallery of South Australia', 'North Terrace, Adelaide SA 5000, Australia', 0, 0, 30),
(150, 'Adelaide Oval Stadium Tour', 'War Memorial Dr, North Adelaide SA 5006, Australia', 20, 30, 30);

----------------------------------
-- Canada
----------------------------------

-- Toronto (31)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(151, 'CN Tower', '290 Bremner Blvd, Toronto, ON M5V 3L9, Canada', 45, 60, 31),
(152, 'Royal Ontario Museum', '100 Queens Park, Toronto, ON M5S 2C6, Canada', 25, 35, 31),
(153, 'Ripley’s Aquarium of Canada', '288 Bremner Blvd, Toronto, ON M5V 3L9, Canada', 30, 45, 31),
(154, 'Toronto Islands', 'Toronto Islands, Toronto, ON M5J 2E9, Canada', 0, 10, 31),
(155, 'Casa Loma', '1 Austin Terrace, Toronto, ON M5R 1X8, Canada', 40, 50, 31),

-- Vancouver (32)
(156, 'Stanley Park', 'Vancouver, BC V6G 1Z4, Canada', 0, 0, 32),
(157, 'Capilano Suspension Bridge Park', '3735 Capilano Rd, North Vancouver, BC V7R 4J1, Canada', 55, 65, 32),
(158, 'Granville Island', '1661 Duranleau St, Vancouver, BC V6H 3S3, Canada', 0, 0, 32),
(159, 'Vancouver Aquarium', '845 Avison Way, Vancouver, BC V6G 3E2, Canada', 40, 55, 32),
(160, 'Grouse Mountain', '6400 Nancy Greene Way, North Vancouver, BC V7R 4K9, Canada', 60, 75, 32),

-- Montreal (33)
(161, 'Old Montreal (Vieux-Montréal)', 'Old Montreal, Montreal, QC H2Y 3Y8, Canada', 0, 0, 33),
(162, 'Mont Royal Park', '1260 Remembrance Rd, Montreal, QC H3H 1A2, Canada', 0, 0, 33),
(163, 'Notre-Dame Basilica of Montreal', '110 Notre-Dame St W, Montreal, QC H2Y 1T1, Canada', 10, 15, 33),
(164, 'Biodome de Montreal', '4777 Pierre-De Coubertin Ave, Montreal, QC H1V 1B3, Canada', 25, 35, 33),
(165, 'Montreal Museum of Fine Arts', '1380 Sherbrooke St W, Montreal, QC H3G 1J5, Canada', 0, 25, 33),

-- Ottawa (34)
(166, 'Parliament Hill', 'Wellington St, Ottawa, ON K1A 0A9, Canada', 0, 0, 34),
(167, 'Rideau Canal', 'Ottawa, ON K1S 5B8, Canada', 0, 0, 34),
(168, 'National Gallery of Canada', '380 Sussex Dr, Ottawa, ON K1N 9N4, Canada', 20, 25, 34),
(169, 'Canadian Museum of History', '100 Laurier St, Gatineau, QC K1A 0M8, Canada', 20, 30, 34),
(170, 'ByWard Market', '55 ByWard Market Square, Ottawa, ON K1N 9C3, Canada', 0, 0, 34),

-- Calgary (35)
(171, 'Calgary Tower', '101 9 Ave SW, Calgary, AB T2P 1J9, Canada', 20, 30, 35),
(172, 'Calgary Zoo', '210 St. George’s Dr NE, Calgary, AB T2E 7V6, Canada', 35, 45, 35),
(173, 'Heritage Park Historical Village', '1900 Heritage Dr SW, Calgary, AB T2V 2X3, Canada', 35, 45, 35),
(174, 'Prince’s Island Park', '698 Eau Claire Ave SW, Calgary, AB T2P 5N4, Canada', 0, 0, 35),
(175, 'Glenbow Museum', '130 9 Ave SE, Calgary, AB T2G 0P3, Canada', 10, 20, 35);

----------------------------------
-- Switzerland
----------------------------------

-- Zurich (36)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(176, 'Lake Zurich', 'Lake Zurich, Zurich, Switzerland', 0, 0, 36),
(177, 'Bahnhofstrasse', 'Bahnhofstrasse, 8001 Zürich, Switzerland', 0, 0, 36),
(178, 'Swiss National Museum', 'Museumstrasse 2, 8001 Zürich, Switzerland', 10, 15, 36),
(179, 'Zurich Zoo', 'Zürichbergstrasse 221, 8044 Zürich, Switzerland', 25, 30, 36),
(180, 'Old Town (Altstadt)', 'Niederdorf, 8001 Zürich, Switzerland', 0, 0, 36),

-- Geneva (37)
(181, 'Jet d’Eau', 'Quai Gustave-Ador, 1207 Genève, Switzerland', 0, 0, 37),
(182, 'St Pierre Cathedral', 'Place du Bourg-de-Four 24, 1204 Genève, Switzerland', 0, 10, 37),
(183, 'Palais des Nations', 'Avenue de la Paix 14, 1211 Genève, Switzerland', 15, 20, 37),
(184, 'Patek Philippe Museum', 'Rue des Vieux-Grenadiers 7, 1205 Genève, Switzerland', 10, 15, 37),
(185, 'The Flower Clock', 'Quai du Général-Guisan, 1204 Genève, Switzerland', 0, 0, 37),

-- Basel (38)
(186, 'Basel Minster', 'Rittergasse 3, 4051 Basel, Switzerland', 0, 10, 38),
(187, 'Kunstmuseum Basel', 'St. Alban-Graben 16, 4051 Basel, Switzerland', 20, 25, 38),
(188, 'Tinguely Museum', 'Paul Sacher-Anlage 2, 4002 Basel, Switzerland', 15, 20, 38),
(189, 'Basel Zoo', 'Binningerstrasse 40, 4054 Basel, Switzerland', 20, 25, 38),
(190, 'Old Town Basel', 'Marktplatz, 4001 Basel, Switzerland', 0, 0, 38),

-- Bern (39)
(191, 'Zytglogge', 'Bim Zytglogge 3, 3011 Bern, Switzerland', 10, 15, 39),
(192, 'Bear Park', 'Grosser Muristalden, 3006 Bern, Switzerland', 0, 0, 39),
(193, 'Bern Historical Museum', 'Helvetiaplatz 5, 3005 Bern, Switzerland', 15, 20, 39),
(194, 'Federal Palace of Switzerland', 'Bundesplatz 3, 3005 Bern, Switzerland', 0, 0, 39),
(195, 'Rosengarten', 'Alter Aargauerstalden 31, 3006 Bern, Switzerland', 0, 0, 39),

-- Lausanne (40)
(196, 'Olympic Museum', 'Quai d’Ouchy 1, 1006 Lausanne, Switzerland', 20, 25, 40),
(197, 'Lausanne Cathedral', 'Place de la Cathédrale, 1005 Lausanne, Switzerland', 0, 10, 40),
(198, 'Ouchy Promenade', 'Quai d’Ouchy, 1006 Lausanne, Switzerland', 0, 0, 40),
(199, 'Collection de l’Art Brut', 'Avenue des Bergières 11, 1004 Lausanne, Switzerland', 10, 15, 40),
(200, 'Esplanade de Montbenon', 'Allée Ernest-Ansermet 3, 1003 Lausanne, Switzerland', 0, 0, 40);

----------------------------------
-- China
----------------------------------

-- Beijing (41)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(201, 'The Forbidden City', '4 Jingshan Front St, Dongcheng, Beijing, China', 60, 80, 41),
(202, 'Temple of Heaven', '1 Tiantan E Rd, Dongcheng, Beijing, China', 30, 50, 41),
(203, 'The Great Wall (Mutianyu)', 'Mutianyu Rd, Huairou District, Beijing, China', 40, 60, 41),
(204, 'Summer Palace', '19 Xinjiangongmen Rd, Haidian, Beijing, China', 30, 50, 41),
(205, 'Tiananmen Square', 'Dongcheng District, Beijing, China', 0, 0, 41),

-- Shanghai (42)
(206, 'The Bund', 'Zhongshan East 1st Rd, Huangpu, Shanghai, China', 0, 0, 42),
(207, 'Yu Garden', '218 Anren St, Huangpu, Shanghai, China', 40, 60, 42),
(208, 'Shanghai Tower', '501 Yincheng Middle Rd, Pudong, Shanghai, China', 120, 180, 42),
(209, 'Nanjing Road', 'Nanjing Rd, Huangpu, Shanghai, China', 0, 0, 42),
(210, 'Shanghai Museum', '201 Renmin Ave, Huangpu, Shanghai, China', 0, 0, 42),

-- Guangzhou (43)
(211, 'Canton Tower', '222 Yuejiang W Rd, Haizhu, Guangzhou, China', 150, 200, 43),
(212, 'Chen Clan Ancestral Hall', '34 Enlong Li, Zhongshan 7th Rd, Guangzhou, China', 10, 20, 43),
(213, 'Shamian Island', 'Shamian St, Liwan, Guangzhou, China', 0, 0, 43),
(214, 'Baiyun Mountain', 'Baiyun Ave S, Baiyun District, Guangzhou, China', 5, 10, 43),
(215, 'Guangzhou Museum', 'Yuexiu Park, Jiefang North Rd, Guangzhou, China', 0, 20, 43),

-- Shenzhen (44)
(216, 'Window of the World', '9037 Shennan Ave, Nanshan, Shenzhen, China', 160, 220, 44),
(217, 'OCT Harbour', '8 Baishi Rd, Nanshan, Shenzhen, China', 0, 0, 44),
(218, 'Splendid China Folk Village', 'Overseas Chinese Town, Nanshan, Shenzhen, China', 150, 200, 44),
(219, 'Shenzhen Museum', '1008 Shennan East Rd, Luohu, Shenzhen, China', 0, 0, 44),
(220, 'Lianhuashan Park', 'Hongli Rd, Futian District, Shenzhen, China', 0, 0, 44),

-- Chengdu (45)
(221, 'Chengdu Research Base of Giant Panda Breeding', '1375 Panda Rd, Chenghua, Chengdu, China', 60, 100, 45),
(222, 'Wuhou Shrine', '231 Wuhou Temple St, Wuhou, Chengdu, China', 50, 80, 45),
(223, 'Jinli Ancient Street', '231 Wuhou Temple St, Wuhou, Chengdu, China', 0, 0, 45),
(224, 'People’s Park', 'Shaocheng Rd, Qingyang District, Chengdu, China', 0, 0, 45),
(225, 'Du Fu Thatched Cottage', '37 Qinghua Rd, Qingyang District, Chengdu, China', 30, 60, 45);

----------------------------------
-- Brazil
----------------------------------

-- Rio de Janeiro (46)
INSERT INTO attraction (attr_id, attr_name, attr_address, attr_min_price, attr_max_price, dest_id) VALUES
(226, 'Christ the Redeemer', 'Parque Nacional da Tijuca, Alto da Boa Vista, Rio de Janeiro - RJ, Brazil', 65, 100, 46),
(227, 'Sugarloaf Mountain', 'Av. Pasteur, 520 - Urca, Rio de Janeiro - RJ, Brazil', 120, 160, 46),
(228, 'Copacabana Beach', 'Av. Atlântica, Copacabana, Rio de Janeiro - RJ, Brazil', 0, 0, 46),
(229, 'Maracanã Stadium', 'Av. Presidente Castelo Branco, Maracanã, Rio de Janeiro - RJ, Brazil', 50, 100, 46),
(230, 'Tijuca National Park', 'Estr. da Cascatinha, 850 - Alto da Boa Vista, Rio de Janeiro - RJ, Brazil', 0, 20, 46),

-- São Paulo (47)
(231, 'Ibirapuera Park', 'Av. Pedro Álvares Cabral - Vila Mariana, São Paulo - SP, Brazil', 0, 0, 47),
(232, 'São Paulo Museum of Art (MASP)', 'Av. Paulista, 1578 - Bela Vista, São Paulo - SP, Brazil', 50, 70, 47),
(233, 'Municipal Market of São Paulo', 'R. Cantareira, 306 - Centro Histórico, São Paulo - SP, Brazil', 0, 0, 47),
(234, 'Liberdade District', 'Liberdade, São Paulo - SP, Brazil', 0, 0, 47),
(235, 'Pinacoteca do Estado de São Paulo', 'Praça da Luz, 2 - Luz, São Paulo - SP, Brazil', 20, 40, 47),

-- Brasília (48)
(236, 'Cathedral of Brasília', 'Esplanada dos Ministérios - Brasília, DF, Brazil', 0, 0, 48),
(237, 'National Congress of Brazil', 'Praça dos Três Poderes, Brasília - DF, Brazil', 0, 0, 48),
(238, 'Juscelino Kubitschek Bridge', 'DF-002 - Lago Sul, Brasília - DF, Brazil', 0, 0, 48),
(239, 'Itamaraty Palace', 'Esplanada dos Ministérios, Brasília - DF, Brazil', 0, 0, 48),
(240, 'Parque da Cidade Sarah Kubitschek', 'SRES Área Especial, Asa Sul, Brasília - DF, Brazil', 0, 0, 48),

-- Salvador (49)
(241, 'Pelourinho', 'Centro Histórico, Salvador - BA, Brazil', 0, 0, 49),
(242, 'Elevador Lacerda', 'Praça Tomé de Souza, Comércio, Salvador - BA, Brazil', 5, 10, 49),
(243, 'Church of São Francisco', 'Largo do Cruzeiro de São Francisco, Pelourinho, Salvador - BA, Brazil', 10, 20, 49),
(244, 'Porto da Barra Beach', 'Av. Sete de Setembro, Barra, Salvador - BA, Brazil', 0, 0, 49),
(245, 'Mercado Modelo', 'Praça Visc. de Cayru, Comércio, Salvador - BA, Brazil', 0, 0, 49),

-- Curitiba (50)
(246, 'Oscar Niemeyer Museum', 'R. Mal. Hermes, 999 - Centro Cívico, Curitiba - PR, Brazil', 30, 40, 50),
(247, 'Botanical Garden of Curitiba', 'R. Eng. Ostoja Roguski - Jardim Botânico, Curitiba - PR, Brazil', 0, 10, 50),
(248, 'Wire Opera House', 'R. João Gava, 920 - Abranches, Curitiba - PR, Brazil', 15, 25, 50),
(249, 'Tanguá Park', 'R. Oswaldo Maciel, 97 - Taboão, Curitiba - PR, Brazil', 0, 0, 50),
(250, 'Largo da Ordem', 'Centro Histórico, Curitiba - PR, Brazil', 0, 0, 50);


