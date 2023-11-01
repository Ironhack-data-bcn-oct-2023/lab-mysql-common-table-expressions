USE northwind;

-- ## 1. Write a CTE that lists the names and quantities of products with a unit price greater than $50.

SELECT productname , unit FROM products WHERE price > 50; 

-- ## 2. What are the top 5 most profitable products?
-- products - orderdetails - orders
-- productname - product_id - order_id

SELECT products.ProductID, ProductName, SUM(orderdetails.Quantity * products.Price) AS TotalProfit FROM products
	JOIN orderdetails  ON products.ProductID = orderdetails.ProductID
		JOIN orders ON orderdetails.OrderID = orders.OrderID
			GROUP BY products.ProductID, products.ProductName 
				ORDER BY TotalProfit DESC LIMIT 5;

SELECT productname FROM products
	WHERE product_id in (SELECT product_id FROM orderdetails WHERE order_id);

-- ## 3. Write a CTE that lists the top 5 categories by the number of products they have.

SELECT categoryname FROM categories
WHERE category_ID in (SELECT category_id FROM products WHERE count(unit));

-- ## 4. Write a CTE that shows the average order quantity for each product category.

-- # 5. Create a CTE to calculate the average order amount for each customer.

-- # 6. Sales Analysis with CTEs: Assume we have the Northwind database which contains tables like Orders, OrderDetails, and Products. Create a CTE that calculates the total sales for each product in the year 1997.