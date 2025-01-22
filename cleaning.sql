use [Retail Company DB];

SELECT * FROM retail_sales;

SELECT 
    id, 
    customer_id,
    COUNT(*) AS Jumlah_Duplikasi
FROM 
    retail_sales
GROUP BY 
    id, customer_id
HAVING 
    COUNT(*) > 1;

DELETE FROM retail_sales
WHERE price <= 0;
select * from retail_sales;

UPDATE retail_sales
SET discount_amount = ABS(discount_amount)
WHERE discount_amount < 0;

SELECT 
	SUM (before_discount) AS Revenue 
FROM
	retail_sales;

SELECT 
    SUM((base_price - cogs) * qty_ordered) AS Total_Profit
FROM 
    retail_sales;

SELECT COUNT( DISTINCT customer_id) AS Total_Customer
FROM
	retail_sales;

	SELECT COUNT( DISTINCT id) AS Total_Pesanan
	FROM
		retail_sales;

	SELECT COUNT(id) FROM retail_sales;

SELECT SUM(discount_amount) AS Total_Discount
FROM
	retail_sales;

SELECT SUM(qty_ordered) AS Quantity
FROM
	retail_sales;