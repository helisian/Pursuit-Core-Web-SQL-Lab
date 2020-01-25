-- Exercise 1
SELECT title FROM movies;
SELECT director FROM movies;
SELECT title, director FROM movies;
SELECT title, year FROM movies;
SELECT * FROM movies;

-- Exercise 2
SELECT id, title FROM movies WHERE id=6;
SELECT title, year FROM movies WHERE year BETWEEN 2000 and 2010;
SELECT title, year FROM movies WHERE year NOT BETWEEN 2000 and 2010;
SELECT id, title, year FROM movies WHERE id BETWEEN 1 and 5;

-- Exercise 3
SELECT * FROM movies WHERE title LIKE "%Toy%"
SELECT * FROM movies WHERE director LIKE "%Lass%"
SELECT * FROM movies WHERE director NOT LIKE "%Lass%"
SELECT * FROM movies WHERE title LIKE "%Wall%"

--Exercise 4
SELECT DISTINCT director FROM movies ORDER BY director;
SELECT * FROM movies ORDER BY year DESC LIMIT 4;
SELECT * FROM movies ORDER BY title ASC LIMIT 5;
SELECT * FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;

--Exercise 5 Review 1
SELECT * FROM north_american_cities Where country="Canada";
SELECT * FROM north_american_cities Where country="United States" ORDER BY latitude DESC;
SELECT * FROM north_american_cities Where country="United States" ORDER BY latitude DESC;
SELECT city, longitude FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude ASC;
SELECT city, population FROM north_american_cities WHERE country = "Mexico" ORDER BY population DESC LIMIT 2;
SELECT city, population FROM north_american_cities WHERE country = "United States" ORDER BY population DESC LIMIT 2 OFFSET 2;

--Exercise 6
SELECT title, domestic_sales, international_sales 
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
SELECT title, domestic_sales, international_sales 
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
SELECT title, rating 
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
ORDER BY rating DESC

--Exercise 7
SELECT DISTINCT building_name FROM buildings
INNER JOIN employees ON buildings.building_name = employees.building;
SELECT building_name, capacity FROM buildings
SELECT DISTINCT building_name, role FROM buildings
LEFT JOIN employees ON buildings.building_name = employees.building;

--Exercise 8
SELECT * FROM employees WHERE building IS NULL
SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;

--Exercise 9
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

SELECT title, year
FROM movies
WHERE year%2 = 0

--Exercise 10
SELECT MAX(Years_employed) FROM employees;
SELECT role, AVG(Years_employed) FROM employees
GROUP BY role

SELECT building, role, SUM(Years_employed) FROM employees
GROUP BY building

--Exercise 11
SELECT COUNT(role) as Artist_Sum FROM employees
WHERE role = "Artist";

SELECT role, COUNT(role) AS count FROM employees
GROUP BY role

SELECT role, SUM(Years_employed) AS Total_Years FROM employees
Where role = "Engineer"

--Exercise 12
SELECT director, COUNT(Director) AS TotalMoviesDirected FROM movies
GROUP BY director

SELECT director, SUM(international_sales + domestic_sales) AS Total_Sales
FROM movies
JOIN boxoffice ON id = movie_id
GROUP BY director

--Exercise 13
INSERT INTO movies (title,director,year,length_minutes)
VALUES ("Toy Story 4", "Nilber Remon", 2020, 98);

INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);

--Exercise 14
UPDATE movies
SET Director = "John Lasseter"
WHERE title = "A Bug's Life"

UPDATE movies
SET year = 1999
WHERE title = "Toy Story 2"

UPDATE movies
SET title = "Toy Story 3",
    director = "Lee Unkrich"
WHERE title = "Toy Story 8"

--Exercise 15
DELETE FROM movies
WHERE year < 2005

DELETE FROM movies
WHERE director = "Andrew Stanton"

--Exercise 16
CREATE TABLE Database (
    name TEXT,
    version FLOAT,
    download_count INTEGER AUTOINCREMENT
)

--Exercise 17
ALTER TABLE movies
ADD Aspect_ratio FLOAT

ALTER TABLE movies
ADD Language TEXT DEFAULT English

--Exercise 18