----most invoices country-----
SELECT BillingCountry ,count(*) as invoices
from Invoice 
group by BillingCountry
order by invoices desc
;

----customer who are not in the US-------
select CustomerId,FirstName,Country from Customer where Country <> 'USA';
----howing the Invoices of customers who are from Brazil----
select e.CustomerId, e.FirstName+e.LastName as fullname,i.InvoiceId,i.InvoiceDate,i.BillingCountry  from Customer e
inner join Invoice i
on e.CustomerId=i.CustomerId   
where Country='Brazil'
order by CustomerId
;

----shows the invoices associated with each sales agent----
select e.FirstName+e.LastName as name,i.InvoiceId from Customer c
left join Invoice i
on c.CustomerId=i.CustomerId
left join Employee e
on e.EmployeeId=c.SupportRepId
;
----shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers----
select c.Country,c.FirstName+c.LastName as customer_name,e.FirstName+e.LastName as employee_name,i.Total
from Customer c
left join Employee e
on e.EmployeeId=c.SupportRepId
left join Invoice i
on c.CustomerId=i.CustomerId
;
-------
