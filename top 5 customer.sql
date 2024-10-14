SELECT 
    dc.customer_code,
    dc.customer,
    AVG(fp.pre_invoice_discount_pct) AS average_discount_percentage
FROM 
    fact_pre_invoice_deductions fp
JOIN 
    fact_sales_monthly fsm ON fp.customer_code = fsm.customer_code
JOIN 
    dim_customer dc ON fp.customer_code = dc.customer_code
WHERE 
    fsm.fiscal_year = 2021  -- Ensure this matches the actual column for fiscal year
    AND dc.market = 'India'
GROUP BY 
    dc.customer_code, dc.customer
ORDER BY 
    average_discount_percentage DESC
LIMIT 5;
