INSERT INTO currency VALUES 
(1, 'South African Rand', 'ZAR'),
(2, 'Japanese Yen', 'JPY'),
(3, 'US Dollar', 'USD');

INSERT INTO exchange_rate VALUES
-- South Africa Rand (1)
(1, 2, 7.89),
(1, 3, 0.055),
-- Japanese Yen (2)
(2, 1, 0.127),
(2, 3, 0.0070),
-- US Dollar (3)
(3, 1, 18.20),
(3, 2, 150.25);

INSERT INTO country VALUES
(1, 'South Africa', 1),
(2, 'Japan', 2),
(3, 'United States', 3);

----------------------------------
-- destinations
----------------------------------
-- South Africa (1)
insert into destination VALUES
(1, 'Cape Town', 'South Africa', 4.9, 'Famous for Table Mountain, Cape Point, and beautiful beaches.', 1, '/src/assets/Cape Town.jpg'),
(2, 'Kruger National Park', 'South Africa', 4.8, 'Renowned wildlife reserve offering Big Five safaris.', 1, '/src/assets/Kruger National Park.jpg'),
(3, 'Garden Route', 'South Africa', 4.7, 'Scenic coastal area with forests, lakes, and charming towns.', 1, '/src/assets/Garden Route.jpg'),
(4, 'Durban', 'South Africa', 4.6, 'Coastal area known for golden beaches and Indian Ocean views.', 1, '/src/assets/Durban.jpg'),
(5, 'Johannesburg', 'South Africa', 4.5, 'Vibrant urban area rich in culture and history.', 1, '/src/assets/Johannesburg.jpg'),

-- Japan (2)
(6, 'Tokyo', 'Japan', 4.9, 'Capital area blending modern technology and traditional shrines.', 2, '/src/assets/Tokyo.jpg'),
(7, 'Kyoto', 'Japan', 4.9, 'Historic area known for temples, gardens, and geisha districts.', 2, '/src/assets/Cape Town.jpg'),
(8, 'Osaka', 'Japan', 4.8, 'Food capital area famous for nightlife and Osaka Castle.', 2, '/src/assets/Kyoto.jpg'),
(9, 'Hokkaido', 'Japan', 4.7, 'Northern island area known for ski resorts and natural beauty.', 2, '/src/assets/Hokkaido.jpg'),
(10, 'Okinawa', 'Japan', 4.6, 'Island area with tropical beaches and unique culture.', 2, '/src/assets/Okinawa.jpg'),

-- United States (3)
(11, 'New York City', 'United States', 4.9, 'Iconic metropolitan area known for Times Square and Central Park.', 3, '/src/assets/New York City.jpg'),
(12, 'Los Angeles', 'United States', 4.8, 'Coastal area known for Hollywood and Venice Beach.', 3, '/src/assets/Los Angeles.jpg'),
(13, 'Las Vegas', 'United States', 4.7, 'Desert entertainment area famous for casinos and nightlife.', 3, '/src/assets/Las Vegas.jpg'),
(14, 'San Francisco', 'United States', 4.8, 'Bay area known for the Golden Gate Bridge and steep streets.', 3, '/src/assets/San Francisco.jpg'),
(15, 'Miami', 'United States', 4.7, 'Beach area known for vibrant nightlife and art deco district.', 3, '/src/assets/Miami.jpg');

INSERT INTO transportation_type VALUES
(1, 'Airplane'),
(2, 'Train'),
(3, 'Bus'),
(4, 'Taxi'),
(5, 'Scooter'),
(6, 'Boat'),
(7, 'Ferry');

----------------------------------
-- transportations
----------------------------------

insert into transportation VALUES
-- Cape Town (1)
(1, 'Cape Town International Flight', 250.00, 1, 200, 4.8, 1, 1, '/src/assets/Cape Town International Flight.jpg'),
(2, 'Cape Town Metro Train', 15.00, 1, 100, 4.3, 2, 1, '/src/assets/Cape Town Metro Train.jpg'),
(3, 'City Sightseeing Bus', 25.00, 1, 50, 4.6, 3, 1, '/src/assets/City Sightseeing Bus.jpg'),
(4, 'Local Taxi Service', 10.00, 1, 4, 4.2, 4, 1, '/src/assets/Local Taxi Service.jpg'),
(5, 'Harbor Boat Cruise', 40.00, 1, 20, 4.7, 6, 1, '/src/assets/Harbor Boat Cruise.jpg'),

-- Kruger National Park (2)
(6, 'Safari Charter Flight', 180.00, 1, 30, 4.8, 1, 2, '/src/assets/Safari Charter Flight.jpg'),
(7, 'Tourist Shuttle Bus', 35.00, 4, 40, 4.6, 3, 2, '/src/assets/Tourist Shuttle Bus.jpg'),
(8, '4x4 Safari Taxi', 50.00, 2, 6, 4.9, 4, 2, '/src/assets/4x4 Safari Taxi.jpg'),
(9, 'Park Safari Train', 20.00, 2, 60, 4.4, 2, 2, '/src/assets/Park Safari Train.jpg'),
(10, 'River Boat Safari', 45.00, 2, 15, 4.7, 6, 2, '/src/assets/River Boat Safari.jpg'),

-- Garden Route (3)
(11, 'Regional Air Shuttle', 120.00, 1, 50, 4.7, 1, 3, '/src/assets/Regional Air Shuttle.jpg'),
(12, 'Garden Route Express Train', 30.00, 1, 100, 4.5, 2, 3, '/src/assets/Garden Route Express Train.jpg'),
(13, 'Coastal Tour Bus', 25.00, 4, 50, 4.6, 3, 3, '/src/assets/Coastal Tour Bus.jpg'),
(14, 'Private Taxi Tour', 60.00, 1, 4, 4.4, 4, 3, '/src/assets/Private Taxi Tour.jpg'),
(15, 'Lagoon Ferry Ride', 20.00, 1, 30, 4.5, 7, 3, '/src/assets/Lagoon Ferry Ride.jpg'),

-- Durban (4)
(16, 'Domestic Flight to Durban', 150.00, 1, 150, 4.7, 1, 4, '/src/assets/Domestic Flight to Durban.jpg'),
(17, 'Durban Coastal Train', 25.00, 1, 80, 4.4, 2, 4, '/src/assets/Durban Coastal Train.jpg'),
(18, 'City Sightseeing Bus', 20.00, 1, 40, 4.5, 3, 4, '/src/assets/City Sightseeing Bus Durban.jpg'),
(19, 'Beachfront Scooter Rental', 15.00, 1, 2, 4.3, 5, 4, '/src/assets/Beachfront Scooter Rental.jpg'),
(20, 'Harbor Ferry Cruise', 30.00, 1, 25, 4.6, 7, 4, '/src/assets/Harbor Ferry Cruise.jpg'),

-- Johannesburg (5)
(21, 'International Flight to OR Tambo', 300.00, 1, 250, 4.8, 1, 5, '/src/assets/International Flight to OR Tambo.jpg'),
(22, 'Gautrain Express', 18.00, 1, 200, 4.7, 2, 5, '/src/assets/Gautrain Express.jpg'),
(23, 'City Hop-on Bus', 25.00, 1, 60, 4.5, 3, 5, '/src/assets/City Hop-on Bus.jpg'),
(24, 'Downtown Taxi Service', 12.00, 1, 4, 4.2, 4, 5, '/src/assets/Downtown Taxi Service.jpg'),
(25, 'Soweto Cultural Tour Bus', 35.00, 4, 40, 4.6, 3, 5, '/src/assets/Soweto Cultural Tour Bus.jpg');

-- Tokyo (6)
insert into transportation VALUES
(26, 'Tokyo International Flight', 2390.17, 1, 200, 4.9, 1, 6, '/src/assets/Tokyo International Flight.jpg'),
(27, 'Tokyo Metro Train', 3.00, 1, 4282.45, 4.8, 2, 6, '/src/assets/Tokyo Metro Train.png'),
(28, 'Airport Limousine Bus', 128.47, 1, 40, 4.6, 3, 6, '/src/assets/Airport Limousine Bus.jpg'),
(29, 'City Taxi Service', 102.78, 1, 4, 4.5, 4, 6 , '/src/assets/City Taxi Service.jpg'),
(30, 'Tokyo Bay Ferry', 85.65, 1, 100, 4.7, 7, 6 , '/src/assets/Tokyo Bay Ferry.jpg'),

-- Kyoto (7)
(31, 'Shinkansen Bullet Train', 856.49, 1, 300, 4.9, 2, 7, '/src/assets/Shinkansen Bullet Train.jpg'),
(32, 'Local Sightseeing Bus', 42.82, 1, 50, 4.6, 3, 7, '/src/assets/Local Sightseeing Bus Kyoto.jpg'),
(33, 'Traditional Rickshaw Taxi', 171.30, 1, 2, 4.8, 4, 7, '/src/assets/Traditional Rickshaw Taxi.jpg'),
(34, 'Scooter Rental', 128.47, 1, 2, 4.4, 5, 7, '/src/assets/Scooter Rental Kyoto.jpg'),
(35, 'Private Charter Van', 513.89, 2, 8, 4.7, 4, 7, '/src/assets/Private Charter Van Kyoto.jpg'),

-- Osaka (8)
(36, 'Domestic Flight to Osaka', 1383.78, 1, 180, 4.7, 1, 8, '/src/assets/Domestic Flight to Osaka.jpg'),
(37, 'Osaka Metro Train', 21.62, 1, 300, 4.8, 2, 8, '/src/assets/Osaka Metro Train.jpg'),
(38, 'City Loop Bus', 51.89, 1, 40, 4.6, 3, 8, '/src/assets/City Loop Bus Osaka.jpg'),
(39, 'Downtown Taxi Ride', 86.49, 1, 4, 4.4, 4, 8, '/src/assets/Downtown Taxi Ride Osaka.jpg'),
(40, 'Harbor Boat Cruise', 216.22, 1, 50, 4.7, 6, 8, '/src/assets/Harbor Boat Cruise Osaka.jpg'),

