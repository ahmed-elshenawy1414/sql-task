-- CREATE DATABASE
CREATE DATABASE movie_db;
USE movie_db;

-- ACTOR
CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname VARCHAR(20),
    act_lname VARCHAR(20),
    act_gender CHAR(1)
);

-- DIRECTOR
CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname VARCHAR(20),
    dir_lname VARCHAR(20)
);

-- MOVIE
CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country VARCHAR(5)
);

-- REVIEWER
CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30)
);

-- GENRES
CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20)
);

-- MOVIE_DIRECTION
CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

-- MOVIE_CAST
CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role VARCHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

-- MOVIE_GENRES
CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

-- RATING
CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);