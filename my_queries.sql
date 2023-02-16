/*1. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, 
but exclude duplicates from the answer.*/
SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;

/*2. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective 
average city populations (CITY.Population) rounded down to the nearest integer. Note: CITY.CountryCode and COUNTRY.Code 
are matching key columns.*/
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

/*3. Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the 
NAMES of those students who received a grade lower than 8. The report must be in descending order by grade - i.e.
higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order 
those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name 
and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned 
to them, order those particular students by their marks in ascending order. Write a query to help Eve.*/
SELECT STUDENTS.NAME, GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS, GRADES
WHERE GRADES.GRADE > 7
AND STUDENTS.MARKS
BETWEEN GRADES.MIN_MARK
AND GRADES.MAX_MARK
ORDER BY GRADES.GRADE DESC, STUDENTS.NAME;

SELECT 'NULL', GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS, GRADES
WHERE GRADES.GRADE < 8
AND STUDENTS.MARKS
BETWEEN GRADES.MIN_MARK
AND GRADES.MAX_MARK
ORDER BY GRADES.GRADE DESC, STUDENTS.MARKS;

/*4. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT SUM(CITY.Population)
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'ASIA';

/*5. Query all columns for a city in CITY with the ID 1661.*/
SELECT *
FROM CITY
WHERE ID = 1661;

/*6.Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries
in the table.*/
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

/*7. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
(i.e: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes
first when ordered alphabetically.*/
SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) = (SELECT MIN(LENGTH(CITY))
                      FROM STATION)
ORDER BY CITY LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) = (SELECT MAX(LENGTH(CITY))
                      FROM STATION)
ORDER BY CITY LIMIT 1;

/*8. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot 
contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%')
OR (CITY LIKE 'E%')
OR (CITY LIKE 'I%')
OR (CITY LIKE 'O%')
OR (CITY LIKE 'U%');

/*9. Query the list of CITY names ending with vowels(a, e, i, o, u) from STATION. Your result cannot contain 
duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE '%A')
OR (CITY LIKE '%E')
OR (CITY LIKE '%I')
OR (CITY LIKE '%O')
OR (CITY LIKE '%U');

/*10. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and 
last characters. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%'
OR CITY LIKE 'E%'
OR CITY LIKE 'I%'
OR CITY LIKE 'O%'
OR CITY LIKE 'U%')
AND 
(CITY LIKE '%A'
OR CITY LIKE '%E'
OR CITY LIKE '%I'
OR CITY LIKE '%O'
OR CITY LIKE '%U');

/*11. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%A'
AND CITY NOT LIKE '%E'
AND CITY NOT LIKE '%I'
AND CITY NOT LIKE '%O'
AND CITY NOT LIKE '%U';

/*12. Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three
characters of each name. If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID*/
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3), ID;

/*13. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having 
a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending 
employee_id.*/
SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;

/*14. Query a count of the number of cities in CITY having a Population larger than 100,000.*/
SELECT COUNT(NAME)
FROM CITY
WHERE POPULATION > 100000;

/*15. Query the total population of all cities in CITY where District is California.*/
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

/*16. Query the average population of all cities in CITY where District is California.*/
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = "California";

/*17. Query the following two values from the STATION table:
1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.*/
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM STATION;

/*18. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and 
less than 137.2345. Truncate your answer to 4 decimal places.*/
SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880
AND LAT_N < 137.2345;

/*19. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate 
your answer to 4 decimal places.*/
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

/*20. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is
less than 137.2345. Round your answer to 4 decimal places.*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N)
               FROM STATION
               WHERE LAT_N < 137.2345);

/*21. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 35.7780, Round your answer
to 4 decimal places*/
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
               FROM STATION
               WHERE LAT_N > 38.7780);

/*22. Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater
than 38.7780. Round your answer to 4 decimal places.*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N)
               FROM STATION 
               WHERE LAT_N > 38.7788);

/*23. Consider P1 (a, b) and P2 (c, d) to be two points on a 2D plane.
• a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
• b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
• c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
• d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.*/
SELECT ROUND((MAX(LAT_N) - MIN (LAT_N) + MAX (LONG_W) - MIN (LONG_W)), 4)
FROM STATION;