-- Hokkaido (9)
(41, 'Domestic Flight to Sapporo', 1729.72, 1, 150, 4.8, 1, 9, '/src/assets/Domestic Flight to Sapporo Hokkaido.jpg'),
(42, 'Hokkaido Scenic Train', 345.94, 1, 120, 4.6, 2, 9, '/src/assets/Hokkaido Scenic Train.jpg'),
(43, 'Snow Resort Shuttle Bus', 259.46, 4, 40, 4.7, 3, 9, '/src/assets/Snow Resort Shuttle Bus Hokkaido.jpg'),
(44, 'Mountain Taxi Service', 216.22, 1, 4, 4.5, 4, 9, '/src/assets/Mountain Taxi Service Hokkaido.jpg'),
(45, 'Lake Cruise Boat', 302.70, 1, 25, 4.8, 6, 9, '/src/assets/Lake Cruise Boat Hokkaido.jpg'),

-- Okinawa (10)
(46, 'Okinawa Island Flight', 1556.75, 1, 100, 4.8, 1, 10, '/src/assets/Okinawa Island Flight.jpg'),
(47, 'Local Bus Service', 34.59, 1, 40, 4.5, 3, 10, '/src/assets/Local Bus Service Okinawa.jpg'),
(48, 'Scooter Rental', 172.97, 1, 2, 4.6, 5, 10, '/src/assets/Scooter Rental Okinawa.jpg'),
(49, 'Taxi Tour Service', 302.70, 1, 4, 4.7, 4, 10, '/src/assets/Taxi Tour Service Okinawa.jpg'),
(50, 'Island Ferry', 129.73, 1, 80, 4.8, 7, 10, '/src/assets/Island Ferry Okinawa.jpg');

-- New York City (11)
insert into transportation VALUES
(51, 'JFK International Flight', 18.32, 1, 250, 4.9, 1, 11, '/src/assets/JFK International Flight.jpg'),
(52, 'NYC Subway Train', 0.17, 1, 500, 4.7, 2, 11, '/src/assets/NYC Subway Train.jpg'),
(53, 'City Tour Bus', 1.43, 1, 60, 4.6, 3, 11, '/src/assets/City Tour Bus New york.jpg'),
(54, 'Yellow Taxi', 0.86, 1, 4, 4.5, 4, 11, '/src/assets/Yellow Taxi New york.jpg'),
(55, 'Staten Island Ferry', 0.29, 1, 200, 4.8, 7, 11, '/src/assets/Staten Island Ferry New york.jpg'),

-- Los Angeles (12)
(56, 'LAX Domestic Flight', 16.01, 1, 220, 4.8, 1, 12, '/src/assets/LAX Domestic Flight.jpg'),
(57, 'Metro Rail Train', 0.14, 1, 300, 4.5, 2, 12, '/src/assets/Metro Rail Train LA.jpg'),
(58, 'Hop-On Hop-Off Bus', 1.72, 1, 50, 4.6, 3, 12, '/src/assets/Hop-On Hop-Off Bus LA.jpg'),
(59, 'City Taxi Service', 1.03, 1, 4, 4.4, 4, 12, '/src/assets/City Taxi Service LA.jpg'),
(60, 'Scooter Rental', 0.69, 1, 1, 4.3, 5, 12, '/src/assets/Scooter Rental LA.jpg'),

-- Las Vegas (13)
(61, 'McCarran Airport Flight', 14.30, 1, 180, 4.8, 1, 13, '/src/assets/McCarran Airport Flight.jpg'),
(62, 'Las Vegas Monorail', 0.34, 1, 150, 4.7, 2, 13, '/src/assets/Las Vegas Monorail.jpg'),
(63, 'Vegas Tour Bus', 1.14, 1, 40, 4.6, 3, 13, '/src/assets/Vegas Tour Bus.jpg'),
(64, 'Casino District Taxi', 0.80, 1, 4, 4.5, 4, 13, '/src/assets/Casino District Taxi.jpg'),
(65, 'Hoover Dam Ferry Ride', 2.29, 1, 60, 4.7, 7, 13, '/src/assets/Hoover Dam Ferry Ride.jpg'),

-- San Francisco (14)
(66, 'SFO Domestic Flight', 17.16, 1, 200, 4.8, 1, 14, '/src/assets/SFO Domestic Flight.jpg'),
(67, 'BART Train', 0.29, 1, 250, 4.6, 2, 14, '/src/assets/BART Train.jpg'),
(68, 'City Cable Car Bus', 0.57, 1, 30, 4.9, 3, 14, '/src/assets/City Cable Car Bus San francisco.jpg'),
(69, 'Downtown Taxi', 0.91, 1, 4, 4.5, 4, 14, '/src/assets/Downtown Taxi San francisco.jpg'),
(70, 'Bay Ferry Service', 0.69, 1, 100, 4.7, 7, 14, '/src/assets/Bay Ferry Service.png'),

-- Miami (15)
(71, 'Miami International Flight', 17.73, 1, 220, 4.8, 1, 15, '/src/assets/Miami International Flight.jpg'),
(72, 'Miami Metro Rail', 0.17, 1, 300, 4.5, 2, 15, '/src/assets/Miami Metro Rail.png'),
(73, 'Beach Shuttle Bus', 0.46, 1, 40, 4.6, 3, 15, '/src/assets/Beach Shuttle Bus Miami.jpg'),
(74, 'City Taxi Ride', 0.80, 1, 4, 4.4, 4, 15, '/src/assets/City Taxi Ride Miani.jpg'),
(75, 'Biscayne Bay Boat Tour', 1.43, 1, 50, 4.7, 6, 15, '/src/assets/Biscayne Bay Boat Tour.jpg');


INSERT INTO accomodation_type VALUES
(1, 'Hotel'),
(2, 'Apartment'),
(3, 'Bed and Breakfast'),
(4, 'Hostel'),
(5, 'Resort');

----------------------------------
-- accommodations
----------------------------------

-- Cape Town (1)
insert into accommodation VALUES
(1, 'Table Bay Hotel', '1 Dock Road, V&A Waterfront, Cape Town', 4.9, 180.00, 1, 4, 'Free WiFi, Pool, Spa, Ocean View, Restaurant', 1, 1, 1, '/src/assets/Table Bay Hotel Cape Town.jpg'),
(2, 'The Backpack Cape Town', '74 New Church St, Gardens, Cape Town', 4.5, 35.00, 1, 6, 'Free WiFi, Shared Kitchen, Bar, Pool', 4, 1, 4, '/src/assets/The Backpack Cape Town.jpg'),
(3, 'Seaside Apartments', 'Beach Rd, Sea Point, Cape Town', 4.7, 120.00, 2, 6, 'Kitchen, Balcony, Sea View, Free Parking', 2, 1, 2, '/src/assets/Seaside Apartments Cape Town.jpg'),
(4, 'Cape Grace Hotel', 'West Quay Rd, V&A Waterfront, Cape Town', 4.8, 250.00, 1, 3, 'Spa, Gym, Restaurant, Waterfront View', 1, 1, 1, '/src/assets/Cape Grace Hotel.jpg'),
(5, 'Atlantic Breeze B&B', '9 Lisman Place, Sunset Beach, Cape Town', 4.6, 75.00, 1, 2, 'Breakfast, Garden, WiFi, Parking', 3, 1, 3, '/src/assets/Atlantic Breeze B&B.jpg'),

-- Kruger National Park (2)
(6, 'Kruger Safari Lodge', 'Hazyview Rd, Kruger National Park', 4.9, 200.00, 2, 6, 'Safari Tours, Pool, Restaurant, Air Conditioning', 5, 2, 5, '/src/assets/Kruger Safari Lodge.jpg'),
(7, 'Elephant Plains Camp', 'Sabi Sand Reserve, Kruger National Park', 4.8, 180.00, 2, 4, 'Game Drives, WiFi, Pool, Meals Included', 5, 2, 5, '/src/assets/Elephant Plains Camp.jpg'),
(8, 'Bushveld Backpackers', 'Crocodile Bridge Gate, Kruger', 4.3, 40.00, 1, 6, 'Shared Kitchen, BBQ Area, Outdoor Pool', 4, 2, 4, '/src/assets/Bushveld Backpackers.jpg'),
(9, 'Safari View B&B', 'Phabeni Gate, Kruger National Park', 4.6, 90.00, 1, 3, 'Breakfast, Aircon, Wildlife View, Free Parking', 3, 2, 3, '/src/assets/Safari View B&B.jpg'),
(10, 'Kruger Park Hotel', 'Paul Kruger Gate Rd, Skukuza', 4.7, 150.00, 1, 4, 'Restaurant, Pool, Bar, Safari Access', 1, 2, 1, '/src/assets/Kruger Park Hotel.jpg'),

-- Garden Route (3)
(11, 'The Turbine Boutique Hotel', 'Thesen Island, Knysna', 4.8, 170.00, 1, 3, 'Spa, Pool, Marina View, Restaurant', 1, 3, 1, '/src/assets/The Turbine Boutique Hotel.jpg'),
(12, 'Knysna Backpackers', '42 Queen St, Knysna', 4.4, 30.00, 1, 6, 'Free WiFi, Shared Lounge, BBQ, Garden', 4, 3, 4, '/src/assets/Knysna Backpackers.jpg'),
(13, 'Forest Edge Cottages', 'Rheenendal Rd, Knysna', 4.7, 100.00, 2, 5, 'Kitchen, Fireplace, Garden, Hiking Trails', 2, 3, 2, '/src/assets/Forest Edge Cottages.jpg'),
(14, 'Plettenberg Bay Resort', 'Beachfront Dr, Plettenberg Bay', 4.9, 220.00, 1, 4, 'Beach Access, Pool, Spa, Restaurant', 5, 3, 5, '/src/assets/Plettenberg Bay Resort.jpg'),
(15, 'Wilderness B&B', 'Waterside Rd, Wilderness', 4.5, 80.00, 1, 2, 'Breakfast, Free WiFi, Lake View, Parking', 3, 3, 3, '/src/assets/Wilderness B&B.jpg'),

