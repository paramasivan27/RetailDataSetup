DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Item_Loc_SOH;
DROP TABLE IF EXISTS Receipts;


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

CREATE TABLE Item_Loc_SOH (
    product_id INT REFERENCES Product(product_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id) ON DELETE CASCADE,
    stock_on_hand INT,
    average_cost NUMERIC(10, 2),
    reserved_quantity INT,
    non_sellable_quantity INT
);

CREATE TABLE Receipts (
    receipt_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Product(product_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id) ON DELETE CASCADE,
    number_of_units_received INT NOT NULL,
    receipt_cost NUMERIC(10, 2) NOT NULL
);




CREATE TABLE Event (
    event_id SERIAL PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    product_id INT REFERENCES Product(product_id) ON DELETE CASCADE,
    location_id INT REFERENCES Location(location_id) ON DELETE CASCADE,
    soh_impact INT,
    actual_soh INT,
    transaction_date date,
    transaction_time timestamp
);

ALTER TABLE Item_Loc_SOH
ADD CONSTRAINT unique_product_location UNIQUE (product_id, location_id);