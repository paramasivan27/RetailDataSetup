
DROP TABLE IF EXISTS DC_Event;


CREATE TABLE DC_Event (
    event_id SERIAL PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    product_id INT ,
    location_id INT,
    soh_impact INT,
    actual_soh INT,
    transaction_date date,
    transaction_time timestamp
);