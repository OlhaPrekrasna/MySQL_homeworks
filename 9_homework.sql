-- Таблица purchase_order_details
-- 1 Для каждого заказа order_id выведите минимальный, максмальный и средний unit_cost

-- через GROUP BY
SELECT 
    purchase_order_id,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost,
    AVG(unit_cost) AS avg_unit_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id;

-- через оконную функцию
SELECT 
    purchase_order_id,
    MIN(unit_cost) OVER (PARTITION BY purchase_order_id),
    MAX(unit_cost) OVER (PARTITION BY purchase_order_id),
    AVG(unit_cost) OVER (PARTITION BY purchase_order_id)
FROM
    purchase_order_details;

-- 2 Оставьте только уникальные строки из предыдущего запроса
-- Использую оконные функции, чтобы не потерять записи из таблицы и вывести все уникальные строки (GROUP BY не выведет все строки)

SELECT DISTINCT purchase_order_id, quantity,
MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM purchase_order_details;

-- через GROUP BY
SELECT 
    purchase_order_id,
    quantity,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost,
    AVG(unit_cost) AS avg_unit_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id, quantity
ORDER BY purchase_order_id;

-- 3 Посчитайте стоимость продукта в заказе как quantity*unit_cost Выведите суммарную стоимость продуктов с помощью оконной функции Сделайте то же самое с помощью GROUP BY

-- оконная функция

SELECT purchase_order_id, product_id, quantity, unit_cost,
quantity * unit_cost AS total_product_cost,
SUM(quantity * unit_cost) OVER (PARTITION BY purchase_order_id) AS sum_of_product_cost
FROM purchase_order_details;

-- через GROUP BY

SELECT 
    purchase_order_id,
    SUM(quantity * unit_cost) AS total_product_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id;

-- 4 Посчитайте количество заказов по дате получения и posted_to_inventory Если оно превышает 1 то выведите '>1' в противном случае '=1' Выведите purchase_order_id, date_received и вычисленный столбец

SELECT purchase_order_id, date_received, posted_to_inventory,
CASE
WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1
THEN '>1'
ELSE '=1'
END AS count_of_orders_quantity
FROM purchase_order_details;





