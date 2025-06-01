-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника

SELECT department_id
FROM employees
WHERE id = 2;


-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.

DELIMITER $$

CREATE PROCEDURE get_employee_age(
    IN emp_id INT,
    OUT emp_age INT
)
BEGIN
    SELECT age
    INTO emp_age
    FROM employees
    WHERE id = emp_id;
END $$

DELIMITER ;

-- Вызываем результат
SET @age = 0;
CALL get_employee_age(2, @age);
SELECT @age AS employee_age;

-- 3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.

DELIMITER $$

CREATE PROCEDURE increase_salary(
    INOUT salary_by_emp DECIMAL(10, 2)
)
BEGIN
    SET salary_by_emp = salary_by_emp * 0.9;
END $$

DELIMITER ;

-- переменная
SET @salary = 48000.00;

-- Вызов процедуры
CALL increase_salary(@salary);

-- посмотреть результат
SELECT @salary AS new_salary;




