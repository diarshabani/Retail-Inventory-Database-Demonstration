USE cs204_demo;

-- PART 1 #1:  List all products, showing product name, category ID, price, and QOH (Quantity on Hand).
SELECT product_name, category_id, unit_price, qoh from Products;

-- PART 1 #2: Retrieve all products that are out of stock (quantity = 0).
SELECT * From Products where qoh=0;

-- PART 1 #3: Display products priced between $100 and $500.
SELECT * from Products where unit_price BETWEEN 100 AND 500;

-- PART 1 #4: Show the total number of products grouped by category.
SELECT category_id, COUNT(*) AS total_products
FROM Products
GROUP BY category_id;

-- PART 1 #5: Display the average price of products per category using the GROUP BY clause.
SELECT category_id, AVG(unit_price) AS avg_price
FROM Products
GROUP BY category_id;

-- PART 2 #1: Join Products and Suppliers to list product name, supplier name, and contact details.
SELECT
    p.product_name,
    s.supplier_name,
    s.phone,
    s.email
FROM Products p
         INNER JOIN Suppliers s ON p.supplier_id = s.supplier_id;

-- PART 2 #2:  Join Products, Categories, and Orders to display: product name, category name, quantity sold, and date of sale.
SELECT
    p.product_name,
    c.category_name,
    o.quantity,
    o.order_date
FROM Orders o
         INNER JOIN Products p ON o.product_id = p.product_id
         INNER JOIN Categories c ON p.category_id = c.category_id;

-- PART 3 #1: Use a LEFT JOIN to list all suppliers and any products they supply (including those with none).
SELECT
    s.supplier_name,
    s.phone,
    p.product_name
FROM Suppliers s
         LEFT JOIN Products p ON s.supplier_id = p.supplier_id;

-- PART 3 #2: Use a FULL OUTER JOIN (or simulate one using UNION of LEFT JOIN and RIGHT JOIN) to show all products and suppliers, including unmatched records.
SELECT
    s.supplier_name,
    p.product_name
FROM Suppliers s
         LEFT JOIN Products p ON s.supplier_id = p.supplier_id

UNION

SELECT
    s.supplier_name,
    p.product_name
FROM Suppliers s
         RIGHT JOIN Products p ON s.supplier_id = p.supplier_id;

-- PART 3 #3: Use a HAVING clause to find all categories with more than 10 products in stock.
SELECT
    category_id,
    SUM(qoh) AS total_stock
FROM Products
GROUP BY category_id
HAVING SUM(qoh) > 10;
