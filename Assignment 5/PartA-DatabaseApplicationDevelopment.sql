INSERT INTO
    Customers (CustomerID, Name, Email, Phone, City, State)
VALUES
    (
        1001,
        'Feixiang Gao',
        'gao.feix@northeastern.edu',
        '111-111-1111',
        'Arlington',
        'VA'
    );

SELECT
    o.OrderID,
    o.OrderDate,
    c.Name,
    p.Name AS Product,
    od.Quantity,
    od.UnitPrice,
    (od.Quantity * od.UnitPrice) AS Total
FROM
    Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
WHERE
    o.OrderID = 5001;

UPDATE Products
SET
    StockQuantity = StockQuantity - 5
WHERE
    ProductID = 2001
    AND StockQuantity >= 5;

SELECT
    c.CategoryName,
    COUNT(o.OrderID) AS Orders,
    SUM(od.Quantity) AS Units,
    SUM(od.Quantity * od.UnitPrice) AS Revenue
FROM
    OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    JOIN Orders o ON od.OrderID = o.OrderID
WHERE
    o.OrderDate >= DATEADD (month, -1, GETDATE ())
GROUP BY
    c.CategoryName
ORDER BY
    Revenue DESC;

SELECT
    p.Category,
    d.Year,
    d.Quarter,
    SUM(f.QuantitySold) AS TotalUnits,
    SUM(f.SalesAmount) AS TotalRevenue,
    SUM(f.SalesAmount - f.SalesCost) AS TotalProfit
FROM
    FactSales f
    JOIN DimProduct p ON f.ProductKey = p.ProductKey
    JOIN DimDate d ON f.DateKey = d.DateKey
WHERE
    d.Year >= 2025
GROUP BY
    p.Category,
    d.Year,
    d.Quarter
ORDER BY
    TotalRevenue DESC;

SELECT
    c.CustomerType,
    c.State,
    d.Year,
    COUNT(DISTINCT c.CustomerKey) AS TotalCustomers,
    SUM(f.SalesAmount) AS TotalRevenue,
    ROUND(
        SUM(f.SalesAmount) / COUNT(DISTINCT c.CustomerKey),
        2
    ) AS RevenuePerCustomer
FROM
    FactSales f
    JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
    JOIN DimDate d ON f.DateKey = d.DateKey
WHERE
    d.Year >= 2025
GROUP BY
    c.CustomerType,
    c.State,
    d.Year
ORDER BY
    TotalRevenue DESC;