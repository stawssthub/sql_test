CREATE TABLE Dim_SalesPerson (
	SalesPersonKey INT IDENTITY,
	SalesPersonID INT,
	SalesQuota MONEY,
	Bonus MONEY,
	CommissionPct SMALLMONEY,
	SalesYTD MONEY,
	SalesLastYear MONEY,
	TerritoryName NVARCHAR(50),
	TerritoryGroup NVARCHAR(50),
	TerritorySalesYTD MONEY,
	TerritorySalesLastYear MONEY,
	TerritoryCostYTD MONEY,
	TerritoryCostLastYear MONEY,
	CountryRegionName NVARCHAR(50),
	StateProvinceCode NCHAR(3),
	IsOnlyStateProvinceFlag BIT,
	StateProvinceName NVARCHAR(50),
	NationalIDNumber NVARCHAR(15),
	LoginID NVARCHAR(256),
	OrganizationNode HIERARCHYID,
	OrganizationLevel SMALLINT,
	JobTitle NVARCHAR(50),
	BirthDate DATE,
	MaritalStatus NCHAR(1),
	Gender NCHAR(1),
	HireDate DATE,
	SalariedFlag BIT,
	VacationHours SMALLINT,
	SickLeaveHours SMALLINT,
	CurrentFlag BIT
)