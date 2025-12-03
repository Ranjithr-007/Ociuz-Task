CREATE OR REPLACE FUNCTION save_order(p_order JSONB)
RETURNS INT AS $$
DECLARE
    v_order_id INT;
    item JSONB;
BEGIN
    INSERT INTO orders (customer_name)
    VALUES (p_order->>'customer_name')
    RETURNING order_id INTO v_order_id;

    FOR item IN SELECT * FROM jsonb_array_elements(p_order->'items')
    LOOP
        INSERT INTO order_items (order_id, product_name, qty, price, line_total)
        VALUES (
            v_order_id,
            item->>'product_name',
            (item->>'qty')::INT,
            (item->>'price')::NUMERIC,
            ((item->>'qty')::INT * (item->>'price')::NUMERIC)
        );
    END LOOP;

    RETURN v_order_id;
END;
$$ LANGUAGE plpgsql;

