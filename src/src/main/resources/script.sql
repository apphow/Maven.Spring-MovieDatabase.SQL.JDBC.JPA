Select * from movies where genre = 'Sci-Fi';
SELECT * from movies where IMDB_Score >= 6.5;
SELECT * from movies where rating = 'G' and runtime < 100 or rating = 'PG' and runtime < 100;
Select * from movies where genre = 'Sci-Fi';
SELECT * from movies where IMDB_Score >= 6.5;
SELECT * from movies where rating = 'G' and runtime < 100 or rating = 'PG' and runtime < 100;
Select AVG(Runtime) From movies where IMDB_Score < 7.5 group by Genre;
Update movies set rating = 'R' where Title = 'Starship Troopers';
Select  rating, title, genre from movies where genre in ('Horror', 'Documentary');
Select AVG(IMDB_Score), MAX(IMDB_Score), MIN(IMDB_Score) from movies;
Select rating, AVG(IMDB_Score), MAX(IMDB_Score), MIN(IMDB_Score) from movies group by rating;
Select rating, count(*), AVG(IMDB_Score), MAX(IMDB_Score), MIN(IMDB_Score) from movies group by rating having count(*) > 1;
delete from movies where rating = "R";

Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Howared the Duck', 	110, 	'Sci-Fi',	4.6, 'PG');
Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Lavantula', 	83, 	'Horror',	4.7, 'TV-14');
Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Starship Troopers', 	129, 	'Sci-Fi',	7.2, 'PG-13');
Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Waltz With Bashir', 	90, 	'Documentary',	8.0, 'R');
Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Spaceballs', 	96, 	'Comedy',	7.1, 'PG');
Insert Into Moves(Title, Runtime, Genre, IMDB_Score, Rating) VALUES('Monsters Inc.', 	92, 	'Animation',	8.1, 'G');


select * from PEOPLE;
Create table HOME(ADDRESS VARCHAR(255), HOMENUMBER VARCHAR(255));
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('36 E. Bayberry Rd.Savannah, GA 31404', '565-6895');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('11 Essex Dr.Farmingdale, NY 11735', '454-4544');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('920 Arlington Street Clifton, NJ 07011', '985-4515');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('234 High Street, PA 19159 ', '267-3940');

DROP TABLE PEOPLE;
CREATE TABLE PEOPLE(LAST_NAME VARCHAR(255), FIRST_NAME VARCHAR(255), MOBILE VARCHAR(255), BIRTHDAY VARCHAR(255), HOME_ID INT);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID ) VALUES ('Carbral', 'Sheeri', '230-4233', '1970-02-23', 2);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID) VALUES ( 'Sharam', 'Raj', '186-5223', '1980-08-31', 3);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Durand', 'Noelle', '395-6161', '1960-07-06', 1);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Thomas', '395-6181', '1987-07-06', 1);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Jane', '393-6181', '1987-12-06', 3);
INSERT INTO PEOPLE ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Brown', 'Doug', '466-6241', '1954-12-07', 3);


INSERT INTO PEOPLE (LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY)
VALUES ('Smith', 'John', '230-4293', '1973-01-23');

SELECT * FROM PEOPLE;

ALTER TABLE people
    ADD PRIMARY KEY(LAST_NAME);

UPDATE PEOPLE SET ID = 7 WHERE FIRST_NAME = 'John';

UPDATE PEOPLE SET MOBILE = '152-9854' WHERE LAST_NAME = 'Smith';

UPDATE PEOPLE SET ID = 4 WHERE LAST_NAME = 'TONY';

UPDATE people SET mobile = '333-3333', last_name = 'Johnson'
WHERE first_name = 'Noelle' OR first_name = 'Raj';

SELECT * FROM PEOPLE;

SELECT COUNT(HOMENUMBER) FROM HOME;

SELECT HOMENUMBER FROM HOME WHERE ID = 1;

SELECT COUNT(*) FROM HOME;

