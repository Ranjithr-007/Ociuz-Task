CREATE OR REPLACE FUNCTION search_students(search_term TEXT)
RETURNS TABLE (
    student_id INT,
    student_name TEXT,
    class TEXT,
    roll_no INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT s.*
    FROM students s
    WHERE
        (search_term ~ '^[0-9]+$' AND s.student_id = search_term::INT)
        OR s.student_name ILIKE '%' || search_term || '%'
        OR s.class ILIKE '%' || search_term || '%';
END;
$$ LANGUAGE plpgsql;

