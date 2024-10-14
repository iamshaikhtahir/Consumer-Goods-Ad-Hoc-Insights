WITH product_counts AS (
    SELECT 
        dp.segment, 
        YEAR(s.date) AS year, 
        COUNT(DISTINCT dp.product_code) AS product_count
    FROM fact_sales_monthly s
    JOIN dim_product dp
    ON s.product_code = dp.product_code
    WHERE YEAR(s.date) IN (2020, 2021)
    GROUP BY dp.segment, YEAR(s.date)
)
SELECT 
    p1.segment,
    p1.product_count AS product_count_2020,
    p2.product_count AS product_count_2021,
    (p2.product_count - p1.product_count) AS difference
FROM 
    product_counts p1
JOIN 
    product_counts p2
    ON p1.segment = p2.segment
    AND p1.year = 2020
    AND p2.year = 2021
ORDER BY difference DESC;
