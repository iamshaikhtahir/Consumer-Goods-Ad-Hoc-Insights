SELECT 
    MONTH(s.date) AS Month,
    YEAR(s.date) AS Year,
    SUM(g.gross_price) AS Gross_Sales_Amount
FROM 
    fact_sales_monthly s
JOIN 
    fact_gross_price g ON s.product_code = g.product_code
JOIN 
    dim_customer c ON s.customer_code = c.customer_code
WHERE 
    c.customer = 'Atliq Exclusive'
GROUP BY 
    YEAR(s.date), MONTH(s.date)
ORDER BY 
    Year, Month;
