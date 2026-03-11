CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    address VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('cook', 'delivery'),
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    image VARCHAR(200),
    price DECIMAL(6,2) NOT NULL,
    type ENUM('pizza', 'burger', 'drink') NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    order_datetime DATETIME,
    delivery_or_pickup ENUM('delivery', 'pickup'),
    total_price DECIMAL(7,2) NOT NULL,
    store_id INT NOT NULL,
    delivery_employee_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (delivery_employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
