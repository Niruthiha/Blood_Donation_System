SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS available_pac;
DROP TABLE IF EXISTS donor;
DROP TABLE IF EXISTS donorhistory;
DROP TABLE IF EXISTS purchaser;

CREATE DATABASE IF NOT EXISTS blooddonation;
USE blooddonation;


CREATE TABLE IF NOT EXISTS available_pac (
  name varchar(250) NOT NULL,
  available int(11) NOT NULL
);

INSERT INTO available_pac (name, available) VALUES
('A+', 23),
('B+', 21),
('AB+', 39),
('O+', 31),
('A-', 18),
('B-', 35),
('AB-', 40),
('O-', 24);

CREATE TABLE IF NOT EXISTS donor (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(230) NOT NULL,
  bloodgroup varchar(250) DEFAULT NULL,
  sex varchar(240) NOT NULL,
  age int(11) NOT NULL,
  address varchar(250) NOT NULL,
  phoneno bigint(20) DEFAULT NULL,
  date date NOT NULL,
  username varchar(250) DEFAULT NULL,
  password varchar(250) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO donor (name, bloodgroup, sex, age, address, phoneno, date, username, password) VALUES
('John Smith', 'A+', 'Male', 25, '123 Main St, Anytown', 2143563432, '2020-03-03', 'john', 'john'),
('Emily Johnson', 'O+', 'Female', 35, '456 Oak St, Springfield', 4356433265, '2021-03-08', 'emily', 'emily'),
('Michael Brown', 'B+', 'Male', 45, '789 Pine St, Rivertown', 6578893421, '2021-03-08', 'michael', 'michael'),
('Emma Davis', 'B+', 'Female', 25, '101 Elm St, Lakeside', 3465329856, '2021-03-08', 'emma', 'emma'),
('Christopher Wilson', 'A+', 'Male', 55, '222 Maple Ave, Hilltown', 3443567856, '2021-03-08', 'chris', 'chris'),
('Sarah Thompson', 'A+', 'Female', 25, '321 Cedar St, Parkville', 2354763456, '2021-03-09', 'sarah', 'sarah');


CREATE TABLE IF NOT EXISTS donorhistory (
  bloodtype varchar(250) NOT NULL,
  user varchar(250) NOT NULL,
  date date NOT NULL,
  time time DEFAULT NULL
);

INSERT INTO donorhistory (bloodtype, user, date, time) VALUES
('A+', 'john', '2020-03-03', '13:42:47'),
('O+', 'emily', '2021-03-08', '13:55:34'),
('B+', 'micheal', '2021-03-08', '13:58:09'),
('B+', 'emma', '2021-03-08', '22:53:34'),
('A+', 'chris', '2021-03-08', '23:05:55'),
('A+', 'sarah', '2021-03-09', '13:54:29');

-- Check if the admin table does not exist before creating it
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert data into the admin table
INSERT INTO admin (user, password) VALUES ('admin', 'admin');


CREATE TABLE IF NOT EXISTS purchaser (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(260) DEFAULT NULL,
  mobile bigint(20) DEFAULT NULL,
  address varchar(250) NOT NULL,
  user varchar(259) NOT NULL,
  password varchar(250) NOT NULL,
  date date NOT NULL,
  PRIMARY KEY (id)
);



INSERT INTO purchaser (name, mobile, address, user, password, date) VALUES
('John Doe', 4576349432, '123 Maple Street, Toronto', 'john', 'john', '2021-03-08'),
('Jane Doe', 5476435643, '456 Oak Avenue, Vancouver', 'jane', 'jane', '2021-03-08'),
('Peter Parker', 5678343265, '789 Pine Road, Montreal', 'peter', 'peter', '2021-03-08'),
('Alice Smith', 1234564312, '101 Elm Drive, Calgary', 'alice', 'alice', '2021-03-08'),
('Bob Johnson', 3254763456, '222 Cedar Boulevard, Ottawa', 'bob', 'bob', '2021-03-09');

COMMIT;