-- Durban (4)
(16, 'The Oyster Box', '2 Lighthouse Rd, Umhlanga Rocks, Durban', 4.9, 240.00, 1, 3, 'Pool, Spa, Ocean View, Breakfast', 1, 4, 1, '/src/assets/The Oyster Box.jpg'),
(17, 'Durban Beach Hostel', '35 Gillespie St, South Beach, Durban', 4.3, 25.00, 1, 8, 'Free WiFi, Shared Kitchen, Lounge', 4, 4, 4, '/src/assets/Durban Beach Hostel.jpg'),
(18, 'Blue Waters Hotel', '175 Snell Parade, North Beach, Durban', 4.6, 150.00, 1, 4, 'Pool, Sea View, Restaurant, Bar', 1, 4, 1, '/src/assets/Blue Waters Hotel.jpg'),
(19, 'Beachfront Apartments', 'O.R. Tambo Parade, Durban', 4.5, 110.00, 2, 6, 'Kitchen, Balcony, Ocean View', 2, 4, 2, '/src/assets/Beachfront Apartments Durban.jpg'),
(20, 'Umhlanga B&B Retreat', '23 Ridge Rd, Umhlanga, Durban', 4.7, 90.00, 1, 2, 'Breakfast, Pool, Garden, Free WiFi', 3, 4, 3, '/src/assets/Umhlanga B&B Retreat.jpg'),

-- Johannesburg (5)
(21, 'Sandton Sun Hotel', 'Corner Fifth & Alice Lane, Sandton, Johannesburg', 4.8, 180.00, 1, 4, 'Spa, Pool, Restaurant, Gym', 1, 5, 1, '/src/assets/Sandton Sun Hotel.jpg'),
(22, 'Curiocity Hostel', '302 Fox St, Maboneng, Johannesburg', 4.4, 28.00, 1, 6, 'Shared Lounge, Bar, WiFi, Tours', 4, 5, 4, '/src/assets/Curiocity Hostel.jpg'),
(23, 'Rosebank Apartments', 'Oxford Rd, Rosebank, Johannesburg', 4.6, 120.00, 2, 5, 'Kitchen, Balcony, City View, WiFi', 2, 5, 2, '/src/assets/Rosebank Apartments.jpg'),
(24, 'Melville B&B', '7th Street, Melville, Johannesburg', 4.5, 75.00, 1, 3, 'Breakfast, Garden, Free WiFi, Parking', 3, 5, 3, '/src/assets/Melville B&B.jpg'),
(25, 'Montecasino Resort', 'Montecasino Blvd, Fourways, Johannesburg', 4.8, 220.00, 1, 5, 'Casino, Pool, Spa, Entertainment', 5, 5, 5, '/src/assets/Montecasino Resort.jpg');

-- Tokyo (6)
insert into accommodation VALUES
(26, 'The Imperial Hotel Tokyo', '1-1-1 Uchisaiwaicho, Chiyoda-ku, Tokyo', 4.9, 1989.18, 1, 3, 'Spa, Pool, Restaurant, City View, Free WiFi', 1, 6, 1, '/src/assets/The Imperial Hotel Tokyo.jpg'),
(27, 'Shinjuku City Apartments', '3-12-2 Shinjuku, Tokyo', 4.6, 1037.83, 2, 5, 'Kitchen, Air Conditioning, WiFi, Balcony', 2, 6, 2, '/src/assets/Shinjuku City Apartments.jpg'),
(28, 'Tokyo Central Hostel', '2-8-4 Nihonbashi, Chuo-ku, Tokyo', 4.4, 302.70, 1, 8, 'Shared Kitchen, Lounge, Lockers, WiFi', 4, 6, 4, '/src/assets/Tokyo Central Hostel.jpg'),
(29, 'Asakusa Riverside B&B', '1-6-2 Asakusa, Taito-ku, Tokyo', 4.5, 735.13, 1, 2, 'Breakfast, WiFi, River View, Parking', 3, 6, 3, '/src/assets/Asakusa Riverside B&B.jpg'),
(30, 'Tokyo Bay Resort', '1-9 Maihama, Urayasu, Tokyo', 4.8, 2162.15, 1, 4, 'Spa, Pool, Theme Park Access, Restaurant', 5, 6, 5, '/src/assets/Tokyo Bay Resort.jpg'),

-- Kyoto (7)
(31, 'Kyoto Hotel Okura', 'Kawaramachi-Oike, Nakagyo-ku, Kyoto', 4.8, 1729.72, 1, 3, 'Restaurant, Spa, River View, Free WiFi', 1, 7, 1, '/src/assets/Kyoto Hotel Okura.jpg'),
(32, 'Gion Apartments', 'Higashiyama-ku, Kyoto', 4.6, 1124.32, 2, 5, 'Kitchen, Traditional Decor, WiFi, Balcony', 2, 7, 2, '/src/assets/Gion Apartments.jpg'),
(33, 'Kyoto Zen Hostel', 'Nishinokyo Enmachi, Nakagyo-ku, Kyoto', 4.4, 259.46, 1, 6, 'Shared Lounge, WiFi, Laundry, Lockers', 4, 7, 4, '/src/assets/Kyoto Zen Hostel.jpg'),
(34, 'Sakura B&B', 'Fushimi Inari, Kyoto', 4.7, 691.89, 1, 2, 'Breakfast, Garden, Tea Service, WiFi', 3, 7, 3, '/src/assets/Sakura B&B.jpg'),
(35, 'Arashiyama Resort & Spa', 'Arashiyama, Ukyo-ku, Kyoto', 4.9, 2248.64, 1, 4, 'Onsen, River View, Spa, Restaurant', 5, 7, 5, '/src/assets/Arashiyama Resort & Spa.jpg'),

-- Osaka (8)
(36, 'Osaka Marriott Miyako Hotel', '1-1-43 Abenosuji, Abeno-ku, Osaka', 4.9, 1902.69, 1, 3, 'Sky Lounge, Pool, Gym, City View', 1, 8, 1, '/src/assets/Osaka Marriott Miyako Hotel.jpg'),
(37, 'Namba Apartments', '2-5-7 Namba, Chuo-ku, Osaka', 4.6, 951.35, 2, 6, 'Kitchen, Air Conditioning, Free WiFi', 2, 8, 2, '/src/assets/Namba Apartments.jpg'),
(38, 'Osaka Backpackers Hostel', '1-2-8 Nanbanaka, Osaka', 4.3, 216.22, 1, 8, 'Shared Kitchen, Lounge, Laundry, WiFi', 4, 8, 4, '/src/assets/Osaka Backpackers Hostel.jpg'),
(39, 'Dotonbori B&B', '1-10-3 Dotonbori, Osaka', 4.5, 735.13, 1, 2, 'Breakfast, City View, Free WiFi, Parking', 3, 8, 3, '/src/assets/Dotonbori B&B.jpg'),
(40, 'Universal Bay Resort', '1-1-111 Sakurajima, Konohana-ku, Osaka', 4.8, 2075.66, 1, 4, 'Pool, Spa, Theme Park Access, Restaurant', 5, 8, 5, '/src/assets/Universal Bay Resort.jpg'),

-- Hokkaido (9)
(41, 'Sapporo Grand Hotel', '1 Chome Kita 1 Jonishi, Chuo-ku, Sapporo', 4.8, 1643.23, 1, 4, 'Restaurant, Onsen, Gym, Free WiFi', 1, 9, 1, '/src/assets/Sapporo Grand Hotel.jpg'),
(42, 'Hokkaido Lake Apartments', 'Lake Toya, Abuta District', 4.6, 1037.83, 2, 5, 'Kitchen, Fireplace, Lake View, WiFi', 2, 9, 2, '/src/assets/Hokkaido Lake Apartments.jpg'),
(43, 'Snowy Peaks Hostel', '2-3-4 Odori, Sapporo', 4.4, 259.46, 1, 8, 'Shared Lounge, WiFi, Breakfast, Lockers', 4, 9, 4, '/src/assets/Snowy Peaks Hostel.jpg'),
(44, 'Northern Lights B&B', 'Biei, Kamikawa District', 4.5, 605.40, 1, 3, 'Breakfast, Garden, Scenic View, Parking', 3, 9, 3, '/src/assets/Northern Lights B&B.jpg'),
(45, 'Niseko Alpine Resort', 'Niseko, Abuta District', 4.9, 2248.64, 1, 4, 'Ski Access, Onsen, Spa, Restaurant', 5, 9, 5, '/src/assets/Niseko Alpine Resort.jpg'),

-- Okinawa (10)
(46, 'Okinawa Beach Hotel', '1-5-5 Kokusai Dori, Naha, Okinawa', 4.8, 1556.75, 1, 4, 'Ocean View, Pool, Restaurant, Free WiFi', 1, 10, 1, '/src/assets/Okinawa Beach Hotel.jpg'),
(47, 'Naha Central Apartments', '2-2-12 Matsuo, Naha, Okinawa', 4.5, 864.86, 2, 5, 'Kitchen, Balcony, Air Conditioning, WiFi', 2, 10, 2, '/src/assets/Naha Central Apartments.jpg'),
(48, 'Island Hostel', 'Okinawa City Center, Okinawa', 4.3, 242.16, 1, 8, 'Shared Lounge, WiFi, Bar, Laundry', 4, 10, 4, '/src/assets/Island Hostel.jpg'),
(49, 'Coral Reef B&B', 'Onna-son, Okinawa', 4.6, 648.65, 1, 3, 'Breakfast, Ocean View, Garden, WiFi', 3, 10, 3, '/src/assets/Coral Reef B&B.jpg'),
(50, 'Ryukyu Resort & Spa', 'Onna Beach, Okinawa', 4.9, 2075.66, 1, 4, 'Private Beach, Spa, Pool, Restaurant', 5, 10, 5, '/src/assets/Ryukyu Resort & Spa.jpg');

