CREATE TABLE inventory (
    item_id    SERIAL PRIMARY KEY,
    item_name  TEXT NOT NULL,
    sku        TEXT UNIQUE NOT NULL,
    price      NUMERIC(12,2) NOT NULL,
    is_active  BOOLEAN DEFAULT TRUE
);

