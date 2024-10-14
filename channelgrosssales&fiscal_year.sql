SELECT 
    c.channel AS channel,
    SUM(g.gross_price) / 1000000 AS gross_sales_mln,
    ROUND((SUM(g.gross_price) / COALESCE((SELECT 
                            SUM(gp.gross_price)
                        FROM
                            fact_gross_price gp
                                JOIN
                            fact_sales_monthly fsm ON gp.product_code = fsm.product_code
                        WHERE
                            YEAR(gp.fiscal_year) = 2021),
                    1)) * 100,
            2) AS percentage
FROM
    dim_customer c
        JOIN
    fact_sales_monthly f ON c.customer_code = f.customer_code
        JOIN
    fact_gross_price g ON f.product_code = g.product_code
WHERE
    f.fiscal_year = 2021
GROUP BY c.channel
ORDER BY gross_sales_mln DESC

