CREATE DATABASE db_movies
USE db_movies;

CREATE TABLE tbl_movies
(
	movie_id VARCHAR(50) PRIMARY KEY NOT NULL,
	movie_release VARCHAR(50) NOT NULL,
	movie_score INT NOT NULL
);

INSERT INTO tbl_movies
	(movie_id, movie_release, movie_score)
	VALUES
	('Guardians of the Galaxy', '2014-8-1', 90),
	('Ip Man', '2010-10-1', 80),
	('John Wick 4', '2023-3-24', 93),
	('Tenet', '2020-9-3', 73),
	('Super Mario Bros. Movie', '2023-4-5', 95)
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

CREATE TABLE tbl_directors
(
	director_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	director_name VARCHAR(50) NOT NULL,
	director_movie VARCHAR(50) NOT NULL CONSTRAINT fk_director_movie_id FOREIGN KEY REFERENCES tbl_movies(movie_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_directors
	(director_name, director_movie)
	VALUES
	('Wilson Yip', 'Ip Man'),
	('James Gunn', 'Guardians of the Galaxy'),
	('Chad Stahelski', 'John Wick 4'),
	('Christopher Nolan', 'Tenet'),
	('Aaron Horvath', 'Super Mario Bros. Movie')
;
SELECT * FROM tbl_directors;

SELECT movie_id AS 'Movie', movie_release AS 'Release Date', movie_score 'Movie Score', director_name AS 'Director', actor_name AS 'Actor'
FROM tbl_movies
INNER JOIN tbl_actors ON movie_id = actor_movie
INNER JOIN tbl_directors ON movie_id = director_movie;

DROP TABLE tbl_directors;
DROP TABLE tbl_actors;
DROP TABLE tbl_movies;
