DROP TABLE IF EXISTS PERSON;
select * from person;
CREATE TABLE PERSON (
                        ID INT NOT NULL AUTO_INCREMENT,
                        FIRST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
                        LAST_NAME VARCHAR2(255) NOT NULL DEFAULT '',
                        MOBILE VARCHAR2(20) NOT NULL DEFAULT '',
                        BIRTHDAY DATE DEFAULT NULL,
                        HOME_ID SMALLINT DEFAULT NULL,
                        PRIMARY KEY (ID));

ALTER TABLE PERSON
    ADD FOREIGN KEY (HOME_ID)
        REFERENCES HOME(ID);


DROP TABLE IF EXISTS HOME;

CREATE TABLE HOME (
                      ID INT NOT NULL AUTO_INCREMENT,
                      ADDRESS VARCHAR2(255) not null default '',
                      HOMENUMBER varchar2(255) NOT NULL DEFAULT '',
                      PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        title VARCHAR2(100) NOT NULL UNIQUE,
                        runtime SMALLINT NOT NULL,
                        genre VARCHAR2(50),
                        imdb_score NUMBER(10,1),
                        rating VARCHAR2(10)
);

-- Tables for in-class example

DROP TABLE IF EXISTS cars;

CREATE TABLE cars (
                      id INT NOT NULL AUTO_INCREMENT,
                      make VARCHAR2(50) NOT NULL DEFAULT '',
                      model VARCHAR2(50) NOT NULL DEFAULT '',
                      year VARCHAR2(5) NOT NULL DEFAULT '01907',
                      PRIMARY KEY (id),
                      CONSTRAINT unique_make_model_year UNIQUE (make, model, year)

);

DROP TABLE IF EXISTS auto_prices;

CREATE TABLE auto_prices (
                             id INT PRIMARY KEY AUTO_INCREMENT,
                             car_id INT REFERENCES cars(id),
                             package VARCHAR2(15) NOT NULL,
                             price NUMBER(10,2) NOT NULL CHECK(price > 0),
                             CONSTRAINT unique_package_per_car UNIQUE (car_id, package)


);


DROP SEQUENCE hibernate_sequence;

CREATE SEQUENCE hibernate_sequence;

INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('36 E. Bayberry Rd.Savannah, GA 31404', '565-6895');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('11 Essex Dr.Farmingdale, NY 11735', '454-4544');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('920 Arlington Street Clifton, NJ 07011', '985-4515');
INSERT INTO HOME (ADDRESS, HOMENUMBER) VALUES ('234 High Street, PA 19159 ', '267-3940');


INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID ) VALUES ('Carbral', 'Sheeri', '230-4233', '1970-02-23', 2);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID) VALUES ( 'Sharam', 'Raj', '186-5223', '1980-08-31', 3);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Durand', 'Noelle', '395-6161', '1960-07-06', 1);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Thomas', '395-6181', '1987-07-06', 1);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Smith', 'Jane', '393-6181', '1987-12-06', 3);
INSERT INTO PERSON ( LAST_NAME, FIRST_NAME, MOBILE, BIRTHDAY, HOME_ID)VALUES ('Brown', 'Doug', '466-6241', '1954-12-07', 3);
select * from HOME;

select * from movies;
INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('1', 'Howard the Duck', '110', 'Sci-Fi', '4.6', 'PG');
INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('2',  'Lavalantula',	'83',	'Horror',	'4.7',	'TV-14');

INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('3', 'Starship Troopers', '129',	'Sci-Fi',	'7.2',	'PG-13');

INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('4', 'Waltz With Bashir', '90', 'Documentary',	'8.0',	'R');

INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('5', 'Spaceballs',	'96',	'Comedy',	'7.1',	'PG');

INSERT INTO MOVIES(ID, TITLE, RUNTIME, GENRE, IMDB_SCORE, RATING)VALUES('6', 'Monsters Inc.',	'92',	'Animation',	'8.1', 'G');

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



