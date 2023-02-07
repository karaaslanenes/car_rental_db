USE master
GO

DROP DATABASE IF EXISTS CAR2GO
GO

-- creating a database
CREATE DATABASE CAR2GO
GO

-- Change connection to employee_practice database
USE CAR2GO
GO

     

CREATE TABLE LOCATION ( 

    LOCATION_ID VARCHAR(5) CONSTRAINT CK_LOCATION_ID CHECK(LOCATION_ID LIKE '[A-Z][A-Z][A-Z][0-9][0-9]'), 
  	STREET_NAME VARCHAR(30) NOT NULL,
    STEET_NO INT NOT NULL, 
	CITY VARCHAR(30) NOT NULL,
    PROVINCE_BRANCH VARCHAR(30) NOT NULL, 
    POSTAL_CODE_BRANCH VARCHAR(20) NOT NULL ,
    CONSTRAINT PK_LOCATION_ID primary key(LOCATION_ID)
 ); 

 

CREATE TABLE CAR_CLASS ( 
     CLASS_NAME VARCHAR(30) NOT NULL , 
     COST_PER_DAY MONEY not null,
     CONSTRAINT PK_CAR_CLASS PRIMARY KEY(CLASS_NAME)

 ); 

 

CREATE TABLE CAR ( 

   PLATE CHAR(9), 
   VIN CHAR(17)  NOT NULL UNIQUE , 
   YEAR INT NOT NULL, 
   MAKE VARCHAR(20) NOT NULL, 
   MODEL VARCHAR(20) NOT NULL, 
   COLOR VARCHAR(15) NOT NULL , 
   CLASS_NAME VARCHAR(30) NOT NULL , 
   LOCATION_ID VARCHAR(5) NOT NULL,
   CONSTRAINT FK_CAR01 FOREIGN KEY(CLASS_NAME) REFERENCES CAR_CLASS (CLASS_NAME),
   CONSTRAINT FK_CAR02  FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION (LOCATION_ID) ,
   CONSTRAINT PK_CAR PRIMARY KEY(PLATE)
 ); 

 

CREATE TABLE promotion ( 

    promotion_id VARCHAR(20), 
    discount DECIMAL(3,2) not null, 
    class_name VARCHAR(30) not null,
    st_date date not null,
    lt_date  date not null,
	constraint pk_promtion primary key(promotion_id),
	constraint fk_promotion01  foreign key (class_name) references car_class(class_name)
	
); 

 

CREATE TABLE customer ( 

    driving_license_no VARCHAR(20), 
    f_name VARCHAR(30) NOT NULL, 
    l_name VARCHAR(30) NOT NULL , 
    street_name VARCHAR(30) NOT NULL, 
    street_no int NOT NULL, 
    apt int, 
    city VARCHAR(30) NOT NULL , 
    province VARCHAR(30), 
    postal_code VARCHAR(30) NOT NULL, 
    country VARCHAR (30) NOT NULL, 
    constraint  pk_driving_license_no primary key( driving_license_no)
); 



CREATE TABLE customer_ph ( 

    country_code  int not null,
    area_code int not null, 
    local_code int not null,
    driving_license_no VARCHAR (20) ,
    constraint  pk_customer_ph primary key(driving_license_no,country_code,area_code,local_code),
    constraint fk_customer_ph foreign key(driving_license_no) references customer(driving_license_no)

); 

 

CREATE TABLE customer_email ( 

    email VARCHAR(30) DEFAULT 'NO EMAIL', 
    driving_licence_no VARCHAR(20) not null,
    constraint pk_customer_email primary key(email,driving_licence_no),
    constraint fk_customer_email foreign key(driving_licence_no) references customer(driving_license_no)

); 

 

CREATE TABLE rent( 
    rent_id VARCHAR(20) PRIMARY KEY, 
    st_date DATE  not null, 
    end_date DATE not null, 
    gas_tank VARCHAR(15) not null, 
    int_odo INT not null, 
    final_odo INT not null, 
    requested_car_class VARCHAR(30),
    rented_car_class VARCHAR(30),
    plate char(9) ,
    driving_license_no VARCHAR(20),
    constraint fk_rent02 foreign key(driving_license_no)  REFERENCES customer (driving_license_no) ,
    constraint fk_rent01 foreign key( plate) REFERENCES car (plate),
    constraint fk_rent03 foreign key(requested_car_class) references car_class(class_name),
    constraint fk_rent04 foreign key(rented_car_class) references car_class(class_name),

); 

 

CREATE TABLE location_rent( 
    location_start VARCHAR(5) not null , 
    location_final VARCHAR(5) not null, 
    rent_id VARCHAR (20),
    constraint pk_location_rent primary key(rent_id,location_start),
	constraint fk_location_rent foreign key(rent_id) references rent(rent_id),
); 

 

CREATE TABLE reservation( 

    res_id VARCHAR(20), 
    total_days int NOT NULL,  
    price MONEY NOT NULL,
    rent_id VARCHAR(20) NOT NULL, 
    promotion_id VARCHAR(20) DEFAULT NULL,
    constraint pk_reservation primary key(res_id),
    CONSTRAINT FK_reservation01 FOREIGN KEY (rent_id) REFERENCES rent (rent_id),
    CONSTRAINT FK_reservation02 FOREIGN KEY ( promotion_id) REFERENCES promotion  ( promotion_id)
); 