-- New York City (11)
insert into accommodation VALUES
(51, 'The Plaza Hotel', '768 5th Ave, Manhattan, New York City', 4.9, 17.16, 1, 3, 'Spa, Bar, Restaurant, City View, Free WiFi', 1, 11, 1, '/src/assets/The Plaza Hotel.jpg'),
(52, 'SoHo City Apartments', '125 Greene St, SoHo, New York City', 4.6, 10.29, 2, 5, 'Kitchen, Air Conditioning, WiFi, Washer', 2, 11, 2, '/src/assets/SoHo City Apartments.jpg'),
(53, 'Manhattan Central Hostel', '230 W 101st St, Upper West Side, New York City', 4.3, 2.57, 1, 6, 'Shared Kitchen, WiFi, Lockers, Lounge', 4, 11, 4, '/src/assets/Manhattan Central Hostel.jpg'),
(54, 'Brooklyn Comfort B&B', '42 Jefferson Ave, Brooklyn, New York City', 4.5, 4.86, 1, 2, 'Breakfast, Garden, WiFi, Parking', 3, 11, 3, '/src/assets/Brooklyn Comfort B&B.jpg'),
(55, 'Hudson River Resort', 'West End Ave, New York City', 4.8, 14.87, 1, 4, 'Pool, Gym, River View, Restaurant', 5, 11, 5, '/src/assets/Hudson River Resort.jpg'),

-- Los Angeles (12)
(56, 'Beverly Hills Hotel', '9641 Sunset Blvd, Beverly Hills, Los Angeles', 4.9, 17.73, 1, 3, 'Spa, Pool, Restaurant, City View, WiFi', 1, 12, 1, '/src/assets/Beverly Hills Hotel.jpg'),
(57, 'Hollywood Apartments', '6234 Hollywood Blvd, Los Angeles', 4.6, 8.58, 2, 5, 'Kitchen, Balcony, Air Conditioning, WiFi', 2, 12, 2, '/src/assets/Hollywood Apartments.jpg'),
(58, 'Downtown LA Hostel', '300 E 5th St, Los Angeles', 4.3, 2.29, 1, 6, 'Shared Kitchen, WiFi, Lockers, Lounge', 4, 12, 4, '/src/assets/Downtown LA Hostel.jpg'),
(59, 'Venice Beach B&B', '23 Ocean Front Walk, Venice, Los Angeles', 4.5, 5.43, 1, 2, 'Breakfast, Ocean View, WiFi, Parking', 3, 12, 3, '/src/assets/Venice Beach B&B.jpg'),
(60, 'Santa Monica Resort & Spa', '1301 Ocean Ave, Santa Monica, Los Angeles', 4.8, 15.44, 1, 4, 'Pool, Spa, Ocean View, Restaurant', 5, 12, 5, '/src/assets/Santa Monica Resort & Spa.jpg'),

-- Las Vegas (13)
(61, 'The Bellagio Hotel', '3600 S Las Vegas Blvd, Las Vegas', 4.9, 16.59, 1, 3, 'Casino, Pool, Spa, Restaurant, WiFi', 1, 13, 1, '/src/assets/The Bellagio Hotel.jpg'),
(62, 'Vegas Strip Apartments', '2000 Las Vegas Blvd, Las Vegas', 4.6, 7.44, 2, 5, 'Kitchen, Balcony, Air Conditioning, WiFi', 2, 13, 2, '/src/assets/Vegas Strip Apartments.jpg'),
(63, 'Downtown Hostel Vegas', '201 E Fremont St, Las Vegas', 4.4, 2.00, 1, 8, 'Shared Kitchen, WiFi, Bar, Lounge', 4, 13, 4, '/src/assets/Downtown Hostel Vegas.jpg'),
(64, 'Oasis Desert B&B', 'North Las Vegas, Las Vegas', 4.5, 4.58, 1, 2, 'Breakfast, Pool, Parking, WiFi', 3, 13, 3, '/src/assets/Oasis Desert B&B.jpg'),
(65, 'Red Rock Resort', '11011 W Charleston Blvd, Las Vegas', 4.9, 13.73, 1, 4, 'Spa, Pool, Casino, Mountain View', 5, 13, 5, '/src/assets/Red Rock Resort.jpg'),

-- San Francisco (14)
(66, 'Fairmont San Francisco', '950 Mason St, San Francisco', 4.8, 15.44, 1, 3, 'Restaurant, Spa, City View, Free WiFi', 1, 14, 1, '/src/assets/Fairmont San Francisco.jpg'),
(67, 'Mission District Apartments', '245 Valencia St, San Francisco', 4.6, 9.15, 2, 5, 'Kitchen, Washer, WiFi, Air Conditioning', 2, 14, 2, '/src/assets/Mission District Apartments.jpg'),
(68, 'Downtown SF Hostel', '312 Mason St, San Francisco', 4.3, 2.17, 1, 6, 'Shared Lounge, WiFi, Lockers, Kitchen', 4, 14, 4, '/src/assets/Downtown SF Hostel.jpg'),
(69, 'Golden Gate B&B', '1412 Lombard St, San Francisco', 4.5, 5.15, 1, 2, 'Breakfast, Parking, WiFi, Garden', 3, 14, 3, '/src/assets/Golden Gate B&B.jpg'),
(70, 'Bayfront Resort & Spa', '555 Bay St, San Francisco', 4.9, 14.87, 1, 4, 'Spa, Pool, Bay View, Restaurant', 5, 14, 5, '/src/assets/Bayfront Resort & Spa.jpg'),

-- Miami (15)
(71, 'Fontainebleau Miami Beach', '4441 Collins Ave, Miami Beach', 4.9, 16.01, 1, 3, 'Ocean View, Pool, Spa, Restaurant, WiFi', 1, 15, 1, '/src/assets/Fontainebleau Miami Beach.jpg'),
(72, 'Downtown Miami Apartments', '175 SE 25th Rd, Miami', 4.6, 8.01, 2, 5, 'Kitchen, Balcony, Air Conditioning, WiFi', 2, 15, 2, '/src/assets/Downtown Miami Apartments.jpg'),
(73, 'South Beach Hostel', '235 Washington Ave, Miami Beach', 4.4, 2.06, 1, 6, 'Shared Kitchen, WiFi, Bar, Lounge', 4, 15, 4, '/src/assets/South Beach Hostel.jpg'),
(74, 'Coconut Grove B&B', '3185 Commodore Plaza, Miami', 4.5, 4.86, 1, 2, 'Breakfast, Garden, WiFi, Parking', 3, 15, 3, '/src/assets/Coconut Grove B&B.jpg'),
(75, 'Key Biscayne Resort', '455 Grand Bay Dr, Key Biscayne, Miami', 4.9, 14.30, 1, 4, 'Private Beach, Pool, Spa, Restaurant', 5, 15, 5, '/src/assets/Key Biscayne Resort.jpg');

INSERT INTO food_spot_type VALUES
(1, 'Restaurant'),
(2, 'Cafe'),
(3, 'Fast Food'),
(4, 'Buffet'),
(5, 'Bakery');

-----------------------------
-- food spots
------------------------------

-- Cape Town (1)
insert into food_spot VALUES
(1, 'The Test Kitchen', '375 Albert Rd, Woodstock, Cape Town', 4.9, 150.00, 450.00, 'Fine dining, tasting menu, South African fusion', 1, 1, '/src/assets/The Test Kitchen.jpg'),
(2, 'Truth Coffee Roasting', '36 Buitenkant St, Cape Town', 4.8, 40.00, 120.00, 'Artisan coffee, pastries, brunch options', 2, 1, '/src/assets/Truth Coffee Roasting.jpg'),
(3, 'Gibson’s Gourmet Burgers', 'V&A Waterfront, Cape Town', 4.6, 80.00, 180.00, 'Burgers, milkshakes, fries, casual dining', 3, 1, '/src/assets/Gibson’s Gourmet Burgers.jpg'),
(4, 'Table Bay Buffet', 'Quay 6, V&A Waterfront, Cape Town', 4.7, 200.00, 350.00, 'Seafood, meats, salads, dessert bar', 4, 1, '/src/assets/Table Bay Buffet.jpg'),
(5, 'Jason Bakery', '185 Bree St, Cape Town', 4.8, 30.00, 110.00, 'Croissants, cakes, bread, coffee', 5, 1, '/src/assets/Jason Bakery.jpg'),

-- Kruger National Park (2)
(6, 'Mopani Camp Restaurant', 'Mopani Rest Camp, Kruger Park', 4.5, 120.00, 250.00, 'Grilled meats, local cuisine, buffet breakfast', 1, 2, '/src/assets/Mopani Camp Restaurant.jpg'),
(7, 'Bushveld Café', 'Skukuza Camp, Kruger Park', 4.6, 60.00, 150.00, 'Coffee, sandwiches, light meals', 2, 2, '/src/assets/Bushveld Café.jpg'),
(8, 'Savannah Diner', 'Skukuza Village, Kruger Park', 4.3, 80.00, 180.00, 'Burgers, chicken wraps, fries', 3, 2, '/src/assets/Savannah Diner.jpg'),
(9, 'Elephant Point Buffet', 'Elephant Point, Kruger Park', 4.7, 200.00, 400.00, 'African grill, seafood, desserts', 4, 2, '/src/assets/Elephant Point Buffet.jpg'),
(10, 'Wild Bakes', 'Hazyview Entrance, Kruger Park', 4.5, 40.00, 120.00, 'Pies, muffins, coffee, pastries', 5, 2, '/src/assets/Wild Bakes.jpg'),

