/*
¬ывести год рождени€ самого взрослого сотрудника из [HumanResources].[Department]
*/

SELECT MIN (YEAR([BirthDate]))
FROM [HumanResources].[Employee]

/* 
¬ывести день рождени€ самого молодого сотрудника из [HumanResources].[Department]
*/
SELECT DAY([BirthDate])
FROM [HumanResources].[Employee]
WHERE  [BirthDate]= (SELECT MAX ([BirthDate])
		FROM [HumanResources].[Employee]) 
		

/*
¬ывести JobTitle сотрудников и дату начала работы, которые устроились на работу в феврале 2010 года из 
[HumanResources].[EmployeeDepartmentHistory]
*/
 SELECT t2.[JobTitle], t1.[StartDate]
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE DATENAME(MONTH, StartDate) = 'February'
	AND DATENAME(YEAR, StartDate) = 2010

/*
¬ывести JobTitle уволенных сотрудников и год увольнени€ из [HumanResources].[EmployeeDepartmentHistory]
*/

SELECT t2.[JobTitle], DATEPART (YEAR, EndDate) AS YearFired
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE EndDate IS NOT NULL


/*
¬ывести JobTitle уволенных сотрудников и количество дней которые они работали в компании из [HumanResources].[EmployeeDepartmentHistory]
*/

SELECT t2.[JobTitle], DATEDIFF(DAY, StartDate, EndDate) AS DurationDay
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE EndDate IS NOT NULL 

/*
¬ывеcти количество символов в LastName из  [Person].[Person]
*/

SELECT LEN(LastName) AS Length,LastName   
FROM [Person].[Person]

/*
¬ывести по возрастанию AddressID, первые 5 символов  из AddressLine1 и  City,  из таблицы [Person].[Address]
*/

SELECT [AddressID], SUBSTRING([AddressLine1], 1, 4) AS X,   
   SUBSTRING([City], 1, 5) AS Y 
FROM [Person].[Address]
ORDER BY [AddressID]






