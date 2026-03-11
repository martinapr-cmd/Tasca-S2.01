CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    postal_address VARCHAR(150),
    phone VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE,
    recommended_by INT,
    FOREIGN KEY (recommended_by) REFERENCES clients(client_id)
);

CREATE TABLE employees (
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    hire_date DATE 
);

CREATE TABLE glasses (
	glasses_id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(50) NOT NULL,
    left_graduation DECIMAL(4, 2) NOT NULL,
    right_graduation DECIMAL(4, 2) NOT NULL,
    frame_type ENUM("floating", "paste", "metal") NOT NULL,
    frame_color VARCHAR(30) NOT NULL,
    left_lens_color VARCHAR(30) NOT NULL,
    right_lens_color VARCHAR(30) NOT NULL,
    price DECIMAL(6, 2) NOT NULL,
    provider_id INT NOT NULL,
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

CREATE TABLE providers ( 
	provider_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(10) NOT NULL,
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE sales (
	sale_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATE NOT NULL,
    employee_id INT NOT NULL,
    client_id INT NOT NULL,
    glasses_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id)
);

