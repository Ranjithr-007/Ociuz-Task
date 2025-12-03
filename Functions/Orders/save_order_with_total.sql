CREATE OR REPLACE FUNCTION save_order_with_total(p_order JSONB)
RETURNS JSONB AS $$
DECLARE
    v_order_id INT;
    v_total NUMERIC := 0;
    item JSONB;
BEGIN
    INSERT INTO orders (customer_name)
    VALUES (p_order->>'customer_name')
    RETURNING order_id INTO v_order_id;

    FOR item IN SELECT * FROM jsonb_array_elements(p_order->'items')
    LOOP
        v_total := v_total +
                   ((item->>'qty')::INT * (item->>'price')::NUMERIC);

        INSERT INTO order_items (order_id, product_name, qty, price, line_total)
        VALUES (
            v_order_id,
            item->>'product_name',
            (item->>'qty')::INT,
            (item->>'price')::NUMERIC,
            ((item->>'qty')::INT * (item->>'price')::NUMERIC)
        );
    END LOOP;

    UPDATE orders SET total_amount = v_total WHERE order_id = v_order_id;

    RETURN jsonb_build_object(
        'order_id', v_order_id,
        'total_amount', v_total
    );
END;
$$ LANGUAGE plpgsql;

