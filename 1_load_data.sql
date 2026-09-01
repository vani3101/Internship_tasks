--Create the table
CREATE TABLE sales_data (
    product_id INT,
    sale_date DATE,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    sales_amount NUMERIC(10, 2),
    quantity_sold INT,
    product_category VARCHAR(50),
    unit_cost NUMERIC(10, 2),
    unit_price NUMERIC(10, 2),
    customer_type VARCHAR(50),
    discount NUMERIC(5, 2),
    payment_method VARCHAR(50),
    sales_channel VARCHAR(50),
    region_and_sales_rep VARCHAR(100)
);

--Load the data into table
COPY sales_data
FROM 'C:\Users\Public\sales_data.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',');