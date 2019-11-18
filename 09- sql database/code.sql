
-- ############################################### DATABASE OPERATIONS   #################################################
-- List all the databases present in mysql
-- SHOW DATABASES;

-- Create a database of name 'Health_industry'
CREATE DATABASE Health_industry;
-- SHOW DATABASES;

-- Create a database of name 'SEARCH_ENGINE'
CREATE DATABASE Search_engine;
-- SHOW DATABASES;

-- Drop a database
DROP DATABASE Health_industry;
-- SHOW DATABASES;


-- Use
USE Search_engine;



-- ############################################### TABLE OPERATIONS   #################################################

-- 1. DONE: Create
-- 2. Alter (add extra column)
-- 3. Delete a table
-- 4. List all the tables present in a db
-- 5. Describe a table

-- Create table :: page
-- INFO::
-- Title       : String
-- Description : String
-- Price       : Int
-- Avg_stars   : Float
-- No_of_reviews: Int
-- Page_id      : String
CREATE TABLE Page(
    Title VARCHAR(200),
    Description VARCHAR(200),
    Price INT,
    Avg_stars FLOAT,
    No_of_reviews INT,
    Page_id VARCHAR(200)
);

-- SHOW TABLES;

-- create table:: page_model 
-- INFO::
-- Page_id       : String
-- Category      : String
CREATE TABLE page_model(
    Page_id VARCHAR(55),
    Category VARCHAR(10)
);




-- create Table :: Review 
-- INFO::
-- Review_id       : String
-- Review      : String
-- Reviewer_name : String
-- Review star   : Int
-- Review time   : DATETIME
-- Page_id       : String
CREATE TABLE Review(
    Review_id VARCHAR(200),
    Review VARCHAR(150),
    Reviewer_name VARCHAR(100),
    Review_star INT,
    Review_time DATETIME,
    Page_id VARCHAR(100)
);


-- Create table :: review_model 
-- INFO::
-- Review_id     : String
-- Category     : String
-- Sentiment    : String
-- Attribute    : Array
CREATE TABLE review_model(
    Review_id VARCHAR(100),
    Category VARCHAR(50),
    Sentiment VARCHAR(10),
    Attribute VARCHAR(100)
);

-- SHOW TABLES;


-- ALTER A TABLE
-- Add new feature called 'language' to table 'Review_model'
ALTER TABLE review_model
ADD language VARCHAR(250);

-- DESCRIBE review_model;


-- delete a table 'Review_model'
DROP TABLE review_model;


-- List all the tables
-- SHOW TABLES;

-- print all the columns and types of a table "Review"
-- DESCRIBE Page;

-- Delete a particular column
-- ALTER TABLE Page
-- DROP Title;

-- DESCRIBE Page;


-- ############################################### DOCUMENT OPERATIONS   #################################################

-- 1. Insert documents to table
-- 2. Show all the documents present in the table
-- 3. Deletes all the documents present in the table
-- 4. Update a document

-- insert document into table :: page
-- INFO::
-- Title       : String
-- Description : String
-- Price       : Int
-- Avg_stars   : Float
-- No_of_reviews: Int
-- Page_id      : String
INSERT INTO Page (Title, Description, Price, Avg_stars, No_of_reviews, Page_id) VALUES
("iphone x", "32GB black", 999, 4.7, 3200, "Id_1"),
("Samsung s6", "64GB white", 777, 4.3, 1200, "Id_2");

-- Select
-- SELECT * FROM Page;


-- insert document into 'Page_model' table
-- INFO::
-- Page_id       : String
-- Category      : String

ALTER TABLE page_model
MODIFY Category TEXT;

INSERT INTO page_model (Page_id, Category) VALUES
("id_1", "Electronics"),
("id_2", "Electronics");




-- Show all the documents present in the table 'PAGE'
-- SELECT * FROM Page;

-- show all the documents present in the table 'PAGE' with Price greater than 800
-- SELECT * FROM Page
-- WHERE Price>800;


-- delete all the documents present in the table 'PAGE'
-- DELETE FROM Page; -- delete all documents present in schema
-- DROP TABLE Page;  -- entirely drop the schema
-- SELECT * FROM Page;


-- delete documents present in the table 'PAGE' with Price greater than 800 
-- DELETE FROM Page WHERE Price>800;



