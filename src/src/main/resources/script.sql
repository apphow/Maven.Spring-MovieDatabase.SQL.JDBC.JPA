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

