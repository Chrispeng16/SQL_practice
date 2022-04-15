--1.How many products can you find in the Production.Product table?
select COUNT(p.ProductID) 
from Production.Product AS p

--2.Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory. The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory.
select Count(p.ProductSubcategoryID)
from Production.Product AS p

--3....How many Products reside in each SubCategory? Write a query to display the results with the following titles.
select p.ProductSubcategoryID
from Production.Product AS p

--4. How many products that do not have a product subcategory.
select count(*) -Count(p.ProductSubcategoryID) AS DONotHave
from Production.Product AS p

--5.Write a query to list the sum of products quantity in the Production.ProductInventory table.
select sum(i.Quantity) AS SumOfProduct
from Production.ProductInventory AS i

--6... Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.
select i.ProductID,i.Quantity AS TheSum
from Production.ProductInventory AS i
where i.LocationID = 40 AND i.Quantity <=100
order by i.ProductID


--7. Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100
select i.Shelf,i.ProductID,i.Quantity AS TheSum
from Production.ProductInventory AS i
where i.LocationID = 40 AND i.Quantity <=100
order by i.ProductID

--8.Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.



--12.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.

select C.Name AS Country, S.Name AS Province
from person.CountryRegion AS C join person.StateProvince AS S 
on C.CountryRegionCode = S.CountryRegionCode

--13.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.
select C.Name AS Country, S.Name AS Province
from person.CountryRegion AS C join person.StateProvince AS S 
on C.CountryRegionCode = S.CountryRegionCode
where C.Name IN('Germany','Canada')
order by C.Name

--14.List all Products that has been sold at least once in last 25 years.
select distinct P.ProductName
from Products as P join [Order Details] as od
on p.ProductID = od.ProductID join Orders as o
on od.OrderID = o.OrderID
where o.OrderDate >= 1997

--15.List top 5 locations (Zip Code) where the products sold most.
select top 5 o.ShipPostalCode, sum(od.Quantity* od.UnitPrice*(1-od.Discount)) AS TotalRevenue
from Orders as o join [Order Details] as od 
on o.OrderID = od.OrderID
where o.ShipPostalCode is not null
group by o.ShipPostalCode
order by TotalRevenue desc

--16.List top 5 locations (Zip Code) where the products sold most in last 25 years.
select top 5 o.ShipPostalCode, sum(od.Quantity* od.UnitPrice*(1-od.Discount)) AS TotalRevenue
from Orders as o join [Order Details] as od 
on o.OrderID = od.OrderID
where o.ShipPostalCode is not null And o.OrderDate >= 1997
group by o.ShipPostalCode
order by TotalRevenue desc


--17.List all city names and number of customers in that city.     
select distinct oo.ShipCity, COUNT(oo.CustomerID) AS NumOfC
from Orders oo 
where oo.ShipPostalCode IN(
select top 5 o.ShipPostalCode
from Orders as o join [Order Details] as od 
on o.OrderID = od.OrderID
where o.ShipPostalCode is not null And o.OrderDate >= 1997
group by o.ShipPostalCode
)
group by oo.ShipCity

--18.List city names which have more than 2 customers, and number of customers in that city
select oo.ShipCity, COUNT(oo.CustomerID) AS NumOfC
from Orders oo 
group by oo.ShipCity
order by NumOfC
offset 2 row

--19.List the names of customers who placed orders after 1/1/98 with order date


--20. List the names of all customers with most recent order dates
select c.ContactName, max(o.OrderDate) MaxOrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID
group by c.ContactName




