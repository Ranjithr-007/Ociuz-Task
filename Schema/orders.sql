CREATE TABLE orders (
    order_id      SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    order_date    TIMESTAMP DEFAULT now(),
    total_amount  NUMERIC(12,2)
);

CREATE TABLE order_items (
    item_id      SERIAL PRIMARY KEY,
    order_id     INT REFERENCES orders(order_id),
    product_name TEXT NOT NULL,
    qty          INT NOT NULL,
    price        NUMERIC(12,2),
    line_total   NUMERIC(12,2)
);

