CREATE TABLE currency(
	currency_id int PRIMARY KEY,
	currency_name CHAR(50) NOT NULL,
	currency_symbol CHAR(50) NOT NULL
);

create table exchange_rate(
	current_id INT NOT NULL,
	target_id INT NOT NULL,
	exchange_rate DOUBLE NOT NULL,
	PRIMARY KEY (current_id, target_id),
	FOREIGN KEY (current_id) REFERENCES currency(currency_id),
	FOREIGN KEY (target_id) REFERENCES currency(currency_id)
);

CREATE TABLE country(
	country_id INT PRIMARY KEY,
	country_name CHAR(100) NOT NULL,
	currency_id INT NOT NULL,
	FOREIGN KEY (currency_id) REFERENCES currency(currency_id)
);

CREATE TABLE destination(
	destination_id INT PRIMARY KEY,
	destination_name CHAR(100) NOT NULL,
    destination_country CHAR(100) NOT NULL,
	destination_rating INT NOT NULL,
	destination_description CHAR(100) NOT NULL,
	country_id INT NOT NULL,
	destination_image CHAR(100),
	FOREIGN KEY (country_id) REFERENCES country(country_id)
);

CREATE TABLE transportation_type(
	transportation_type_id INT PRIMARY KEY,
	transportation_type_name CHAR(50) NOT NULL
);

create table transportation(
	transportation_id INT PRIMARY KEY,
	transportation_name CHAR(100) NOT NULL,
	transportation_price_per_person DOUBLE NOT NULL,
	transportation_min_people INT NOT NULL,
	transportation_max_people INT NOT NULL,
	transportation_rating INT NOT NULL,
	transportation_type_id INT NOT NULL,
	destination_id int NOT NULL,
	transportation_image CHAR(100),
	FOREIGN KEY (transportation_type_id) REFERENCES transportation_type(transportation_type_id),
	FOREIGN KEY (destination_id) REFERENCES destination(destination_id)
);

create table accomodation_type(
	accomodation_type_id int PRIMARY KEY,
	accomodation_type_name char(50) NOT NULL
);

create table accommodation(
	accommodation_id INT PRIMARY KEY,
	accommodation_name CHAR(100) NOT NULL,
	accommodation_address CHAR(100) NOT NULL,
	accommodation_rating INT NOT NULL,
	accommodation_price_per_person DOUBLE NOT NULL,
	accommodation_min_num_of_people INT NOT NULL,
	accommodation_max_num_of_people INT NOT NULL,
	accommodation_amenities CHAR(100) NOT NULL,
	accommodation_type_id INT NOT NULL,
	destination_id INT NOT NULL,
    accomodation_type_id INT NOT NULL,
	accommodation_image CHAR(100),
	FOREIGN KEY (accomodation_type_id) REFERENCES accomodation_type(accomodation_type_id),
	FOREIGN KEY (destination_id) REFERENCES destination(destination_id)
);

create table food_spot_type(
	food_spot_type_id int PRIMARY KEY,
	food_spot_type_name char(50) NOT NULL
);

create table food_spot(
	food_spot_id INT PRIMARY KEY,
	food_spot_name CHAR(100) NOT NULL,
	food_spot_address CHAR(100) NOT NULL,
	food_spot_rating INT NOT NULL,
	food_spot_min_menu_price DOUBLE NOT NULL,
	food_spot_max_menu_price DOUBLE NOT NULL,
	food_spot_menu_items TEXT NOT NULL,
	food_spot_type_id INT NOT NULL,
	destination_id INT NOT NULL,
	food_spot_image TEXT,
	FOREIGN KEY (food_spot_type_id) REFERENCES food_spot_type(food_spot_type_id),
	FOREIGN KEY (destination_id) REFERENCES destination(destination_id)
);

create table attraction(
	attraction_id INT PRIMARY KEY,
	attraction_name CHAR(100) NOT NULL,
	attraction_address CHAR(100) NOT NULL,
	attraction_rating CHAR(100) NOT NULL,
	attraction_entrance_fee DOUBLE NOT NULL,
	attraction_price_per_person DOUBLE NOT NULL,
	attraction_time_limited BOOLEAN NOT NULL,
	attraction_description TEXT NOT NULL,
	destination_id int NOT NULL,
	attraction_image TEXT,
	FOREIGN KEY (destination_id) REFERENCES destination(destination_id)
);

create table user(
	user_id INT PRIMARY KEY,
	user_name char(100) NOT NULL,
	user_surname CHAR(100) NOT NULL,
	user_email CHAR(100) NOT NULL,
	user_bio CHAR(100) NOT NULL,
	user_password TEXT NOT NULL,
	user_created_date DATETIME NOT NULL,
	user_notification_on BOOLEAN NOT NULL,
	currency_id INT NOT NULL,
	FOREIGN KEY(currency_id) REFERENCES currency(currency_id)
);

CREATE TABLE spender_type(
	spender_type_id int PRIMARY KEY,
	spender_type_name char(50) NOT NULL,
	spender_type_level int NOT NULL
);

CREATE TABLE vacation(
	vacation_id INT PRIMARY KEY,
	vacation_start_date DATETIME NOT NULL,
	vacation_end_date DATETIME NOT NULL
);

CREATE TABLE selected_transportation(
	transportation_id int NOT NULL,
	vacation_id INT NOT NULL,
	selected_use_type INT NOT NULL,
	Num_of_times int NOT NULL,
    transportation_budget DOUBLE NOT NULL,
	PRIMARY KEY (transportation_id, vacation_id),
	FOREIGN KEY (transportation_id) REFERENCES transportation(transportation_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id)
);

CREATE TABLE selected_accommodation(
	accommodation_id int NOT NULL,
	vacation_id INT NOT NULL,
    num_of_days int NOT NULL,
    accommodation_budget DOUBLE NOT NULL,
	PRIMARY KEY (accommodation_id, vacation_id),
	FOREIGN KEY (accommodation_id) REFERENCES accommodation(accommodation_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id)
);

CREATE TABLE selected_food_spot(
	food_spot_id int NOT NULL,
	vacation_id INT NOT NULL,
	selected_experience_type INT NOT NULL,
    Num_of_times int NOT NULL,
    food_spot_budget DOUBLE NOT NULL,
	PRIMARY KEY (food_spot_id, vacation_id),
	FOREIGN KEY (food_spot_id) REFERENCES food_spot(food_spot_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id)
);

CREATE TABLE selected_attractions(
	attraction_id int NOT NULL,
	vacation_id INT NOT NULL,
	selected_experience_type INT NOT NULL,
    Num_of_times int NOT NULL,
    attraction_budget DOUBLE NOT NULL,
	PRIMARY KEY (attraction_id, vacation_id),
	FOREIGN KEY (attraction_id) REFERENCES attraction(attraction_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id)
);

CREATE TABLE created_plan(
	vacation_id INT NOT NULL,
	user_id INT NOT NULL,
	plan_budget DOUBLE NOT NULL,
	plan_created_date DATETIME NOT NULL,
	plan_modified_date DATETIME NOT NULL,
	spender_type_id INT NOT NULL,
	PRIMARY KEY(vacation_id, user_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (spender_type_id) REFERENCES spender_type(spender_type_id)
);

CREATE TABLE travel_buddy(
	vacation_id INT NOT NULL,
	user_id INT NOT NULL,
	viewed_plan BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY(vacation_id, user_id),
	FOREIGN KEY (vacation_id) REFERENCES vacation(vacation_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);





