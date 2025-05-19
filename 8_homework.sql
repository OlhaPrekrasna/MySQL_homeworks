-- 1 Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM Printer
WHERE color = 'y';


-- 2 Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT p.model, pc.price
FROM product p
JOIN pc ON p.model = pc.model
WHERE p.maker = 'B'

UNION

SELECT p.model, l.price
FROM product p
JOIN laptop l ON p.model = l.model
WHERE p.maker = 'B'

UNION

SELECT p.model, pr.price
FROM product p
JOIN printer pr ON p.model = pr.model
WHERE p.maker = 'B';


-- 3 Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT DISTINCT maker
FROM product
WHERE type = 'PC'
  AND maker NOT IN (
      SELECT maker
      FROM product
      WHERE type = 'Laptop');
      
      -- ??? Как правильно написать кодом "но не"? Можно ли через != и тогда без подзапроса?

-- 4 Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT p.maker
FROM product p
JOIN pc ON p.model = pc.model
WHERE pc.speed >= 450;


-- 5 Найдите среднюю скорость ПК.

SELECT AVG(speed) AS avg_pc_speed
FROM pc;


-- 6 Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
-- Вывести: maker, средний размер экрана.

SELECT p.maker, AVG(l.screen) AS avg_laptop_screen
FROM product p
JOIN laptop l ON p.model = l.model
GROUP BY p.maker;





