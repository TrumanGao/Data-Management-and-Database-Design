CREATE SCHEMA IF NOT EXISTS `assignment_3`;

USE assignment_3;

create table customers
(
    customer_id int          not null auto_increment,
    first_name  varchar(20)  not null,
    last_name   varchar(20)  not null,
    email       varchar(255) not null UNIQUE,
    constraint pk_customer_id primary key (customer_id)
);

create table products
(
    product_id     int            not null auto_increment,
    product_name   varchar(50)    not null,
    original_price decimal(10, 2) not null,
    category       varchar(20)    not null,
    stock          int            not null DEFAULT 0,
    constraint pk_product_id primary key (product_id)
);

create table orders
(
    order_id    int            not null auto_increment,
    total_price decimal(10, 2) not null,
    create_date datetime       not null,
    customer_id int            not null,
    constraint pk_order_id primary key (order_id),
    constraint fk_customer_id foreign key (customer_id) references customers (customer_id)
);

create table order_items
(
    order_item_id int            not null auto_increment,
    product_id    int            not null,
    order_id      int            not null,
    quantity      int            not null,
    unit_price    decimal(10, 2) not null,
    constraint pk_order_item_id primary key (order_item_id),
    constraint fk_product_id foreign key (product_id) references products (product_id),
    constraint fk_order_id foreign key (order_id) references orders (order_id)
);

INSERT INTO assignment_3.customers (first_name, last_name, email)
values ('Feixiang', 'Gao', 'gao.feix@northeastern.edu'),
       ('Alice', 'Wong', 'alice.wong@northeastern.edu'),
       ('Ben', 'Lee', 'ben.lee@northeastern.edu'),
       ('Cindy', 'Zhang', 'cindy.zhang@northeastern.edu'),
       ('David', 'Chen', 'david.chen@northeastern.edu'),
       ('Eva', 'Liu', 'eva.liu@northeastern.edu'),
       ('Frank', 'Wu', 'frank.wu@northeastern.edu'),
       ('Grace', 'Sun', 'grace.sun@northeastern.edu'),
       ('Henry', 'Ma', 'henry.ma@northeastern.edu'),
       ('Ivy', 'Tang', 'ivy.tang@northeastern.edu'),
       ('Jack', 'Guo', 'jack.guo@northeastern.edu');

INSERT INTO assignment_3.products (product_name, original_price, category, stock)
VALUES ('Chicken', 2.50, 'Meat', 1),
       ('Instant Noodles - Beef', 2.70, 'Instant Food', 450),
       ('Canned Tuna', 3.20, 'Instant Food', 300),
       ('Beef', 5.99, 'Meat', 200),
       ('Chocolate Bar', 1.50, 'Candy', 800),
       ('Organic Oats 1kg', 4.50, 'Vegetable', 150),
       ('Tomato Sauce 350g', 2.00, 'Vegetable', 400),
       ('Olive Oil 500ml', 8.99, 'Seasoning', 2),
       ('Rice 5kg', 12.99, 'Staple Food', 250),
       ('Coffee', 6.50, 'Beverage', 180);

INSERT INTO assignment_3.orders (total_price, create_date, customer_id)
VALUES (19.99, '2025-10-05 10:15:00', 7),
       (19.98, '2025-10-06 11:20:00', 2),
       (29.99, '2025-10-07 12:30:00', 1),
       (49.99, '2025-10-08 13:45:00', 4),
       (44.97, '2025-10-09 14:10:00', 1),
       (49.00, '2025-10-10 15:00:00', 7),
       (29.95, '2025-10-11 16:05:00', 1),
       (199.99, '2025-10-12 17:25:00', 7),
       (79.98, '2025-10-13 18:40:00', 1),
       (30.00, '2025-10-14 19:55:00', 7);

INSERT INTO assignment_3.order_items (product_id, order_id, quantity, unit_price)
VALUES (1, 1, 1, 19.99),
       (2, 2, 2, 9.99),
       (3, 3, 1, 29.99),
       (4, 4, 1, 49.99),
       (5, 5, 3, 14.99),
       (6, 6, 2, 24.50),
       (7, 7, 5, 5.99),
       (8, 8, 1, 199.99),
       (9, 9, 2, 39.99),
       (10, 10, 4, 7.50);


-- Query 1: customers who placed more than 3 orders last month
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       c.email,
       COUNT(o.order_id) AS orders_count
FROM assignment_3.customers c
         JOIN assignment_3.orders o ON c.customer_id = o.customer_id
WHERE YEAR(o.create_date) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))
  and MONTH(o.create_date) = MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH))
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
HAVING orders_count > 3
ORDER BY orders_count DESC;

-- Query 2: report showing total sales by product category
SELECT p.category,
       SUM(oi.quantity * oi.unit_price) AS total_sales,
       SUM(oi.quantity)                 AS total_units_sold,
       COUNT(DISTINCT oi.order_id)      AS distinct_orders
FROM assignment_3.order_items oi
         JOIN assignment_3.products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;
