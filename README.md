# CS204 Database Demo — Assignments 1, 2, and 3

![Entity relationship diagram](images/Database%20Diagram.png)

Complete SQL work for Study.com Computer Science 204. The project evolves from a normalized relational design (Assignment 1) through joins and grouping (Assignment 2) to views, procedures, triggers, and transaction management (Assignment 3).

## Assignment 1 — Database Design & Implementation
- Defines entities, ERD, and normalized tables in `sql/create-tables-part1.sql`.
- Seeds initial sample data plus update/delete examples in `sql/populatedata-part1.sql`.

### Entities and relationships
- Categories: category names for product classification; PK `category_id`.
- Suppliers: contact and company info for each supplier; PK `supplier_id`.
- Products: inventory items with price, quantity on hand, category, and supplier; PK `product_id`, FKs `category_id`, `supplier_id`.
- Orders: purchase records referencing products; PK `order_id`, FK `product_id`.

### Normalization
- 1NF: every table has a primary key and atomic attributes; no repeating groups.
- 2NF: no composite keys, so no partial dependencies; non-key attributes depend fully on their PK.
- 3NF: no transitive dependencies (e.g., `category_name` lives in Categories, not Products).

### Selective denormalization
- Orders stores `order_amount` even though it can be derived (`unit_price * quantity`) to avoid repetitive calculations during reporting.

## Assignment 2 — SQL Queries and Joins
Queries live in `sql/queries-part2.sql`:
- Part 1: basic selects, stock checks, price filters, category grouping, and sales aggregation.
- Part 2: joins across Products, Suppliers, Categories, and Orders (inner/left, simulated full with `UNION`).
- Part 3: HAVING filters, string formatting with `CONCAT`/`UPPER`/`LOWER`, and date grouping with `DATE_FORMAT`.

## Assignment 3 — Advanced SQL Features
Advanced work is in `sql/advanced-queries-part3.sql`:
- Aggregates, formatting helpers, and month-based grouping.
- View `Top5Products` for quantity and revenue leaders.
- Stored procedure `GetProductSalesSummary(product_id)` returning totals with `COALESCE` for zero-order products.
- BEFORE UPDATE trigger that logs QOH changes into `Inventory_Audit` and rejects negative inventory; CHECK constraint enforces `qoh >= 0`.
- Transactional procedure wrapping an inventory update plus order insert with automatic rollback on failure.
- Full write-up: [Assignment 3 submission (PDF)](Retail-Inventory-Database-Assignment3-submission.pdf).

## Table snapshots
- ![Suppliers table](images/SuppliersTable.png) Supplier directory with IDs, names, phone, and email.
- ![Products table](images/ProductsTable.png) Product catalog rows showing category and supplier links plus pricing and quantity on hand.
- ![Categories table](images/CategoriesTable.png) Category reference list mapping IDs to category names.
- ![Orders table](images/OrdersTable.png) Customer orders with product references, quantities, amounts, and timestamps.

## File structure
```
/sql
 ├── create-tables-part1.sql      -- schema definition
 ├── populatedata-part1.sql       -- sample data + update/delete
 ├── queries-part2.sql            -- assignment 2 queries
 └── advanced-queries-part3.sql   -- assignment 3 advanced SQL tasks

README.md                         -- project explanation (this file)
```
