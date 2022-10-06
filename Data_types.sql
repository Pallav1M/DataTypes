
create database testing_db;
use testing_db;
create table dogs
(
 name char(5),
 breed varchar(10)
);

insert into dogs (name, breed)
values ("bob", "beagle");

insert into dogs(name, breed)
values("Robby", "corgi");

insert into dogs(name, breed)
values("Princess Jane", "Retriever");

select * from dogs;
-- It will truncate and display "Princ"

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retrievesadfdsafdasfsafr');
 
SELECT * FROM dogs; 
-- This will display the first 10 charachaters only. 

-- DECIMAL

CREATE TABLE items(price DECIMAL(5,2));
 
INSERT INTO items(price) VALUES(7);
 
INSERT INTO items(price) VALUES(7987654);
-- should display the largest value 
 
INSERT INTO items(price) VALUES(34.88);
 
INSERT INTO items(price) VALUES(298.9999);
 
INSERT INTO items(price) VALUES(1.9999);
 
SELECT * FROM items;

-- FLOAT and DOUBLE

create table things (price float);

insert into things (price) values (88.45);
select * from things;

insert into things (price) values (8877.45);
insert into things (price) values (887746457546757.45);

select * from things;

-- DATE (values with date but no time)
-- DATETIME (values with a date and time)

CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');
 
SELECT * FROM people;

-- CURTIME() gives current time
-- CURDATE() gives current date 
-- NOW() gives current date time

-- Formatting Dates
-- -----------------------
-- -----------------------
-- DAY()
-- DAYNAME()
-- DAYOFWEEK()
-- DAYOFYEAR()

SELECT name, birthdate FROM people;
 
SELECT name, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAY(birthdate) FROM people;
 
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
 
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
 
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;
 
SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people;
 
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
 
SELECT name, birthdt, MONTH(birthdt) FROM people;
 
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;
 
SELECT name, birthtime, HOUR(birthtime) FROM people;
 
SELECT name, birthtime, MINUTE(birthtime) FROM people;
 
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)) FROM people;
 
SELECT DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
 
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

-- DATE MATHS
-- Datediff 
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;
SELECT birthdt FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
 
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;

-- WORKING WITH TIMESTAMPS
-- Why we use timestamp instead of datetime? Because it takes up less space i.e 4 vs 8. But it can'e be used beyond 1970 and 2038. 

-- TIMESTAMPS
-- ==============
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO comments (content) VALUES('lol what a funny article');
 
INSERT INTO comments (content) VALUES('I found this offensive');
 
INSERT INTO comments (content) VALUES('Ifasfsadfsadfsad');
 
SELECT * FROM comments ORDER BY created_at DESC;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
 
INSERT INTO comments2 (content) VALUES('dasdasdasd');
 
INSERT INTO comments2 (content) VALUES('lololololo');
 
INSERT INTO comments2 (content) VALUES('I LIKE CATS AND DOGS');
 
UPDATE comments2 SET content='THIS IS NOT GIBBERISH' WHERE content='dasdasdasd';
 
SELECT * FROM comments2;
 
SELECT * FROM comments2 ORDER BY changed_at;
 
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

-- DATA TYPES EXERCISE 
-- What's a good use case for CHAR?

-- Used for text that we know has a fixed length, e.g., State abbreviations, 
-- abbreviated company names, 
-- sex M/F, etc.
 
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2),
    quantity INT
);
 
-- What's the difference between DATETIME and TIMESTAMP?
-- ------
-- They both store datetime information, but there's a difference in the range, 
-- TIMESTAMP has a smaller range. TIMESTAMP also takes up less space. 
-- TIMESTAMP is used for things like meta-data about when something is created
-- or updated.
--  
SELECT CURTIME();
--  
-- SELECT CURDATE()';
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;

