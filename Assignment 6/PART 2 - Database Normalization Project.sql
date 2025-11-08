# Unnormalized table contains order, product, and customer details.

create table orders_unnormalized
(
    order_un_id    int            not null auto_increment,
    order_id       int            not null,
    total_price    decimal(10, 2) not null,
    create_date    datetime       not null,
    customer_id    int            not null,
    product_name   varchar(50)    not null,
    original_price decimal(10, 2) not null,
    category       varchar(20)    not null,
    stock          int            not null DEFAULT 0,
    first_name     varchar(20)    not null,
    last_name      varchar(20)    not null,
    email          varchar(255)   not null,
    constraint pk_order_id primary key (order_un_id)
);


# Normalize the table up to 3rd Normal Form (3NF)
# Create the normalized tables with appropriate constraints.

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


# Write SQL joins to reconstruct the original data.

SELECT o.order_id,
       o.create_date,
       o.total_price,
       o.customer_id,
       c.first_name,
       c.last_name,
       c.email,
       p.product_name,
       p.category,
       oi.quantity,
       oi.unit_price,
       (oi.quantity * oi.unit_price) AS line_total
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id
         JOIN order_items oi ON o.order_id = oi.order_id
         JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id, oi.order_item_id;