-- CATEGORIES
INSERT INTO Categories (category_id, category_name) VALUES
    (1, 'Shirts'),
    (2, 'Pants'),
    (3, 'Jackets'),
    (4, 'Shoes'),
    (5, 'Accessories');

-- SUPPLIERS
INSERT INTO Suppliers (supplier_id, supplier_name, phone, email) VALUES
    (1, 'Metro Wear', '+19295551201', 'metro@shop.com'),
    (2, 'City Apparel', '+19295551202', 'city@shop.com'),
    (3, 'North Supply', '+19295551203', 'north@shop.com'),
    (4, 'Prime Clothing', '+19295551204', 'prime@shop.com'),
    (5, 'Basics Co', '+19295551205', 'basics@shop.com');

-- PRODUCTS
INSERT INTO Products (product_id, product_name, category_id, supplier_id, unit_price, qoh) VALUES
    (1, 'Cotton T-Shirt', 1, 1, 20, 140),
    (2, 'Blue Jeans', 2, 2, 45, 70),
    (3, 'Hooded Jacket', 3, 3, 75, 35),
    (4, 'Running Shoes', 4, 4, 90, 50),
    (5, 'Leather Belt', 5, 5, 25, 110);

-- ORDERS
INSERT INTO Orders (order_id, customer_id, product_id, quantity, order_amount, order_date, order_time) VALUES
    (1, 'C001', 1, 2, 40, '2025-11-25', '10:00:00'),
    (2, 'C002', 2, 1, 45, '2025-11-25', '11:20:00'),
    (3, 'C003', 3, 1, 75, '2025-11-25', '12:45:00'),
    (4, 'C004', 5, 2, 50, '2025-11-25', '13:10:00'),
    (5, 'C005', 4, 1, 90, '2025-11-25', '14:05:00');

-- UPDATE
UPDATE Orders
SET quantity = 3, order_amount = 60
WHERE order_id = 1;

-- DELETE
DELETE FROM Orders
WHERE product_id = 3;

DELETE FROM Products
WHERE product_id = 3;
