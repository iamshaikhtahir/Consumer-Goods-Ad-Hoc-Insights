SELECT 
    QUARTER(s.date) AS Quarter,
    SUM(s.sold_quantity) AS total_sold_quantity
FROM 
    fact_sales_monthly s
WHERE 
    YEAR(s.date) = 2020
GROUP BY 
    QUARTER(s.date)
ORDER BY 
    total_sold_quantity DESC;