-- Garden Route (3)
(11, 'Serendipity Restaurant', 'Freesia Ave, Wilderness, Garden Route', 4.9, 160.00, 420.00, 'Fine dining, seafood, wine pairings', 1, 3, '/src/assets/Serendipity Restaurant.jpg'),
(12, 'Beans About Coffee', 'Main Rd, Knysna, Garden Route', 4.7, 35.00, 100.00, 'Espresso, lattes, baked treats', 2, 3, '/src/assets/Beans About Coffee.jpg'),
(13, 'Route 62 Grill', 'Voortrekker St, Oudtshoorn, Garden Route', 4.6, 90.00, 190.00, 'Steaks, burgers, ribs', 3, 3, '/src/assets/Route 62 Grill.jpg'),
(14, 'Knysna Lagoon Buffet', 'Lagoon Rd, Knysna, Garden Route', 4.8, 180.00, 350.00, 'Seafood, salads, dessert table', 4, 3, '/src/assets/Knysna Lagoon Buffet.jpg'),
(15, 'Butterfly Bakery', 'Market St, Mossel Bay, Garden Route', 4.5, 30.00, 90.00, 'Cupcakes, breads, tarts, coffee', 5, 3, '/src/assets/Butterfly Bakery.jpg'),

-- Durban (4)
(16, '9th Avenue Waterside', '2 Maritime Pl, Durban', 4.9, 140.00, 400.00, 'Seafood, fine dining, modern cuisine', 1, 4, '/src/assets/9th Avenue Waterside.jpg'),
(17, 'Surf Riders Café', '17 Erskine Terrace, Durban', 4.6, 50.00, 150.00, 'Coffee, smoothies, breakfast dishes', 2, 4, '/src/assets/Surf Riders Café.jpg'),
(18, 'Chicken Lickin’ Express', 'North Beach, Durban', 4.3, 60.00, 140.00, 'Fried chicken, burgers, chips', 3, 4, '/src/assets/Chicken Lickin’ Express.jpg'),
(19, 'Durban Buffet Centre', 'Moses Mabhida Stadium, Durban', 4.5, 180.00, 330.00, 'Curry, seafood, salads, desserts', 4, 4, '/src/assets/Durban Buffet Centre.jpg'),
(20, 'Sugar & Spice Bakery', 'Florida Rd, Durban', 4.7, 35.00, 110.00, 'Cakes, tarts, croissants, coffee', 5, 4, '/src/assets/Sugar & Spice Bakery.jpg'),

-- Johannesburg (5)
(21, 'Marble Restaurant', 'Trumpet on Keyes, Rosebank, Johannesburg', 4.9, 200.00, 500.00, 'Grill, wine, modern dining', 1, 5, '/src/assets/Marble Restaurant.jpg'),
(22, 'Bean There Café', '44 Stanley Ave, Milpark, Johannesburg', 4.7, 40.00, 100.00, 'Coffee, pastries, sandwiches', 2, 5, '/src/assets/Bean There Café.jpg'),
(23, 'RocoMamas Greenside', 'Greenside, Johannesburg', 4.6, 90.00, 180.00, 'Burgers, wings, milkshakes', 3, 5, '/src/assets/RocoMamas Greenside.jpg'),
(24, 'Gold Reef Buffet', 'Gold Reef City, Johannesburg', 4.8, 170.00, 350.00, 'Local cuisine, braai, desserts', 4, 5, '/src/assets/Gold Reef Buffet.JPG'),
(25, 'Croissant & Co. Bakery', 'Melville, Johannesburg', 4.5, 30.00, 90.00, 'Breads, croissants, coffee, cakes', 5, 5, '/src/assets/Croissant & Co. Bakery.jpg');

-- Tokyo (6)
insert into food_spot VALUES
(26, 'Sukiyabashi Jiro', '4-2-15 Ginza, Chuo City, Tokyo', 4.9, 3000.00, 40000.00, 'Sushi, omakase, fine dining', 1, 6, '/src/assets/Sukiyabashi Jiro.png'),
(27, 'Aoyama Flower Market Café', '5-1-2 Minami Aoyama, Minato, Tokyo', 4.7, 800.00, 2000.00, 'Coffee, tea, floral desserts, brunch', 2, 6, '/src/assets/Aoyama Flower Market Café.jpg'),
(28, 'Mos Burger Shibuya', '2-24-1 Shibuya, Tokyo', 4.4, 500.00, 1500.00, 'Burgers, fries, drinks, casual dining', 3, 6, '/src/assets/Mos Burger Shibuya.jpg'),
(29, 'Tokyo Station Buffet', '1-9-1 Marunouchi, Chiyoda, Tokyo', 4.6, 2500.00, 4500.00, 'Seafood, sushi, Japanese curry, desserts', 4, 6, '/src/assets/Tokyo Station Buffet.jpg'),
(30, 'Kimuraya Bakery', '4-5-7 Ginza, Tokyo', 4.8, 300.00, 1200.00, 'Anpan, bread rolls, coffee', 5, 6, '/src/assets/Kimuraya Bakery.jpg'),

-- Kyoto (7)
(31, 'Kikunoi Honten', '459 Shimokawara-cho, Higashiyama-ku, Kyoto', 4.9, 8000.00, 25000.00, 'Kaiseki, traditional multi-course Japanese', 1, 7, '/src/assets/Kikunoi Honten.jpg'),
(32, 'Arabica Café', '87-5 Hoshino-cho, Higashiyama-ku, Kyoto', 4.7, 600.00, 1800.00, 'Specialty coffee, light meals, pastries', 2, 7, '/src/assets/Arabica Café.jpg'),
(33, 'Lotteria Kyoto Station', 'Higashi Shiokoji-cho, Shimogyo-ku, Kyoto', 4.3, 500.00, 1500.00, 'Burgers, chicken, fries', 3, 7, '/src/assets/Lotteria Kyoto Station.jpg'),
(34, 'Kyoto Buffet Garden', 'Karasuma-dori, Nakagyo-ku, Kyoto', 4.5, 2500.00, 5000.00, 'Sushi, ramen, tempura, desserts', 4, 7, '/src/assets/Kyoto Buffet Garden.jpg'),
(35, 'Fleur de Farine Bakery', 'Sakyo-ku, Kyoto', 4.6, 400.00, 1300.00, 'Croissants, cakes, sweet buns', 5, 7, '/src/assets/Fleur de Farine Bakery.jpg'),

-- Osaka (8)
(36, 'Matsusaka Yakiniku M', '11-27 Namba, Chuo-ku, Osaka', 4.8, 2500.00, 9000.00, 'Japanese BBQ, wagyu beef, grilled meats', 1, 8, '/src/assets/Matsusaka Yakiniku M.jpg'),
(37, 'LiLo Coffee Roasters', '1-10-28 Nishishinsaibashi, Chuo-ku, Osaka', 4.7, 700.00, 1500.00, 'Hand-brewed coffee, toast, desserts', 2, 8, '/src/assets/LiLo Coffee Roasters.jpg'),
(38, 'McDonald’s Namba', '1-8-16 Namba, Chuo-ku, Osaka', 4.3, 400.00, 1200.00, 'Burgers, fries, ice cream', 3, 8, '/src/assets/McDonald’s Namba.jpg'),
(39, 'Osaka Viking Buffet', '3-3-15 Umeda, Kita-ku, Osaka', 4.6, 2000.00, 4800.00, 'Okonomiyaki, sushi, noodles, sweets', 4, 8, '/src/assets/Osaka Viking Buffet.jpg'),
(40, 'Andersen Bakery', '2-2-22 Umeda, Kita-ku, Osaka', 4.5, 350.00, 1100.00, 'Pastries, breads, sandwiches', 5, 8, '/src/assets/Andersen Bakery.jpg'),

-- Hokkaido (9)
(41, 'Sapporo Beer Garden', '2-10 Kita 7-Jo Higashi, Sapporo, Hokkaido', 4.8, 2000.00, 6000.00, 'Grilled lamb, beer, Hokkaido specialties', 1, 9, '/src/assets/Sapporo Beer Garden.jpg'),
(42, 'Morihiko Café', '1-12-1 Minami 2 Jo Nishi, Sapporo, Hokkaido', 4.7, 600.00, 1500.00, 'Coffee, sandwiches, cheesecake', 2, 9, '/src/assets/Morihiko Café.jpg'),
(43, 'Lucky Pierrot', '8-11 Wakamatsu-cho, Hakodate, Hokkaido', 4.6, 700.00, 1600.00, 'Burgers, fries, shakes', 3, 9, '/src/assets/Lucky Pierrot.png'),
(44, 'Hokkaido Buffet Dining', 'Kita 3 Nishi 4, Sapporo, Hokkaido', 4.7, 2500.00, 5000.00, 'Seafood, crab, sushi, ramen', 4, 9, '/src/assets/Hokkaido Buffet Dining.jpg'),
(45, 'Petite Bakery Sapporo', 'Odori Nishi 3, Sapporo, Hokkaido', 4.5, 300.00, 900.00, 'Cakes, pastries, coffee', 5, 9, '/src/assets/Petite Bakery Sapporo.jpg'),

-- Okinawa (10)
(46, 'Jack’s Steak House', '1-7-3 Nishi, Naha, Okinawa', 4.7, 1200.00, 3500.00, 'Steak, seafood, local dishes', 1, 10, '/src/assets/Jack’s Steak House.jpg'),
(47, 'Café Unizon', '3-23-16 Minatogawa, Urasoe, Okinawa', 4.6, 700.00, 1600.00, 'Coffee, tropical smoothies, sandwiches', 2, 10, '/src/assets/Café Unizon.jpg'),
(48, 'A&W Okinawa', 'Route 58, Naha, Okinawa', 4.5, 500.00, 1300.00, 'Burgers, root beer, fries', 3, 10, '/src/assets/A&W Okinawa.jpg'),
(49, 'Blue Lagoon Buffet', 'Chatan, Okinawa', 4.7, 2200.00, 4200.00, 'Seafood, BBQ, salad bar, desserts', 4, 10, '/src/assets/Blue Lagoon Buffet.jpg'),
(50, 'Okinawa Sweet Bakery', 'Makishi, Naha, Okinawa', 4.6, 300.00, 1000.00, 'Sweet buns, cakes, coffee', 5, 10, '/src/assets/Okinawa Sweet Bakery.jpg');

