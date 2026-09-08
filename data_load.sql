-- Create tables
CREATE TABLE IF NOT EXISTS orders (
    order_id      VARCHAR(50) PRIMARY KEY,
    order_date    DATE,
    customer_name VARCHAR(100),
    state         VARCHAR(100),
    city          VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS details (
    id           BIGSERIAL PRIMARY KEY,
    order_id     VARCHAR(50) REFERENCES orders(order_id),
    amount       NUMERIC(10, 2),
    profit       NUMERIC(10, 2),
    quantity     INTEGER,
    category     VARCHAR(100),
    sub_category VARCHAR(100),
    payment_mode VARCHAR(50)
);

-- changing the date format
SET datestyle = 'DMY';

-- loading csv data
COPY orders(order_id, order_date, customer_name, state, city)
FROM 'C:\Users\Public\Orders.csv'
WITH (FORMAT csv, HEADER true);

COPY details(order_id, amount, profit, quantity, category, sub_category, payment_mode)
FROM 'C:\Users\Public\Details.csv'
WITH (FORMAT csv, HEADER true);