create database retail_transaction
use retail_transaction

SELECT COUNT(DISTINCT customer_id) as Customer
FROM cleaned

SELECT SUM(before_discount) as Revenue
FROM cleaned

SELECT SUM(before_discount) - SUM(cogs) as Profit
FROM cleaned

SELECT SUM(discount_amount) as Discount
FROM cleaned

-- Transaction Per Payment
SELECT
		payment_method,
		count(DISTINCT qty_ordered) as total_quantity
FROM cleaned
GROUP BY 1
ORDER BY 2 DESC

-- Value per Payment
SELECT
		payment_method,
        SUM(before_discount) as value_payment
FROM cleaned
GROUP BY 1
ORDER BY 2 DESC

-- Transaction Per Category
SELECT
		category,
        count(DISTINCT qty_ordered) as total_quantity
FROM cleaned
GROUP BY 1
ORDER BY 2 DESC

-- Value per Category
SELECT
		category,
        SUM(before_discount) as value_payment
FROM cleaned
GROUP BY 1
ORDER BY 2 DESC

-- Trend Sales
SELECT
    category,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN before_discount ELSE 0 END) AS sales_2021,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2022 THEN before_discount ELSE 0 END) AS sales_2022,
    CASE 
        WHEN 
            SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN before_discount ELSE 0 END) 
            > 
            SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2022 THEN before_discount ELSE 0 END)
        THEN 'Penurunan'
        WHEN 
            SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2021 THEN before_discount ELSE 0 END) 
            < 
            SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2022 THEN before_discount ELSE 0 END)
        THEN 'Kenaikan'
        ELSE 'Tetap'
    END AS sales_trend
FROM cleaned
GROUP BY category;

-- Product Summary
SELECT
    sku_name,
    SUM(before_discount) AS total_sales,
    SUM(price) AS total_price,
    SUM(discount_amount) AS total_discount,  -- Aggregating discount
    SUM(before_discount) - SUM(cogs) AS profit
FROM cleaned
GROUP BY sku_name
ORDER BY 2 DESC

SELECT
    customer_id,
    SUM(before_discount) AS total_sales,
    SUM(price) AS total_price,
    SUM(discount_amount) AS total_discount,  -- Aggregating discount
    SUM(before_discount) - SUM(cogs) AS profit
FROM cleaned
GROUP BY customer_id
ORDER BY 2 DESC

