--Create date dimension

CREATE TABLE gold.dim_date
(
    date_ID INT PRIMARY KEY,
    full_date DATE,
    day_number INT,
    month_number INT,
    month_name VARCHAR(20),
    quarter_number INT,
    year_number INT,
    day_name VARCHAR(20),
    week_number INT,
    is_weekend BIT
);