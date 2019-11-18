-- CREATE DATABASE sql_Assignment;-- 


use sql_Assignment;

-- DROP TABLE tablename;
DROP TABLE IF EXISTS Page_Columns;
drop table if exists page_model;
-- create DATABASE

/*  1. CREATE a table for Page
Columns:
Page_title : String : Not Null
Description : String
Price : Float : Not Null
Avg_stars : Float : Don't allow user to insert if more than 5
No_of_reviews : Integer: Have a default value of 0
Page_id : Primary Key
*/




create table  Page_Columns ( Page_title VARCHAR(20) Not Null , 
Description VARCHAR(50)  ,
Price Float Not Null , 
Avg_stars Float check  (Avg_stars <= 5) , --  Don't allow user to insert if more than 5
No_of_reviews int default (0), -- Have a default value of 0
Page_id  VARCHAR(50) primary Key  );

-- 2. Insert some random 10 documents on above table

INSERT INTO Page_Columns ( Page_title, Description , Price , Avg_stars , Page_id ) 
VALUES  ('Test1', 'Description1' , 1007.01 , 4.1 , 1251  ),
( 'test2', 'Description2 ', 1010.01 , 4.0 , 1252  ),
( 'test3', 'Description3 ', 1020.01 , 3.0 , 1253  ),
( 'test4', 'Description4 ', 1020.01 , 2.0 , 1254  ),
( 'test5', 'Description5 ', 1030.01 , 1.0 , 1255  ),
( 'test6', 'Description6 ', 1040.01 , 2.2 , 1256  ),
('test7', 'Description7 ', 1050.01 , 4.4 , 1257   ),
(' test8', 'Description8 ', 1060.01 , 4.7 , 1258  ),
(' test9', 'Description9 ', 1007.01 , 4.8 , 1259  ),
(' test10', 'Description10 ', 1080.01 , 5.0 , 1260  );


 
 
/*
Create a table for page_model
Columns:
Page_id : String : Foreign Key references to Page table and Page_id column
Category : String : Don't allow categories other than Electronics, Sports, Automobile,
Beauty, Health_care, Food, Furniture, Politics, Society
*/



create table  page_model ( 
Page_id VARCHAR(20) Not Null , 
FOREIGN KEY (Page_id) REFERENCES Page_Columns(Page_id),
Category ENUM('Electronics', 'Sports', 'Automobile', 'Beauty', 
'Health_care', 'Food', 'Furniture', 'Politics', 'Society') NOT NULL
  ) ;


-- 4. Insert some random 10 documents on above table

INSERT INTO   page_model ( Category, Page_id ) 
VALUES  ('Sports',  1251  ),
( 'Beauty', 1252  ),
( 'Automobile', 1253  ),
( 'Beauty', 1254  ),
( 'Food',  1255  ),
( 'Politics', 1256  ),
('Food',  1257   ),
('Politics', 1258  ),
('Politics' , 1259  ),
('Society'  , 1260  );





/*
5. Create a table for Review
Columns:
Review_id : String : Don't allow duplication in this column
Review : String :
Reviewer_name : String :
Review star : Int : Don't allow user to insert document if more than 5
Review time : DATETIME :
Page_id : String : Foreign Key references to Page table and Page_id column
*/


create table  Review ( 
Review_id VARCHAR(20) Not Null ,
UNIQUE (Review_id),
Review VARCHAR(50) , 
Reviewer_name VARCHAR(50) , 
Review_time datetime,
Review_star int check (Review_star <=5),
Page_id VARCHAR(20) Not Null , 
FOREIGN KEY (Page_id) REFERENCES Page_Columns(Page_id)
  );

-- 6. Insert some random 10 documents on above table
INSERT INTO Review ( Review_id, Review , Reviewer_name , Review_time , Review_star , Page_id ) 
VALUES  ('Test1', 'Description1' , 'Ali' ,'2015-11-05 14:29:36', 4.1 , 1251  ),
( 'test2', 'Description2 ', 'Ali' ,'2015-11-05 14:29:36', 4.0 , 1252  ),
( 'test3', 'Description3 ', 'Ali' ,'2015-11-05 14:29:36', 3.0 , 1253  ),
( 'test4', 'Description4 ', 'Ali' ,'2015-11-05 14:29:36', 2.0 , 1254  ),
( 'test5', 'Description5 ', 'Ali' ,'2015-11-05 14:29:36', 1.0 , 1255  ),
( 'test6', 'Description6 ', 'Ali' ,'2015-11-05 14:29:36', 2.2 , 1256  ),
('test7', 'Description7 ', 'Ali' ,'2015-11-05 14:29:36', 4.4 , 1257   ),
(' test8', 'Description8 ', 'Ali' ,'2015-11-05 14:29:36', 4.7 , 1258  ),
(' test9', 'Description9 ', 'Ali' ,'2015-11-05 14:29:36', 4.8 , 1259  ),
(' test10', 'Description10 ', 'Ali' ,'2015-11-05 14:29:36', 5.0 , 1260  );


/*

7. Create a page for Review_model
Columns:
Review_id : String : Don't allow duplication in this column
Category : String : Don't allow categories other than Electronics, Sports, Automobile,
Beauty, Health_care, Food, Furniture, Politics, Society
Sentiment : String :
Attribute : String :


*/

create table  Review_model ( 
Review_id VARCHAR(20) Not Null ,
UNIQUE (Review_id),
Sentiment VARCHAR(50) , 
Attribute VARCHAR(50) , 
Category ENUM('Electronics', 'Sports', 'Automobile', 'Beauty',  'Health_care', 'Food', 'Furniture', 'Politics', 'Society') NOT NULL
  );
  
  
--  Insert some random 10 documents on above table 
 INSERT INTO Review_model ( Review_id, Sentiment , Attribute , Category ) 
VALUES  ('Test1', 'Good' ,'Attribute' , 'Sports'  ),
( 'test2', 'bad', 'Attribute' , 'Sports' ),
( 'test3', 'Good ', 'Attribute' , 'Sports' ),
( 'test4', 'bad ', 'Attribute' , 'Sports' ),
( 'test5', 'Good ', 'Attribute' , 'Sports'),
( 'test6', 'bad ', 'Attribute' ,'Society' ),
('test7', 'bad ', 'Attribute' , 'Society'  ),
(' test8', 'bad ', 'Attribute' , 'Society'),
(' test9', 'bad ', 'Attribute' , 'Society' ),
(' test10', 'bad ', 'Attribute' , 'Society' );
 
 -- 9. Write a command to add a extra column called "language" in the table 'Review_model'
  
  
ALTER TABLE Review_model
ADD language varchar(10);
