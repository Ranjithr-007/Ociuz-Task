CREATE OR REPLACE FUNCTION update_student_totals()
RETURNS void AS $$
BEGIN
    UPDATE students s
    SET 
        total_marks = agg.total,
        percentage  = CASE WHEN agg.max_total > 0 
                            THEN (agg.total / agg.max_total) * 100 
                           ELSE NULL END
    FROM (
        SELECT student_id,
               SUM(marks_obtained) AS total,
               SUM(max_marks) AS max_total
        FROM marks
        GROUP BY student_id
    ) AS agg
    WHERE s.student_id = agg.student_id;
END;
$$ LANGUAGE plpgsql;

