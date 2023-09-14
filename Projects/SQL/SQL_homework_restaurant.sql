.open restaurant.db
  
-- table 1
/*CREATE TABLE customers (
  customer_id int,
  customer_name text,
  city text
);*/

/*INSERT INTO  customers VALUES 
  (1, 'Numechi', 'BKK'),
  (2, 'Lisa', 'BKK'),
  (3, 'Durkio', 'NEWYORK'),
  (4, 'Walker', 'LONDON'),
  (5, 'Miya', 'BKK');*/

-- table 2
/*CREATE TABLE menus (
  menu_id int,
  menu_name text,
  price real 
);*/

/*INSERT INTO menus VALUES 
  (1, 'Spaghetti With Eggplant Caponata', 379.00),
  (2, 'Spaghetti al Limone With Asparagus', 275.50),
  (3, 'Lobster Pasta', 789.80),
  (4, 'Creamy Mushroom Pasta', 255.00),
  (5, 'Red Wine Spaghetti', 367.50);*/

-- table 3
/*CREATE TABLE IF NOT EXISTS transactions (
  transaction_id int,
  customer_id int,
  menu_id int,
  transaction_date datetime
);*/

/*INSERT INTO transactions VALUES 
  (1, 1, 1, '2023-05-11'),
  (2, 2, 2, '2023-04-18'),
  (3, 3, 3, '2023-03-22'),
  (4, 4, 5, '2023-02-08'),
  (5, 5, 4, '2023-01-12'),
  (6, 3, 1, '2022-12-14'),
  (7, 1, 5, '2022-05-19'),
  (8, 2, 5, '2022-04-23'),
  (9, 3, 2, '2022-03-03'),
  (10, 1, 3, '2022-01-01');*/

.table
.mode column 
  
-- Checking data in the tables
/*SELECT * FROM customers;
SELECT * FROM menus;
SELECT * FROM transactions;*/

-- join all table
/*SELECT 
  cm.customer_name,
  cm.city,
  tr.transaction_date,
  mn.menu_name,
  mn.price
FROM customers cm
JOIN transactions tr
  ON cm.customer_id = tr.customer_id
JOIN menus mn 
  ON tr.menu_id = mn.menu_id;*/

-- what is menu selling the most ?
SELECT 
  mn.menu_name,
  COUNT(mn.price) n_sell
FROM customers cm
JOIN transactions tr
  ON cm.customer_id = tr.customer_id
JOIN menus mn 
  ON tr.menu_id = mn.menu_id
GROUP BY 1
ORDER BY 2 DESC;

-- who is the most pay in BKK ?
SELECT 
  sub1.customer_name,
  sub1.city,
  SUM(sub3.price) total_pay
FROM ( SELECT * FROM customers 
       WHERE city = 'BKK') sub1
JOIN ( SELECT * FROM transactions ) sub2
  ON sub1.customer_id = sub2.customer_id
JOIN ( SELECT * FROM menus ) sub3
  ON sub2.menu_id = sub3.menu_id
GROUP BY 1
ORDER BY 3 DESC;



-- customer ranking  
WITH sub1 AS ( SELECT * FROM customers ),
     sub2 AS ( SELECT * FROM transactions),
     sub3 AS ( SELECT * FROM menus )

SELECT 
  sub1.customer_name,
  sub1.city,
  SUM(sub3.price) total_pay,
  CASE 
    WHEN SUM(sub3.price) >= 1500.0 THEN 'Platinum'
    WHEN SUM(sub3.price) >= 1000.0 THEN 'Gold'
    WHEN SUM(sub3.price) >= 500.0 THEN 'Silver'
    ELSE 'Bronze'
  END customer_ranking
FROM sub1 
JOIN sub2 
  ON sub1.customer_id = sub2.customer_id
JOIN sub3
  ON sub2.menu_id = sub3.menu_id
GROUP BY 1
ORDER BY 3 DESC;
