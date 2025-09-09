Question 1

SELECT
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM
    ProductDetail
CROSS APPLY
    STRING_SPLIT(Products, ',');

Question 2

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
