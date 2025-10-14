create table destination_rating(
	dest_rating_id INTEGER PRIMARY KEY,
	dest_rating_name varchar(100) NOT NULL
);

create table currency(
	curr_id int PRIMARY KEY,
    curr_name char(100) NOT NULL,
	curr_symbol char(5) NOT NULL
);

create table exchange_rate(
	current_id int NOT NULL,
	target_id int NOT NULL,
	exchange_rate DOUBLE NOT NULL,
	PRIMARY KEY (current_id, target_id),
	FOREIGN KEY (current_id) REFERENCES currency(curr_id),
	FOREIGN KEY (target_id) REFERENCES currency(curr_id)
);

create table destination(
	dest_id int PRIMARY KEY,
	dest_name char(100) NOT NULL,
    dest_country char(100) NOT NULL,
	dest_rating_id int NOT NULL,
	curr_id int NOT NULL,
	FOREIGN KEY (dest_rating_id) REFERENCES destination_rating(dest_rating_id),
	FOREIGN KEY (curr_id) REFERENCES currency(curr_id)
);

create table accomodation_type(
	acc_type_id int PRIMARY KEY,
	acc_type_name char(50) NOT NULL
);

create table food_place_type(
	foodp_type_id int PRIMARY KEY,
	foodp_type_name char(50) NOT NULL
);

create table transportation_type(
	transp_type_id int PRIMARY KEY,
	transp_type_name char(50) NOT NULL
);

create table accomodation(
	acc_id int PRIMARY KEY,
	acc_name char(100) NOT NULL,
	acc_address char(100) NOT NULL,
	acc_min_price DOUBLE NOT NULL,
	acc_max_price DOUBLE NOT NULL,
	acc_max_num_of_people int NOT NULL,
	acc_type_id int NOT NULL,
	dest_id int NOT NULL,
	FOREIGN KEY (acc_type_id) REFERENCES accomodation_type(acc_type_id),
	FOREIGN KEY (dest_id) REFERENCES destination(dest_id)
);

create table food_place(
	foodp_id int PRIMARY KEY,
	foodp_name char(100) NOT NULL,
	foodp_address char(100) NOT NULL,
	foodp_min_price DOUBLE NOT NULL,
	foodp_max_price DOUBLE NOT NULL,
	foodp_menu_items text NOT NULL,
	foodp_rating int NOT NULL,
	foodp_type_id int NOT NULL,
	dest_id int NOT NULL,
	FOREIGN KEY (foodp_type_id) REFERENCES food_place_type(foodp_type_id),
	FOREIGN KEY (dest_id) REFERENCES destination(dest_id)
);

create table transportation(
	transp_id int PRIMARY KEY,
	transp_name char(100) NOT NULL,
	transp_min_price DOUBLE NOT NULL,
	transp_max_price DOUBLE NOT NULL,
	transp_type_id int NOT NULL,
	dest_id int NOT NULL,
	FOREIGN KEY (transp_type_id) REFERENCES transportation_type(transp_type_id),
	FOREIGN KEY (dest_id) REFERENCES destination(dest_id)
);

create table attraction(
	attr_id int PRIMARY KEY,
	attr_name char(100) NOT NULL,
	attr_address char(100) NOT NULL,
	attr_min_price DOUBLE NOT NULL,
	attr_max_price DOUBLE NOT NULL,
	dest_id int NOT NULL,
	FOREIGN KEY (dest_id) REFERENCES destination(dest_id)
);

create table vacation(
	vac_id int PRIMARY KEY,
	vac_start_date DATETIME NOT NULL,
	vac_end_date DATETIME NOT NULL
);

create table selected_attraction(
	attr_id int NOT NULL,
	vac_id int NOT NULL,
	estimated_activity_price DOUBLE NOT NULL,
	PRIMARY KEY (attr_id, vac_id),
	FOREIGN KEY (attr_id) REFERENCES attraction(attr_id),
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id)
);

