-- 1 Выберите только те строки из таблицы suppliers где company имеет значение Supplier A

USE northwind
SELECT * 
FROM suppliers
WHERE company = 'Supplier A';

-- 2 Вывести все строки там, где purchase_order_id не указано. При этом дополнительно создать столбец total_price как произведение quantity * unit_price


USE northwind;

SELECT *,
       quantity * unit_cost AS total_price
FROM purchase_order_details
WHERE purchase_order_id IS NULL;

-- Решение: таблица не была указана, но судя по колонкам, нужна была таблица purchase_order_details. В таблице нет колонки unit_price, но есть unit_cost (в запросе я исправила). Результат - пустая таблица с новой созданной колонкой, потому что purchase_order_id IS NULL нет в таблице. 


-- 3 Выведите какая дата будет через 51 день

USE northwind;

SELECT CURDATE() + INTERVAL 51 DAY AS date_after_51_days;

-- 4  Посчитайте количество уникальных заказов purchase_order_id

SELECT COUNT(DISTINCT purchase_order_id) AS unique_orders
FROM order_details;

-- 5 Выведите все столбцы таблицы order_details а также дополнительный столбец payment_method из таблицы purchase_orders Оставьте только заказы для которых известен payment_method

SELECT od.*, po.payment_method
FROM order_details od
JOIN purchase_orders po ON od.purchase_order_id = po.id
WHERE po.payment_method IS NOT NULL;

