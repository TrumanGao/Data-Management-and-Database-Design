# Scenario: You are a data analyst for an online retailer managing customer and order data.
# Tasks:
#
# Create tables for Customers, Orders, and Products with proper primary and foreign keys.
# Insert at least 10 records per table.
# Write a query to find customers who placed more than 3 orders last month.
# Develop a report query showing total sales by product category.
# Deliverable: SQL script (.sql file) + 1-page explanation of how the database supports business decision-making.
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
)