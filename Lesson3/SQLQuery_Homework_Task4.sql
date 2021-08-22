/*
������� ��� �������� ������ ��������� ���������� �� [HumanResources].[Department]
*/

SELECT MIN (YEAR([BirthDate]))
FROM [HumanResources].[Employee]

/* 
������� ���� �������� ������ �������� ���������� �� [HumanResources].[Department]
*/
SELECT DAY([BirthDate])
FROM [HumanResources].[Employee]
WHERE  [BirthDate]= (SELECT MAX ([BirthDate])
		FROM [HumanResources].[Employee]) 
		

/*
������� JobTitle ����������� � ���� ������ ������, ������� ���������� �� ������ � ������� 2010 ���� �� 
[HumanResources].[EmployeeDepartmentHistory]
*/
 SELECT t2.[JobTitle], t1.[StartDate]
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE DATENAME(MONTH, StartDate) = 'February'
	AND DATENAME(YEAR, StartDate) = 2010

/*
������� JobTitle ��������� ����������� � ��� ���������� �� [HumanResources].[EmployeeDepartmentHistory]
*/

SELECT t2.[JobTitle], DATEPART (YEAR, EndDate) AS YearFired
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE EndDate IS NOT NULL


/*
������� JobTitle ��������� ����������� � ���������� ���� ������� ��� �������� � �������� �� [HumanResources].[EmployeeDepartmentHistory]
*/

SELECT t2.[JobTitle], DATEDIFF(DAY, StartDate, EndDate) AS DurationDay
FROM [HumanResources].[EmployeeDepartmentHistory] t1
	JOIN [HumanResources].[Employee] t2
	ON t1.[BusinessEntityID]=t2.[BusinessEntityID]
WHERE EndDate IS NOT NULL 

/*
����c�� ���������� �������� � LastName ��  [Person].[Person]
*/

SELECT LEN(LastName) AS Length,LastName   
FROM [Person].[Person]

/*
������� �� ����������� AddressID, ������ 5 ��������  �� AddressLine1 �  City,  �� ������� [Person].[Address]
*/

SELECT [AddressID], SUBSTRING([AddressLine1], 1, 4) AS X,   
   SUBSTRING([City], 1, 5) AS Y 
FROM [Person].[Address]
ORDER BY [AddressID]