-- New York City (11)
insert into food_spot VALUES
(51, 'Le Bernardin', '155 W 51st St, New York, NY', 4.9, 33.75, 168.75, 'Seafood, French fine dining, tasting menu', 1, 11, '/src/assets/Le Bernardin.jpg'),
(52, 'Bluestone Lane Café', '55 Greenwich Ave, New York, NY', 4.7, 5.36, 16.78, 'Coffee, avocado toast, brunch', 2, 11, '/src/assets/Bluestone Lane Café.jpg'),
(53, 'Shake Shack Madison Square Park', 'Madison Ave & E 23rd St, New York, NY', 4.6, 3.57, 10.07, 'Burgers, fries, milkshakes', 3, 11, '/src/assets/Shake Shack Madison Square Park.jpg'),
(54, 'The Buffet at Bellagio NYC', '135 W 50th St, New York, NY', 4.5, 20.13, 40.27, 'Seafood, pasta, desserts, grill', 4, 11, '/src/assets/The Buffet at Bellagio NYC.jpg'),
(55, 'Dominique Ansel Bakery', '189 Spring St, New York, NY', 4.8, 4.02, 13.39, 'Cronuts, pastries, coffee', 5, 11, '/src/assets/Dominique Ansel Bakery.jpg'),

-- Los Angeles (12)
(56, 'Bestia', '2121 E 7th Pl, Los Angeles, CA', 4.8, 16.75, 60.30, 'Italian, handmade pasta, wood-fired pizza', 1, 12, '/src/assets/Bestia.jpg'),
(57, 'Alfred Coffee', '8428 Melrose Pl, Los Angeles, CA', 4.6, 4.69, 13.40, 'Coffee, tea, pastries', 2, 12, '/src/assets/Alfred Coffee.jpg'),
(58, 'In-N-Out Burger', '7009 Sunset Blvd, Los Angeles, CA', 4.7, 2.68, 6.70, 'Burgers, fries, shakes', 3, 12, '/src/assets/In-N-Out Burger.jpg'),
(59, 'The Grove Buffet', '189 The Grove Dr, Los Angeles, CA', 4.5, 16.75, 33.50, 'Salads, pasta, BBQ, desserts', 4, 12, '/src/assets/The Grove Buffet.jpg'),
(60, 'Bread Lounge', '700 S Santa Fe Ave, Los Angeles, CA', 4.6, 2.68, 10.05, 'Artisan bread, croissants, sandwiches', 5, 12, '/src/assets/Bread Lounge.jpg'),

-- Las Vegas (13)
(61, 'Gordon Ramsay Hell’s Kitchen', '3570 Las Vegas Blvd S, Las Vegas, NV', 4.9, 20.10, 67.00, 'Steak, seafood, British-American dishes', 1, 13, '/src/assets/Gordon Ramsay Hell’s Kitchen.jpg'),
(62, 'Café Belle Madeleine', '3655 Las Vegas Blvd S, Las Vegas, NV', 4.7, 5.36, 16.75, 'Pastries, sandwiches, espresso', 2, 13, '/src/assets/Café Belle Madeleine.jpg'),
(63, 'Five Guys Las Vegas Blvd', '3799 Las Vegas Blvd S, Las Vegas, NV', 4.6, 4.02, 10.72, 'Burgers, fries, milkshakes', 3, 13, '/src/assets/Five Guys Las Vegas Blvd.jpg'),
(64, 'Bacchanal Buffet', '3570 Las Vegas Blvd S, Las Vegas, NV', 4.8, 23.45, 46.90, 'International cuisine, seafood, desserts', 4, 13, '/src/assets/Bacchanal Buffet'),
(65, 'Bouchon Bakery', '3355 Las Vegas Blvd S, Las Vegas, NV', 4.7, 3.35, 12.06, 'Croissants, eclairs, macarons', 5, 13, '/src/assets/Bouchon Bakery.jpg'),

-- San Francisco (14)
(66, 'Saison', '178 Townsend St, San Francisco, CA', 4.9, 46.90, 167.50, 'Modern American, tasting menu, seafood', 1, 14, '/src/assets/Saison.jpg'),
(67, 'Blue Bottle Coffee', '66 Mint St, San Francisco, CA', 4.8, 4.69, 13.40, 'Espresso, pour-over, pastries', 2, 14, '/src/assets/Blue Bottle Coffee.jpg'),
(68, 'Super Duper Burgers', '721 Market St, San Francisco, CA', 4.6, 4.02, 10.72, 'Burgers, fries, milkshakes', 3, 14, '/src/assets/Super Duper Burgers.jpg'),
(69, 'City View Restaurant Buffet', '662 Commercial St, San Francisco, CA', 4.5, 16.75, 33.50, 'Dim sum, seafood, stir fry, desserts', 4, 14, '/src/assets/City View Restaurant Buffet.jpg'),
(70, 'Tartine Bakery', '600 Guerrero St, San Francisco, CA', 4.8, 3.35, 12.06, 'Morning buns, croissants, coffee', 5, 14, '/src/assets/Tartine Bakery.jpg'),

-- Miami (15)
(71, 'Joe’s Stone Crab', '11 Washington Ave, Miami Beach, FL', 4.8, 16.75, 60.30, 'Seafood, steak, stone crab', 1, 15, '/src/assets/Joe’s Stone Crab.jpg'),
(72, 'Panther Coffee', '2390 NW 2nd Ave, Miami, FL', 4.7, 4.69, 13.40, 'Coffee, pastries, sandwiches', 2, 15, '/src/assets/Panther Coffee.jpg'),
(73, 'Chick-fil-A Miami Central', '249 SW 8th St, Miami, FL', 4.6, 2.68, 8.04, 'Chicken sandwiches, fries, shakes', 3, 15, '/src/assets/Chick-fil-A Miami Central.jpg'),
(74, 'The Buffet at Fontainebleau', '4441 Collins Ave, Miami Beach, FL', 4.7, 20.10, 40.20, 'Seafood, grill, desserts, brunch', 4, 15, '/src/assets/The Buffet at Fontainebleau.jpg'),
(75, 'Zak the Baker', '295 NW 26th St, Miami, FL', 4.8, 3.35, 10.72, 'Artisan bread, cakes, sandwiches', 5, 15, '/src/assets/Zak the Baker.jpg');

----------------------------------
-- attractions
----------------------------------

-- destination (1)
insert into attraction VALUES
(1, 'Table Mountain Aerial Cableway', 'Tafelberg Rd, Gardens, Cape Town', 4.9, 420.00, 0.00, 1, 'Ride the cable car to the top of Table Mountain for panoramic city and ocean views.', 1, '/src/assets/Table Mountain Aerial Cableway.jpg'),
(2, 'Robben Island Museum', 'Nelson Mandela Gateway, V&A Waterfront, Cape Town', 4.8, 600.00, 0.00, 1, 'Historical island prison where Nelson Mandela was held, now a UNESCO World Heritage Site.', 1, '/src/assets/Robben Island Museum.jpg'),
(3, 'Kirstenbosch Botanical Gardens', 'Rhodes Dr, Newlands, Cape Town', 4.7, 220.00, 0.00, 0, 'World-famous botanical garden showcasing South Africa’s diverse plant life.', 1, '/src/assets/Kirstenbosch Botanical Gardens.jpg'),
(4, 'Boulders Beach Penguins', 'Seaforth Rd, Simon’s Town, Cape Town', 4.8, 190.00, 0.00, 0, 'Home to a colony of African penguins along a stunning coastal boardwalk.', 1, '/src/assets/Boulders Beach Penguins.jpg'),
(5, 'Cape Point Nature Reserve', 'Cape of Good Hope, Cape Peninsula, Cape Town', 4.9, 400.00, 0.00, 0, 'Scenic reserve at the tip of the Cape Peninsula featuring cliffs, wildlife, and hiking trails.', 1, '/src/assets/Cape Point Nature Reserve.jpg'),

-- destination (2)
(6, 'Skukuza Rest Camp', 'Skukuza, Kruger National Park', 4.7, 0.00, 400.00, 0, 'Largest rest camp in Kruger, offering game drives and riverfront views.', 2, '/src/assets/Skukuza Rest Camp.jpg'),
(7, 'Kruger National Park Game Drive', 'Paul Kruger Gate, Kruger National Park', 4.9, 0.00, 650.00, 1, 'Guided safari drive to spot Africa’s Big Five in their natural habitat.', 2, '/src/assets/Kruger National Park Game Drive.jpg'),
(8, 'Crocodile Bridge Gate Safari', 'Crocodile Bridge Gate, Komatipoort', 4.6, 0.00, 500.00, 1, 'Entry point offering excellent wildlife sightings and sunrise tours.', 2, '/src/assets/Crocodile Bridge Gate Safari.jpg'),
(9, 'Elephant Whispers Sanctuary', 'R40, Hazyview, Mpumalanga', 4.8, 250.00, 350.00, 1, 'Meet and interact with rescued elephants in a natural setting.', 2, '/src/assets/Elephant Whispers Sanctuary.jpg'),
(10, 'Panorama Route Tour', 'Graskop, Mpumalanga', 4.7, 0.00, 700.00, 1, 'Day tour featuring Blyde River Canyon, God’s Window, and waterfalls.', 2, '/src/assets/Panorama Route Tour.jpg'),

-- destination (3)
(11, 'Knysna Heads Viewpoint', 'Coney Glen Rd, Knysna', 4.8, 0.00, 0.00, 0, 'Spectacular coastal cliffs overlooking the Indian Ocean and Knysna Lagoon.', 3, '/src/assets/Knysna Heads Viewpoint.jpg'),
(12, 'Tsitsikamma National Park', 'N2, Storms River, Eastern Cape', 4.9, 250.00, 0.00, 0, 'Coastal park with hiking trails, waterfalls, and the famous suspension bridge.', 3, '/src/assets/Tsitsikamma National Park.jpg'),
(13, 'Cango Caves', 'Cango Valley, Oudtshoorn', 4.7, 300.00, 0.00, 1, 'Limestone caves with ancient rock formations and guided tours.', 3, '/src/assets/Cango Caves.jpg'),
(14, 'Bloukrans Bridge Bungee', 'N2, Tsitsikamma, Western Cape', 4.9, 0.00, 1350.00, 1, 'World’s highest commercial bungee jump experience.', 3, '/src/assets/Bloukrans Bridge Bungee.jpg'),
(15, 'Plettenberg Bay Beach', 'Beachfront Dr, Plettenberg Bay', 4.8, 0.00, 0.00, 0, 'Golden sand beach ideal for swimming, surfing, and dolphin spotting.', 3, '/src/assets/Plettenberg Bay Beach.jpg'),

