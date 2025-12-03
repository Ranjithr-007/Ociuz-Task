-- Students Table
CREATE TABLE students (
    student_id    SERIAL PRIMARY KEY,
    student_name  TEXT NOT NULL,
    class         TEXT NOT NULL,
    roll_no       INT UNIQUE,
    total_marks   NUMERIC(6,2),
    percentage    NUMERIC(5,2)
);

-- Marks Table
CREATE TABLE marks (
    mark_id        SERIAL PRIMARY KEY,
    student_id     INT REFERENCES students(student_id),
    subject_name   TEXT NOT NULL,
    marks_obtained NUMERIC(5,2),
    max_marks      NUMERIC(5,2)
);

