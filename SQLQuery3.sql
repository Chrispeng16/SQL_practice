
--1. List all cities that have both Employees and Customers
select distinct E.City 
from Employees E
where E.City IN (select distinct c.City from Customers c)

--2. List all cities that have Customers but no Employee. a. Use sub-query b. Do not use sub-query
--a.
select distinct c.City 
from Customers c
where c.City NOT IN (select distinct e.City from Employees e)

--b.....
select distinct c.City,distinct e.City
from Customers c left join Orders o on c.CustomerID = o.CustomerID 
right join Employees e on o.EmployeeID = e.EmployeeID
--where c.City not in(e.City)

--3. List all products and their total order quantities throughout all orders
select p.ProductName, sum(od.Quantity) TotalOrderQuantities
from Products p left join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName

--4.List all Customer Cities and total products ordered by that city.


--5.List all Customer Cities that have at least two customers. a.Use union b. Use sub-query and no union
select c.City,count(c.CustomerID)
from Customers c
group by c.City
Having count(c.CustomerID)>2

----6.List all Customer Cities that have ordered at least two different kinds of products.
select c.City, Count(p.CategoryID) AS TwoOrMore
from Customers c left join Orders o on c.CustomerID=o.CustomerID
join [Order Details] od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by c.City
having Count(p.CategoryID)>=2
order by TwoOrMore

--7.List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.
select o.CustomerID
from Orders o left join Customers c on o.CustomerID = c.CustomerID
where o.ShipCity <>c.City

--8.List 5 most popular products, their average price, and the customer city that ordered most quantity of it.



--11. How do you remove the duplicates record of a table?
--Use CTE and partition by to group the results.then delete the duplicates



