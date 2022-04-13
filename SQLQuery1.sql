--1
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product AS p

--2
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product AS p
where p.ListPrice = 0

--3
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product AS p
where p.Color IS NULL

--4
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product AS p
where p.Color IS NOT NULL

--5
select p.ProductID, p.Name, p.Color, p.ListPrice
from Production.Product AS p
where p.Color IS NOT NULL AND p.ListPrice > 0

--6
select p.Name,p.Color
from Production.Product AS p
where p.Color IS NULL

--7 ...
select TOP 7 'NAME:'+ p.Name + '-- COLOR:'+ p.Color [NameAddColor]
from Production.Product AS p
WHERE p.Name IS NOT NULL AND P.Color IS NOT NULL

--8
select p.ProductID, p.Name
from Production.Product AS p
where p.ProductID between 400 AND 500

--9
select p.ProductID, p.Name,p.Color
from Production.Product AS p
where p.Color IN('black', 'blue')

--10
select *
from Production.Product AS p
where p.Name like 'S%'

--11
select top 6 p.Name, p.ListPrice
from Production.Product AS p
where p.Name like 'Seat%' or p.Name like 'Short%'
order by p.Name

--12
select TOP 6 p.Name, p.ListPrice
from Production.Product AS p
WHERE p.Name like 'A%' or p.Name like'S%'
ORDER BY p.Name

--13
select p.Name, p.ListPrice
from Production.Product AS p
WHERE p.Name like 'SPO[^k]%'
ORDER BY p.Name

--14
select distinct p.Color
from Production.Product AS p
order by p.Color desc

--15
select p.ProductSubcategoryID,p.Color, CAST (p.ProductSubcategoryID AS varchar(10)) + p.Color [IDaddColor]
from Production.Product AS p
WHERE p.ProductSubcategoryID IS NOT NULL AND p.Color IS NOT NULL