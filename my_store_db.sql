-- a general table for the addresses
CREATE TABLE addresses (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(200),
    zip_code INT(10),
    country VARCHAR(100)
);

-- a general table for the contact details
CREATE TABLE contact_details (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    phone1 VARCHAR(100),
    phone2 VARCHAR(100),
    email1 VARCHAR(200),
    email2 VARCHAR(200)
);

-- the vendors for the products and the materials or subproducts
CREATE TABLE vendors (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL,
    contact_id INT(11),
    address_id INT(11),
    FOREIGN KEY (contact_id) REFERENCES contact_details(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

-- the categories each product belongs
CREATE TABLE product_categories (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL
);

-- all the products the bussiness is selling
CREATE TABLE products (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price FLOAT(10,2) UNSIGNED NOT NULL,
    category_id INT(11),
    vendor_id INT(11),
    FOREIGN KEY (category_id) REFERENCES product_categories(id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

-- the categories each product belongs
CREATE TABLE sub_product_categories (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL
);

-- all the products the bussiness needs in order to create some
CREATE TABLE sub_products (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price FLOAT(10,2) UNSIGNED NOT NULL,
    vendor_id INT(11) NOT NULL,
    category_id INT(11) NOT NULL,
    FOREIGN KEY (vendor_id) REFERENCES vendors(id),
    FOREIGN KEY (category_id) REFERENCES sub_product_categories(id)
);

-- the storage or warehouses where the products or sub products are stored
CREATE TABLE warehouse (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    description TEXT,
    address_id INT(11),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

-- the employees of the bussiness
CREATE TABLE employees (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) DEFAULT NULL,
    salary FLOAT(10,2) DEFAULT 0.00,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    leave_date TIMESTAMP,
    contact_id INT(11),
    address_id INT(11),
    FOREIGN KEY (contact_id) REFERENCES contact_details(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

-- sales done in each day
CREATE TABLE sales (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(100) DEFAULT 0,
    sales_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_id INT(11),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- demands from vendor products on each day
CREATE TABLE product_demands (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(100) DEFAULT 0,
    demand_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    product_id INT(11),
    vendor_id INT(11),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

-- demands from vendor products on each day
CREATE TABLE sub_product_demands (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(100) DEFAULT 0,
    demand_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sub_product_id INT(11),
    vendor_id INT(11),
    FOREIGN KEY (sub_product_id) REFERENCES sub_products(id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id)
);

-- other branches or departments of the bussiness
CREATE TABLE braches (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    description TEXT DEFAULT NULL,
    contact_id INT(11),
    address_id INT(11),
    FOREIGN KEY (contact_id) REFERENCES contact_details(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE customers (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) DEFAULT NULL,
    contact_id INT(11),
    address_id INT(11),
    FOREIGN KEY (contact_id) REFERENCES contact_details(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

-- customer orders
CREATE TABLE orders (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amound INT(100) DEFAULT 0,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT(11),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- junction table for sub products-storage many to many relationship
CREATE TABLE sub_products_storage (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    sub_product_id INT(11),
    warehouse_id INT(11),
    FOREIGN KEY (sub_product_id) REFERENCES sub_products(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

-- junction table for products-storage many to many relationship
CREATE TABLE products_storage (
	id INT(11) AUTO_INCREMENT PRIMARY KEY,
    product_id INT(11),
    warehouse_id INT(11),
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);
