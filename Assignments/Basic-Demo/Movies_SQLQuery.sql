CREATE DATABASE db_movies
USE db_movies;

CREATE TABLE tbl_movies
(
	movie_id VARCHAR(50) PRIMARY KEY NOT NULL,
	movie_director VARCHAR(50) NOT NULL
);

INSERT INTO tbl_movies
	(movie_id, movie_director)
	VALUES
	('Guardians of the Galaxy', 'James Gunn'),
	('Ip Man', 'Wilson Yip'),
	('John Wick 4', 'Chad Stahelski'),
	('Tenet', 'Christopher Nolan'),
	('Super Mario Bros. Movie', 'Aaron Horvath')
;
SELECT * FROM tbl_movies;

CREATE TABLE tbl_actors
(
	actor_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	actor_name VARCHAR(50) NOT NULL,
	actor_movie VARCHAR(50) NOT NULL CONSTRAINT fk_movie_id FOREIGN KEY REFERENCES tbl_movies(movie_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_actors
	(actor_name, actor_movie)
	VALUES
	('Donny Yen', 'Ip Man'),
	('Zoe Saldana', 'Guardians of the Galaxy'),
	('Chris Pratt', 'Guardians of the Galaxy'),
	('Keanu Reeves', 'John Wick 4'),
	('Donny Yen', 'John Wick 4'),
	('Micheal Caine', 'Tenet'),
	('Chris Pratt', 'Super Mario Bros. Movie')
	;
SELECT * FROM tbl_actors;

SELECT movie_id, movie_director, actor_name
FROM tbl_movies
INNER JOIN tbl_actors ON movie_id = actor_movie;