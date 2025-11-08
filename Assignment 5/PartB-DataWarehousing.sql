FactSales
-----------
SalesKey (PK, Surrogate Key)
ProductKey (FK to DimProduct)
CustomerKey (FK to DimCustomer)
DateKey (FK to DimDate)
StoreKey (FK to DimStore)
QuantitySold
SalesAmount
SalesCost


DimProduct
-----------
ProductKey (PK, Surrogate Key)
ProductID (Natural Key)
ProductName
Category
Brand
UnitPrice


DimCustomer
-----------
CustomerKey (PK, Surrogate Key)
CustomerID (Natural Key)
CustomerName
City
State
CustomerType


DimDate
-----------
DateKey (PK, Surrogate Key)
FullDate
Year
Quarter
Month
DayOfWeek


DimStore
-----------
StoreKey (PK, Surrogate Key)
StoreID (Natural Key)
StoreName
StoreType
City
Region




SELECT 
    p.Category,
    d.Year,
    d.Quarter,
    COUNT(DISTINCT f.SalesKey) AS TotalTransactions,
    SUM(f.QuantitySold) AS TotalUnitsSold,
    SUM(f.SalesAmount) AS TotalRevenue,
    SUM(f.SalesAmount - f.SalesCost) AS TotalProfit,
    ROUND((SUM(f.SalesAmount - f.SalesCost) / SUM(f.SalesAmount)) * 100, 2) 
        AS ProfitMarginPercent
FROM FactSales f
INNER JOIN DimProduct p ON f.ProductKey = p.ProductKey
INNER JOIN DimDate d ON f.DateKey = d.DateKey
WHERE d.Year >= 2023
GROUP BY p.Category, d.Year, d.Quarter
ORDER BY d.Year DESC, d.Quarter DESC, TotalRevenue DESC;


SELECT 
    c.CustomerType,
    c.State,
    d.Year,
    COUNT(DISTINCT c.CustomerKey) AS TotalCustomers,
    SUM(f.SalesAmount) AS TotalRevenue,
    ROUND(SUM(f.SalesAmount) / COUNT(DISTINCT c.CustomerKey), 2) 
        AS RevenuePerCustomer,
    SUM(f.QuantitySold) AS TotalUnitsSold
FROM FactSales f
INNER JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
INNER JOIN DimDate d ON f.DateKey = d.DateKey
WHERE d.Year >= 2023
GROUP BY c.CustomerType, c.State, d.Year
ORDER BY TotalRevenue DESC;