-- destination (4)
(16, 'uShaka Marine World', '1 King Shaka Ave, Point, Durban', 4.8, 250.00, 0.00, 1, 'Aquarium, water park, and entertainment complex by the sea.', 4, '/src/assets/uShaka Marine World.jpg'),
(17, 'Durban Botanic Gardens', '9A John Zikhali Rd, Berea, Durban', 4.7, 0.00, 0.00, 0, 'Africa’s oldest botanical garden featuring exotic plants and birdlife.', 4, '/src/assets/Durban Botanic Gardens.jpg'),
(18, 'Moses Mabhida Stadium', '44 Isaiah Ntshangase Rd, Stamford Hill, Durban', 4.6, 120.00, 250.00, 1, 'Iconic stadium offering SkyCar rides and bungee swings from the arch.', 4, '/src/assets/Moses Mabhida Stadium.jpg'),
(19, 'Umhlanga Lighthouse & Promenade', 'Lighthouse Rd, Umhlanga Rocks, Durban', 4.7, 0.00, 0.00, 0, 'Scenic seaside walk with ocean views and cafes along the coast.', 4, '/src/assets/Umhlanga Lighthouse & Promenade.jpg'),
(20, 'Golden Mile Beachfront', 'O.R. Tambo Parade, Durban', 4.8, 0.00, 0.00, 0, 'Popular beachfront lined with resorts, markets, and bike paths.', 4, '/src/assets/Golden Mile Beachfront.jpg'),

-- destination (5)
(21, 'Apartheid Museum', 'Northern Parkway, Ormonde, Johannesburg', 4.9, 200.00, 0.00, 0, 'Historical museum chronicling South Africa’s struggle for freedom.', 5, '/src/assets/Apartheid Museum.jpg'),
(22, 'Gold Reef City Theme Park', 'Northern Parkway, Ormonde, Johannesburg', 4.7, 250.00, 350.00, 1, 'Amusement park featuring rides, shows, and mine tours.', 5, '/src/assets/Gold Reef City Theme Park.jpg'),
(23, 'Lion & Safari Park', 'R512 Pelindaba Rd, Hartbeespoort', 4.8, 200.00, 450.00, 1, 'Wildlife park offering self-drives and guided animal encounters.', 5, '/src/assets/Lion & Safari Park.jpg'),
(24, 'Constitution Hill', '11 Kotze St, Braamfontein, Johannesburg', 4.7, 120.00, 0.00, 0, 'Historic site housing the Constitutional Court and museum exhibits.', 5, '/src/assets/Constitution Hill.jpg.jpg'),
(25, 'Soweto Tour', 'Vilakazi St, Orlando West, Soweto', 4.8, 0.00, 500.00, 1, 'Guided cultural tour through the vibrant township of Soweto.', 5, '/src/assets/Soweto Tour.jpg');

-- destination (6)
insert into attraction VALUES
(26, 'Tokyo Skytree', '1 Chome-1-2 Oshiage, Sumida City, Tokyo', 4.8, 2100.00, 0.00, 1, 'The tallest tower in Japan offering stunning 360° city views from observation decks.', 6, '/src/assets/Tokyo Skytree.jpg'),
(27, 'Sensō-ji Temple', '2 Chome-3-1 Asakusa, Taito City, Tokyo', 4.9, 0.00, 0.00, 0, 'Tokyo’s oldest Buddhist temple famous for its Thunder Gate and Nakamise shopping street.', 6, '/src/assets/Sensō-ji Temple.jpg'),
(28, 'Shibuya Sky', '2 Chome-24-12 Shibuya, Tokyo', 4.8, 2000.00, 0.00, 1, 'Modern rooftop observatory offering breathtaking skyline views over the Shibuya Crossing.', 6, '/src/assets/Shibuya Sky.jpg'),
(29, 'teamLab Planets Tokyo', '6 Chome-1-16 Toyosu, Koto City, Tokyo', 4.9, 3800.00, 0.00, 1, 'Immersive digital art museum featuring interactive, floating, and water-based exhibits.', 6, '/src/assets/teamLab Planets Tokyo.jpg'),
(30, 'Ueno Zoo', '9-83 Uenokoen, Taito City, Tokyo', 4.6, 600.00, 0.00, 0, 'Japan’s oldest zoo, home to pandas and over 400 animal species.', 6, '/src/assets/Ueno Zoo.jpg'),

-- destination (7)
(31, 'Fushimi Inari Taisha', '68 Fukakusa Yabunouchicho, Fushimi Ward, Kyoto', 4.9, 0.00, 0.00, 0, 'Famous Shinto shrine known for its thousands of red torii gates winding through the forest.', 7, '/src/assets/Fushimi Inari Taisha.jpg'),
(32, 'Kinkaku-ji (Golden Pavilion)', '1 Kinkakujicho, Kita Ward, Kyoto', 4.8, 500.00, 0.00, 0, 'Iconic golden temple surrounded by a tranquil reflecting pond and gardens.', 7, '/src/assets/Kinkaku-ji (Golden Pavilion).jpg'),
(33, 'Arashiyama Bamboo Grove', 'Sagatenryuji Susukinobabacho, Ukyo Ward, Kyoto', 4.7, 0.00, 0.00, 0, 'Magical bamboo forest path offering a serene, photogenic experience.', 7, '/src/assets/Arashiyama Bamboo Grove.jpg'),
(34, 'Gion District', 'Gionmachi, Higashiyama Ward, Kyoto', 4.6, 0.00, 0.00, 0, 'Historic geisha district lined with traditional tea houses and lantern-lit streets.', 7, '/src/assets/Gion District.jpg'),
(35, 'Kiyomizu-dera Temple', '1 Chome-294 Kiyomizu, Higashiyama Ward, Kyoto', 4.9, 400.00, 0.00, 0, 'UNESCO-listed temple offering panoramic views of Kyoto from its wooden stage.', 7, '/src/assets/Kiyomizu-dera Temple.jpg'),

-- destination (8)
(36, 'Osaka Castle', '1-1 Osakajo, Chuo Ward, Osaka', 4.7, 600.00, 0.00, 0, 'Historic castle surrounded by moats and cherry blossoms, housing a modern museum.', 8, '/src/assets/Osaka Castle.jpg'),
(37, 'Dotonbori District', 'Dotonbori, Chuo Ward, Osaka', 4.8, 0.00, 0.00, 0, 'Vibrant entertainment area famous for neon lights, street food, and the Glico sign.', 8, '/src/assets/Dotonbori District.jpg'),
(38, 'Universal Studios Japan', '2 Chome-1-33 Sakurajima, Konohana Ward, Osaka', 4.9, 8900.00, 0.00, 1, 'World-class theme park featuring attractions like Harry Potter World and Super Nintendo Land.', 8, '/src/assets/Universal Studios Japan.jpg'),
(39, 'Kuromon Ichiba Market', '2 Chome-4-1 Nipponbashi, Chuo Ward, Osaka', 4.6, 0.00, 0.00, 0, 'Lively food market offering sushi, seafood, and Japanese snacks.', 8, '/src/assets/Kuromon Ichiba Market.jpg'),
(40, 'Umeda Sky Building', '1 Chome-1-88 Oyodonaka, Kita Ward, Osaka', 4.7, 1500.00, 0.00, 1, 'Futuristic skyscraper with a floating garden observatory and panoramic city views.', 8, '/src/assets/Umeda Sky Building.png'),

-- destination (9)
(41, 'Sapporo Snow Festival', 'Odori Park, Sapporo, Hokkaido', 4.9, 0.00, 0.00, 1, 'Annual winter festival showcasing massive snow and ice sculptures.', 9, '/src/assets/Sapporo Snow Festival.jpg'),
(42, 'Niseko Ski Resort', 'Hirafu, Kutchan, Abuta District, Hokkaido', 4.9, 0.00, 8500.00, 1, 'Japan’s top ski destination offering powder snow and hot springs.', 9, '/src/assets/Niseko Ski Resort.jpg'),
(43, 'Otaru Canal', 'Minatomachi, Otaru, Hokkaido', 4.8, 0.00, 0.00, 0, 'Charming canal lined with warehouses, shops, and lanterns.', 9, '/src/assets/Otaru Canal.jpg'),
(44, 'Asahiyama Zoo', 'Kuranuma, Higashiasahikawa, Asahikawa, Hokkaido', 4.7, 1000.00, 0.00, 0, 'Popular zoo featuring close-up animal exhibits and penguin walks.', 9, '/src/assets/Asahiyama Zoo.jpg'),
(45, 'Shirogane Blue Pond', 'Shirogane, Biei, Hokkaido', 4.8, 0.00, 0.00, 0, 'Mysterious turquoise-blue pond surrounded by tranquil forest.', 9, '/src/assets/Shirogane Blue Pond.jpg'),

