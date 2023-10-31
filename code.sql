use northwind;

select * from northwind;

select ProductName, Unit from products where Price > 50;

select ProductName, Unit, SUM(Price * Quantity) as RevenuePrice from products
		join orderdetails on products.ProductID = Orderdetails.ProductID
        group by ProductName, Unit
        order by RevenuePrice desc
        limit 5;

select categories.CategoryID, count(distinct products.ProductID) as products from categories
	join products on categories.CategoryID = products.CategoryID
    group by categories.CategoryID
    order by products desc
    limit 5;