-- Update the price of the document as 1000  if price is greater than 800
UPDATE Page SET Price=1000 WHERE Price>800;
-- SELECT * FROM Page;

-- ############################################### Constraints on columns   #################################################

-- 1. Not null constraint
-- 2. Default constraint
-- 3. Unique constraint
-- 4. Primary key constraint
-- 5. Foreign key constraint
-- 6. Check constraint

-- Create a table called 'page' according to following information and specify constraint as mentioned
-- Create table :: page
-- INFO::
-- Title       : String   : Not Null
-- Description : String
-- Price       : Int      : Not Null
-- Avg_stars   : Float
-- No_of_reviews: Int
-- Page_id      : String   : Not Null
-- CREATE TABLE page(
--     Title VARCHAR(200) NOT NULL,
--     Description VARCHAR(200),
--     Price INT NOT NULL,
--     Avg_stars FLOAT,
--     No_of_reviews INT,
--     Page_id VARCHAR(200) NOT NULL
-- );
-- INSERT INTO page (Title, Description, Price, Avg_stars, No_of_reviews, Page_id) VALUES
-- ("iphone x", "32 GB ram", 999, 4.5, 3200, "_id_1");

-- SELECT * FROM page;


-- Create a table called 'page' according to following information and specify constraint as mentioned
-- Create table :: page
-- INFO::
-- Title       : String   : Not Null
-- Description : String
-- Price       : Int      : Not Null
-- Avg_stars   : Float    : Default value to be 0**
-- No_of_reviews: Int
-- Page_id      : String   : Not Null
-- CREATE TABLE page(
--     Title VARCHAR(200) NOT NULL,
--     Description VARCHAR(200),
--     Price INT NOT NULL,
--     Avg_stars FLOAT DEFAULT 0,
--     No_of_reviews INT,
--     Page_id VARCHAR(200) NOT NULL
-- );
-- INSERT INTO page (Title, Description, Price, Page_id) VALUES
-- ("iphone x", "32 GB ram", 999, "_id_1");

-- SELECT * FROM page;

-- Create a table called 'page' according to following information and specify constraint as mentioned
-- Create table :: page
-- INFO::
-- Title       : String   : Not Null
-- Description : String
-- Price       : Int      : Not Null
-- Avg_stars   : Float    : Default value to be 0
-- No_of_reviews: Int
-- Page_id      : String   : Not Null & UNIQUE**
-- CREATE TABLE page(
--     Title VARCHAR(200) NOT NULL,
--     Description VARCHAR(200),
--     Price INT NOT NULL,
--     Avg_stars FLOAT DEFAULT 0,
--     No_of_reviews INT,
--     Page_id VARCHAR(200) NOT NULL UNIQUE
-- );
-- INSERT INTO page (Title, Description, Price, Page_id) VALUES
-- ("iphone x", "32 GB ram", 999, "_id_1"),
-- ("Samsung s6", "64 GB ram", 888, "_id_2");

-- SELECT * FROM page;


-- set primary key in the table : Page
-- Create table :: page
-- INFO::
-- Title       : String   : Not Null
-- Description : String
-- Price       : Int      : Not Null
-- Avg_stars   : Float    : Default value to be 0
-- No_of_reviews: Int
-- Page_id      : String   : PRIMARY KEY
CREATE TABLE page(
    Title VARCHAR(200) NOT NULL,
    Description VARCHAR(200),
    Price INT NOT NULL,
    Avg_stars FLOAT DEFAULT 0,
    No_of_reviews INT,
    Page_id VARCHAR(200) PRIMARY KEY
);
INSERT INTO page (Title, Description, Price, Page_id) VALUES
("iphone x", "32 GB ram", 999, "_id_1"),
("Samsung s6", "64 GB ram", 888, "_id_2");


-- set foreign key in the table page_model
CREATE TABLE Page_Model(
    Page_id VARCHAR(200),
    Category VARCHAR(200),
    FOREIGN KEY(Page_id) REFERENCES page(Page_id)
);

SELECT * FROM page;


-- check constraint
CREATE TABLE page(
    Title VARCHAR(200) NOT NULL,
    Description VARCHAR(200),
    Price INT NOT NULL,
    Avg_stars FLOAT DEFAULT 0 CHECK Avg_stars<=5,
    No_of_reviews INT,
    Page_id VARCHAR(200) PRIMARY KEY
);