create table selected_accomodation(
	acc_id int NOT NULL,
	vac_id int NOT NULL,
	num_of_nights_in_acc int NOT NULL,
	estimated_acc_price DOUBLE NOT NULL,
	PRIMARY KEY (acc_id, vac_id),
	FOREIGN KEY (acc_id) REFERENCES accomodation(acc_id),
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id)
);

create table selected_food_place(
	foodp_id int NOT NULL,
	vac_id int NOT NULL,
	num_meals_a_day int NOT NULL,
	estimated_food_price DOUBLE NOT NULL,
	PRIMARY KEY (foodp_id, vac_id),
	FOREIGN KEY (foodp_id) REFERENCES food_place(foodp_id),
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id)
);

create table selected_transportation(
	transp_id int NOT NULL,
	vac_id int NOT NULL,
	estimated_transp_price DOUBLE NOT NULL,
	PRIMARY KEY (transp_id, vac_id),
	FOREIGN KEY (transp_id) REFERENCES transportation(transp_id),
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id)
);

create table user(
	user_id int PRIMARY KEY,
	user_name char(100) NOT NULL,
	user_surname char(100) NOT NULL,
	user_bio char(100) NOT NULL,
	user_email char(100) NOT NULL,
	user_password TEXT NOT NULL,
	user_created_date DATETIME NOT NULL,
	notification_on BIT NOT NULL,
	curr_id int NOT NULL,
	FOREIGN KEY(curr_id) REFERENCES currency(curr_id)
);

create table spender_type(
	spender_type_id int PRIMARY KEY,
	spender_type_name char(50) NOT NULL,
	spender_type_level int NOT NULL
);

create table created_vacation_plan(
	vac_id int NOT NULL,
	user_id int NOT NULL,
	plan_created_date DATETIME NOT NULL,
	plan_modified_date DATETIME NOT NULL,
	extra_people_going int NOT NULL,
	spender_type_id int NOT NULL,
	PRIMARY KEY (vac_id, user_id),
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (spender_type_id) REFERENCES spender_type(spender_type_id)
);

create table notification(
	noti_id int PRIMARY KEY,
	noti_title TEXT NOT NULL,
	noti_message TEXT NOT NULL,
	noti_created_date DATETIME NOT NULL,
	noti_is_read BIT NOT NULL,
	vac_id int NOT NULL,
	user_id int NOT NULL,
    FOREIGN KEY (vac_id, user_id) REFERENCES created_vacation_plan(vac_id, user_id)
);

create table added_to_vacation(
	vac_id int NOT NULL,
	user_id int NOT NULL,
	viewed_vac BIT NOT NULL,
	FOREIGN KEY (vac_id) REFERENCES vacation(vac_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);

create table error_type(	
	err_type_id int PRIMARY KEY,
	err_type_name char(50) NOT NULL,
	err_type_level int NOT NULL
);

create table admin(
	admin_id int PRIMARY KEY,
	admin_name char(100) NOT NULL,
	admin_surname char(100) NOT NULL,
	admin_email char(100) NOT NULL,
	admin_password TEXT NOT NULL
);

create table error(
	err_id int PRIMARY KEY,
	device_err_occured char(100) NOT NULL,
	err_date_occured DATETIME NOT NULL,
	err_resolved BIT NOT NULL,
	err_type_id int NOT NULL,
	user_id int NOT NULL,
	admin_id int NOT NULL,
	FOREIGN KEY (err_type_id) REFERENCES error_type(err_type_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);

create table suggestion(
	sugg_id int PRIMARY KEY,
	sugg_details TEXT NOT NULL,
	sugg_date_recorded DATETIME NOT NULL,
	sugg_added BIT NOT NULL,
	user_id int NOT NULL,
	admin_id int NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user(user_id),
	FOREIGN KEY (admin_id) REFERENCES admin(admin_id)
);
