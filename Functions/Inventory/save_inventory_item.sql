CREATE OR REPLACE FUNCTION save_inventory_item(p_item JSONB)
RETURNS JSONB AS $$
DECLARE
    v_item_id INT;
BEGIN
    INSERT INTO inventory (item_name, sku, price, is_active)
    VALUES (
        p_item->>'item_name',
        p_item->>'sku',
        (p_item->>'price')::NUMERIC,
        COALESCE((p_item->>'is_active')::BOOLEAN, TRUE)
    )
    ON CONFLICT (sku)
    DO UPDATE SET
        item_name = EXCLUDED.item_name,
        price     = EXCLUDED.price,
        is_active = EXCLUDED.is_active
    RETURNING item_id INTO v_item_id;

    RETURN jsonb_build_object(
        'item_id', v_item_id,
        'status', 'saved'
    );
END;
$$ LANGUAGE plpgsql;

