CREATE OR REPLACE FUNCTION list_inventory(p_search TEXT DEFAULT NULL)
RETURNS JSONB AS $$
BEGIN
    RETURN (
        SELECT jsonb_agg(
            jsonb_build_object(
                'item_id', item_id,
                'item_name', item_name,
                'sku', sku,
                'price', price,
                'is_active', is_active
            )
        )
        FROM inventory
        WHERE p_search IS NULL
           OR item_name ILIKE '%' || p_search || '%'
           OR sku ILIKE '%' || p_search || '%'
    );
END;
$$ LANGUAGE plpgsql;