-- destination (10)
(46, 'Shurijo Castle', '1-2 Shurikinjocho, Naha, Okinawa', 4.6, 400.00, 0.00, 0, 'Reconstructed Ryukyu palace symbolizing Okinawa’s unique cultural heritage.', 10, '/src/assets/Shurijo Castle.jpg'),
(47, 'Okinawa Churaumi Aquarium', '424 Ishikawa, Motobu, Okinawa', 4.9, 2180.00, 0.00, 1, 'One of the world’s largest aquariums featuring whale sharks and coral exhibits.', 10, '/src/assets/Okinawa Churaumi Aquarium.jpg'),
(48, 'Kokusai Dori Street', 'Kumoji, Naha, Okinawa', 4.7, 0.00, 0.00, 0, 'Bustling main street with shops, markets, and local Okinawan cuisine.', 10, '/src/assets/Kokusai Dori Street.JPG'),
(49, 'Cape Manzamo', 'Onna, Okinawa', 4.8, 0.00, 0.00, 0, 'Scenic ocean cliff offering spectacular sunset views.', 10, '/src/assets/Cape Manzamo.jpg'),
(50, 'Ishigaki Island Snorkeling Tour', 'Ishigaki Port, Okinawa', 4.9, 0.00, 7200.00, 1, 'Snorkeling experience exploring coral reefs and marine life in crystal-clear waters.', 10, '/src/assets/Ishigaki Island Snorkeling Tour.jpg');

-- destination (11)
insert into attraction VALUES
(51, 'Statue of Liberty & Ellis Island', 'Liberty Island, New York City', 4.9, 25.00, 0.00, 1, 'Iconic national monument offering ferry tours, museum exhibits, and panoramic skyline views.', 11, '/src/assets/Statue of Liberty & Ellis Island.jpg'),
(52, 'Central Park', '59th to 110th St, Manhattan, New York City', 4.8, 0.00, 0.00, 0, 'Expansive urban park with lakes, trails, and scenic spots for walking, boating, and picnicking.', 11, '/src/assets/Central Park.jpg'),
(53, 'Empire State Building Observatory', '20 W 34th St, Manhattan, New York City', 4.9, 44.00, 0.00, 1, 'Famous skyscraper offering panoramic city views from the 86th-floor observation deck.', 11, '/src/assets/Empire State Building Observatory.jpg'),
(54, 'Metropolitan Museum of Art', '1000 5th Ave, Manhattan, New York City', 4.9, 30.00, 0.00, 0, 'One of the world’s largest art museums showcasing global art, culture, and history.', 11, '/src/assets/Metropolitan Museum of Art.jpg'),
(55, 'Times Square', 'Broadway & 7th Ave, Manhattan, New York City', 4.7, 0.00, 0.00, 0, 'Lively entertainment hub filled with neon lights, theaters, and shops.', 11, '/src/assets/Times Square.jpg'),

-- destination (12)
(56, 'Griffith Observatory', '2800 E Observatory Rd, Los Angeles', 4.8, 0.00, 0.00, 0, 'Hilltop observatory offering public telescopes, exhibits, and views of the Hollywood Sign.', 12, '/src/assets/Griffith Observatory.jpg'),
(57, 'Hollywood Walk of Fame', 'Hollywood Blvd, Los Angeles', 4.6, 0.00, 0.00, 0, 'Famous boulevard lined with over 2,700 stars honoring entertainment legends.', 12, '/src/assets/Hollywood Walk of Fame.jpg'),
(58, 'Santa Monica Pier', '200 Santa Monica Pier, Santa Monica', 4.7, 0.00, 0.00, 0, 'Iconic pier featuring an amusement park, restaurants, and oceanfront views.', 12, '/src/assets/Santa Monica Pier.jpg'),
(59, 'Los Angeles County Museum of Art (LACMA)', '5905 Wilshire Blvd, Los Angeles', 4.8, 25.00, 0.00, 0, 'Largest art museum in the western U.S., featuring diverse exhibitions and installations.', 12, '/src/assets/Los Angeles County Museum of Art (LACMA).jpg'),
(60, 'Universal Studios Hollywood', '100 Universal City Plaza, Universal City', 4.9, 109.00, 0.00, 1, 'World-famous movie-based theme park and working studio.', 12, '/src/assets/Universal Studios Hollywood.jpg'),

-- destination (13)
(61, 'The Strip', 'Las Vegas Blvd, Las Vegas', 4.9, 0.00, 0.00, 0, 'Famous entertainment avenue lined with luxury hotels, casinos, and attractions.', 13, '/src/assets/The Strip.jpg'),
(62, 'Bellagio Fountains', '3600 S Las Vegas Blvd, Las Vegas', 4.9, 0.00, 0.00, 0, 'Mesmerizing water show synchronized to music in front of the Bellagio Hotel.', 13, '/src/assets/Bellagio Fountains.jpg'),
(63, 'High Roller Observation Wheel', '3545 S Las Vegas Blvd, Las Vegas', 4.8, 35.00, 0.00, 1, 'World’s second-tallest observation wheel offering breathtaking views of the city.', 13, '/src/assets/High Roller Observation Wheel.jpg'),
(64, 'Red Rock Canyon National Conservation Area', '1000 Scenic Loop Dr, Las Vegas', 4.9, 15.00, 0.00, 0, 'Scenic desert area with red rock formations, hiking trails, and viewpoints.', 13, '/src/assets/Red Rock Canyon National Conservation Area.jpg'),
(65, 'The Mob Museum', '300 Stewart Ave, Las Vegas', 4.7, 30.00, 0.00, 0, 'Interactive museum exploring the history of organized crime and law enforcement.', 13, '/src/assets/The Mob Museum.jpg'),

-- destination (14)
(66, 'Golden Gate Bridge', 'Golden Gate Bridge, San Francisco', 4.9, 0.00, 0.00, 0, 'Iconic red suspension bridge connecting San Francisco to Marin County with scenic views.', 14, '/src/assets/Golden Gate Bridge.jpg'),
(67, 'Alcatraz Island', 'San Francisco Bay, San Francisco', 4.8, 45.00, 0.00, 1, 'Historic island prison offering guided audio tours and panoramic city views.', 14, '/src/assets/Alcatraz Island.jpg'),
(68, 'Pier 39', 'Beach St & The Embarcadero, San Francisco', 4.7, 0.00, 0.00, 0, 'Bustling waterfront attraction with sea lions, restaurants, and shopping.', 14, '/src/assets/Pier 39.jpg'),
(69, 'Lombard Street', 'Lombard St, San Francisco', 4.6, 0.00, 0.00, 0, 'Famous crooked street known for its eight sharp turns and picturesque gardens.', 14, '/src/assets/Lombard Street.jpg'),
(70, 'San Francisco Museum of Modern Art (SFMOMA)', '151 3rd St, San Francisco', 4.8, 25.00, 0.00, 0, 'Renowned museum showcasing contemporary and modern art exhibitions.', 14, '/src/assets/San Francisco Museum of Modern Art (SFMOMA.jpg'),

-- destination (15)
(71, 'South Beach', 'Ocean Dr, Miami Beach', 4.8, 0.00, 0.00, 0, 'Vibrant beach known for art deco buildings, nightlife, and turquoise waters.', 15, '/src/assets/South Beach.jpg'),
(72, 'Vizcaya Museum & Gardens', '3251 S Miami Ave, Miami', 4.9, 25.00, 0.00, 0, 'Historic villa and gardens reflecting European architecture and art.', 15, '/src/assets/Vizcaya Museum & Gardens.jpg'),
(73, 'Everglades National Park Airboat Tour', '40001 State Hwy 9336, Homestead, Miami', 4.7, 30.00, 55.00, 1, 'Exciting airboat ride through the Everglades with chances to see alligators.', 15, '/src/assets/Everglades National Park Airboat Tour.png'),
(74, 'Little Havana', 'Calle Ocho, Miami', 4.6, 0.00, 0.00, 0, 'Cultural district filled with Cuban restaurants, art galleries, and live music.', 15, '/src/assets/Little Havana.jpg'),
(75, 'Miami Seaquarium', '4400 Rickenbacker Causeway, Miami', 4.5, 50.00, 0.00, 1, 'Marine park featuring dolphin, sea lion, and tropical fish exhibits.', 15, '/src/assets/Miami Seaquarium.jpg');

-----------------------------------
-----------------------------------

INSERT INTO user VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', 'Coffee in one hand, ideas in the other. Always two steps ahead—or at least trying to be. ☕💡', 'AQAAAAIAAYagAAAAENSCnr/j1Qq9//e7nU1QcaglsolbX2+tXWmxAiNI7tEwl70Bi00+OU647nPd+ZLeNg==', '2025-10-04', 1, 1),
(2, 'Suzzane', 'Smith', 'suzzane.smith@gmail.com', 'Sunshine mixed with a bit of storm. Loves art, laughter, and late-night deep talks. 🌦️🎨',  'AQAAAAIAAYagAAAAELDsgeDzTS0YTpbrYgTHfs3jsiAbzzASRX1JfPk4JZc6lz904Y66EKWZqYvqUY+LiA==', '2025-10-04', 1, 1),
(3, 'Michael', 'Brown', 'michael.brown@gmail.com', 'Tech geek by day, pizza critic by night. Forever chasing the next big adventure. 🍕💻',  'AQAAAAIAAYagAAAAEDngUIuaQLkVw4zjAGv8TqPPbpp6SPid0ZfWRl3modn2MtIVWz/SwWsqdCFmyHMtvA==', '2025-10-04', 1, 1),
(4, 'Emma', 'Johnson', 'emma.johnson@gmail.com', 'Book lover, dog cuddler, and unstoppable optimist. Making chaos look cute since day one. 📚🐾✨',  'AQAAAAIAAYagAAAAEA2CghGZBaYX8RQ2S5AQY52/LHQABOiJ2A9WjCVeBl4R9s0bgphyCgJfaY6WPFNkHA==', '2025-10-04', 1, 1),
(5, 'David', 'Williams', 'david.williams@gmail.com', 'Gym, gadgets, and good vibes only. Known to drop random fun facts mid-conversation. 💪🔋🧠', 'AQAAAAIAAYagAAAAEHRdNktfsv5pbkG5mgCHwkgsgQilLwy+ksnXjefLMzAu1OuC/ZhwhflzokVkj76Rpg==', '2025-10-04', 1, 1);

INSERT INTO spender_type VALUES
(1, 'Very Low Spender', 1),
(2, 'Low Spender', 2),
(3, 'Medium Spender', 3),
(4, 'High Spender', 4),
(5, 'Very High Spender', 5);