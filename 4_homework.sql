-- 1 Подключитесь к своей базе данных созданной на уроке
USE 131224_Prekrasnaya;

-- 2 Создайте таблицу, которая отражает погоду в Вашем городе за последние 5 дней и включает следующее столбцы

-- Id - первичный ключ, заполняется автоматически

-- Дата - не может быть пропуском

-- Дневная температура - целое число, принимает значения от -30 до 30

-- Ночная температура - целое число, принимает значения от -30 до 30

-- Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца
CREATE TABLE weather_in_eltmann (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    day_temp INT CHECK (day_temp BETWEEN - 30 AND 30),
    night_temp INT CHECK (night_temp BETWEEN - 30 AND 30),
    wind_speed DECIMAL(3 , 2 ) CHECK (wind_speed >= 0)
);

-- 3 Заполните таблицу 5 строками - за последние 5 дней 
INSERT INTO weather_in_eltmann (date, day_temp, night_temp, wind_speed) VALUES
(CURDATE() - INTERVAL 4 DAY, 15, 5, 1.5),
(CURDATE() - INTERVAL 3 DAY, 18, 7, 3.0),
(CURDATE() - INTERVAL 2 DAY, 17, 6, 4.5),
(CURDATE() - INTERVAL 1 DAY, 20, 10, 5.5),
(CURDATE(), 22,11, 0.5);

-- 4 Увеличьте значения ночной температуры на градус если скорость ветра не превышала 3 м/с
UPDATE weather_in_eltmann 
SET 
    night_temp = night_temp + 1
WHERE
    wind_speed <= 3.0;

-- 5 На основе полученной таблицы создайте представление в своей базе данных - включите все строки Вашей таблицы и дополнительно рассчитанные столбцы

-- Средняя суточная температура - среднее арифметическое между ночной и дневной температурами

-- Столбец на основе скорости ветра - если скорость ветра не превышала 2 м/с то значение ‘штиль’, от 2 включительно до 5 - ‘умеренный ветер’, в остальных случаях - ‘сильный ветер’
CREATE VIEW view_weather_in_eltmann AS
SELECT
	id,
	date,
	day_temp,
	night_temp,
	wind_speed,
	(day_temp + night_temp) / 2 AS avg_temp,
	CASE
		WHEN wind_speed < 2 THEN 'штиль'
		WHEN wind_speed >= 2 AND wind_speed < 5 THEN 'умеренный ветер'
		ELSE 'сильный ветер'
	END AS wind_category
FROM weather_in_eltmann;




