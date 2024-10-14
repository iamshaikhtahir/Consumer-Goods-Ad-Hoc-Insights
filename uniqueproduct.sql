WITH unique_products AS (
    SELECT 
        YEAR(date) AS year, 
        COUNT(DISTINCT product_code) AS unique_products
    FROM fact_sales_monthly
    WHERE YEAR(date) IN (2020, 2021)
    GROUP BY YEAR(date)
)
SELECT 
    MAX(CASE WHEN year = 2020 THEN unique_products END) AS unique_products_2020,
    MAX(CASE WHEN year = 2021 THEN unique_products END) AS unique_products_2021,
    ROUND(((MAX(CASE WHEN year = 2021 THEN unique_products END) - 
            MAX(CASE WHEN year = 2020 THEN unique_products END)) /
            MAX(CASE WHEN year = 2020 THEN unique_products END)) * 100, 2) AS percentage_chg
FROM unique_products;
