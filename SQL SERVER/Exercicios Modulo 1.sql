select distinct
	ProductName
From
	DimProduct

select distinct
	EmailAddress
From
  DimCustomer

  select distinct
	FirstName, EmailAddress, BirthDate
From
  DimCustomer

  select 
	CustomerKey as 'ID do cliente',
	FirstName as 'Nome', 
	EmailAddress as 'Email', 
	BirthDate as 'Aniversario'
From
  DimCustomer


 select 
	*
 From
  DimCustomer