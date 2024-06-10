SELECT* FROM pizza_sales

SELECT ROUND(SUM(total_price),2) AS total_revenue FROM pizza_sales

SELECT (SUM(total_price)/COUNT(DISTINCT order_id)) AS Avg_ord_val FROM pizza_sales

SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS avg_pizza_per_order FROM pizza_sales 

SELECT DATENAME(DW,order_date) AS order_day,COUNT(DISTINCT order_id) AS Total_Orders_Daywise FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

SELECT DATENAME(MONTH,order_date) AS order_month,COUNT(DISTINCT order_id) AS Total_Orders_monthwise FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date) 
ORDER BY Total_Orders_monthwise DESC


SELECT pizza_category,ROUND(SUM(total_price),2) AS total_sales,
SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS percentage_sales_cat 
FROM pizza_sales
WHERE DATEPART(MONTH,order_date) = 1
GROUP BY pizza_category


SELECT* FROM pizza_sales


SELECT pizza_size,ROUND(SUM(total_price),2) AS tot_price_size,
ROUND(SUM(total_price)*100/(SELECT SUM(total_price)
FROM pizza_sales WHERE DATEPART(QUARTER,order_date) = 1),2) AS perc_sales_size
FROM pizza_sales
WHERE DATEPART(QUARTER,order_date) = 1
GROUP BY pizza_size

SELECT* from pizza_sales

SELECT TOP 5 pizza_name,SUM(total_price) AS Total_sales FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_sales DESC

SELECT TOP 5 pizza_name,SUM(total_price) AS Total_sales FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_sales ASC


SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC


SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders asc