SELECT COUNT(DISTINCT last_name) FROM PEOPLE;

SELECT  SUM(ID), AVG(ID) FROM PEOPLE;

SELECT SUM(ID) AS sum, AVG(ID) AS avg FROM PEOPLE;

SELECT MIN(birthday) FROM PEOPLE;

SELECT UPPER (FRIST_NAME), LOWER(LAST_NAME) FROM PEOPLE;

SELECT REPLACE(LAST_NAME, 'a', '1') FROM PEOPLE;

SELECT LAST_NAME FROM PEOPLE;

INSERT INTO people (FIRST_NAME, LAST_NAME, MOBILE)
VALUES ('Otto', 'Von Count', '656-6548');

SELECT CONCAT(FIRST_NAME, LAST_NAME) FROM people
WHERE LAST_NAME = 'Smith';

SELECT CONCAT(first_name, ' ', last_name)
FROM people
WHERE last_name = 'Smith';

SELECT CONCAT_WS(' ',first_name, last_name, mobile)
FROM people WHERE last_name= 'Smith';

SELECT HOMENUMBER, LEFT(HOMENUMBER, 3), RIGHT(HOMENUMBER, 2) FROM HOME;

SELECT LENGTH(address), CHAR_LENGTH(address) FROM HOME;

CREATE TABLE length_test (string varchar(10) );

INSERT INTO length_test VALUES ('$'),('€');

SELECT string, LENGTH(string), CHAR_LENGTH(string) FROM length_test;

SELECT first_name, last_name, YEAR(birthday) FROM people WHERE birthday >= '1970-07-06' AND birthday<='1987-07-06';

SELECT first_name, birthday FROM people WHERE first_name='Thomas' OR first_name='Raj' OR first_name='Sheeri';

SELECT first_name, birthday FROM people WHERE first_name IN ('Noelle', 'Thomas', 'Raj');


SELECT first_name FROM PEOPLE WHERE RIGHT(first_name,1)='e';

SELECT first_name FROM people WHERE first_name LIKE '%j';

SELECT first_name FROM people WHERE first_name LIKE '%o%';

SELECT first_name FROM people WHERE first_name NOT LIKE '%o%';

SELECT COUNT(*) FROM PEOPLE;

SELECT last_name, COUNT(*) FROM people GROUP BY last_name;

SELECT last_name, GROUP_CONCAT(mobile) FROM PEOPLE GROUP BY last_name;

SELECT last_name, GROUP_CONCAT(mobile SEPARATOR ' and ') FROM people GROUP BY last_name;

SELECT last_name, GROUP_CONCAT(mobile SEPARATOR ' and ') FROM people GROUP BY last_name  HAVING COUNT(*)>1;

SELECT last_name, GROUP_CONCAT(mobile SEPARATOR ' and ') FROM people WHERE last_name != 'Cabral' GROUP BY last_name  HAVING COUNT(*)>1;


SELECT first_name, birthday FROM people ORDER BY birthday;

SELECT first_name, birthday FROM people ORDER BY birthday DESC;

SELECT first_name, last_name FROM people ORDER BY last_name, first_name;

SELECT first_name, birthday FROM people ORDER BY birthday DESC LIMIT 3;

SELECT first_name, MONTHNAME(birthday) as mon, birthday FROM people ORDER BY MONTH(birthday);

SELECT last_name, COUNT(*) FROM  people GROUP BY last_name;

SELECT last_name, COUNT(*) FROM  people GROUP BY last_name ORDER BY NULL;


INSERT INTO people (first_name, last_name, birthday, home_id)
VALUES
('John', 'Smith', '1998-04-07', 4),
('Maya', 'Wasserman' , NULL, 4),
('Paul', 'Thompson', '1996-05-27', 1);

SELECT * FROM people;

INSERT INTO people (first_name, last_name, birthday)
VALUES ('Eli', 'Kramer', '1984-01-15');

SELECT * FROM people;

SELECT * FROM home;


