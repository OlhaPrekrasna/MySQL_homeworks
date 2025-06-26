-- Подключитесь к базе данных hr (которая находится на удаленном сервере). 

USE hr;

-- Выведите количество сотрудников в базе

SELECT COUNT(*) AS count_of_employees 
FROM employees;

-- Выведите количество департаментов (отделов) в базе

SELECT COUNT(*) AS count_of_departments 
FROM departments;

-- Подключитесь к базе данных World (которая находится на удаленном сервере). 

USE world;

-- Выведите среднее население в городах Индии (таблица City, код Индии - IND)

SELECT AVG(Population) AS avg_population_ind
FROM city
WHERE CountryCode = 'IND';

-- Выведите минимальное население в индийском городе и максимальное.

SELECT 
  MIN(Population) AS min_population_ind_city,
  MAX(Population) AS max_population_ind_city
FROM city
WHERE CountryCode = 'IND';

-- Выведите самую большую площадь территории. 

SELECT Name, SurfaceArea
FROM country
ORDER BY SurfaceArea DESC
LIMIT 1;

-- Выведите среднюю продолжительность жизни по странам. 

SELECT AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
WHERE LifeExpectancy IS NOT NULL;


-- Найдите самый населенный город (подсказка: использовать подзапросы)

SELECT Name, Population
FROM city
WHERE Population = (
    SELECT MAX(Population)
    FROM city);

