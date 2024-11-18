use AdventureWorks2012 

-- a. Get all the details from the person table including email ID, phone number and phone number type.
select*from person.person as p
inner join person.EmailAddress as ea on p.BusinessEntityID=ea.BusinessEntityID  
inner join person.PersonPhone as pp on pp.BusinessEntityID=ea.BusinessEntityID 
inner join  person.PhoneNumberType as pph on pph.PhoneNumberTypeID=pp.PhoneNumberTypeID 

--b. Get the details of the sales header order made in May 2011.
select*from sales.SalesOrderHeader 
where OrderDate >='2011-05-01'
and OrderDate  <'2011-06-01'

--c.  Get the details of the sales details order made in the month of May 2011.
select*from sales.SalesOrderDetail as sod
inner join sales.SalesOrderHeader as soh on
sod.SalesOrderID=soh.SalesOrderID 
where OrderDate >='2011-05-01'
and OrderDate  <'2011-06-01'

-- d. Get the total sales made in May 2011.
select sum (TotalDue ) as [Total Sales] from sales.SalesOrderHeader 
where OrderDate >='2011-05-01'
and OrderDate  <'2011-06-01'

-- e. Get the total sales made in the year 2011 by month order by increasing sales. 
SELECT 
    MONTH(OrderDate) AS OrderMonth,
    SUM(SubTotal) AS TotalSales
FROM 
    Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2011
GROUP BY 
    MONTH(OrderDate)
ORDER BY 
    TotalSales ASC;

--f. Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'.
select SUM(soh.TotalDue) as total from Sales.SalesOrderHeader as soh
join sales.Customer as c on soh.CustomerID=c.CustomerID
join Person.Person as p on c.PersonID=p.BusinessEntityID
where p.FirstName='Gustavo' and p.LastName='Achong'