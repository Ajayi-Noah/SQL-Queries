<<<<<<< HEAD
=======
-- 17/08/2026
>>>>>>> a0c7d06422dc80235207718672dac453b967f657
-------------------------------
--CATEGORY PRICE RANKING
-------------------------------
SELECT 
	P.name,
	p.category,
	P.price,
ROUND(AVG(P.price) OVER(PARTITION BY P.category),2) as Price_average,
DENSE_RANK () OVER(PARTITION BY P.category ORDER BY P.price DESC) AS Category_Price_ranking
FROM products P;

------------------------------------
--MOST EXPENSIVE PRODUCT BY CATEGORY
------------------------------------

WITH CATEGORY_PRICE_RANKING AS (
SELECT 
	P.name,
	p.category,
	P.price,
ROUND(AVG(P.price) OVER(PARTITION BY P.category),2) as Price_average,
DENSE_RANK () OVER(PARTITION BY P.category ORDER BY P.price DESC) AS Category_Price_ranking
FROM products P
)

SELECT *
FROM CATEGORY_PRICE_RANKING CPR
WHERE CPR.Category_Price_ranking = 1;
