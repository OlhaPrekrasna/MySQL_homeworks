-- Создать кастомные функции
-- 1. Функция для расчета площади круга

DELIMITER //

CREATE FUNCTION func_circle_area(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE circleArea DOUBLE;
    SET circleArea = PI() * POW(radius, 2);
    RETURN circleArea;
END //

DELIMITER ;

SELECT func_circle_area(7) AS CircleArea;

-- 2. Функция для расчета гипотенузы треугольника

DELIMITER //

CREATE FUNCTION func_hypotenuse(a DOUBLE, b DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE hypotenuse DOUBLE;
    SET hypotenuse = SQRT(POW(a, 2) + POW(b, 2));
    RETURN hypotenuse;
END //

DELIMITER ;

SELECT func_hypotenuse(5, 8) AS Hypotenuse;
