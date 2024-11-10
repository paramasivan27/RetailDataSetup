DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Event;

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    comment TEXT
);

CREATE TABLE Product (
    product_id SERIAL PRIMARY key,
    category_id INT REFERENCES Category(category_id) ON DELETE CASCADE,
    product_title TEXT NOT NULL,
    product_description TEXT,
    average_cost NUMERIC(10, 2),
    unit_retail NUMERIC(10, 2) NOT NULL,
    promotional_price NUMERIC(10, 2)
);

CREATE TABLE Location (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    location_type VARCHAR(50),
    address TEXT
);

CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Product(product_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id) ON DELETE CASCADE,
    number_of_units_sold INT NOT NULL,
    sales_retail NUMERIC(10, 2) NOT NULL
);

CREATE TABLE Event (
    event_id SERIAL PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    product_id INT REFERENCES Product(product_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id) ON DELETE CASCADE,
    soh_impact INT,
    actual_soh INT
);