(
    SELECT 
        m.product_code, 
        d.product, 
        m.manufacturing_cost
    FROM fact_manufacturing_cost m
    JOIN dim_product d
    ON m.product_code = d.product_code
    ORDER BY m.manufacturing_cost DESC
    LIMIT 1
)
UNION ALL
(
    SELECT 
        m.product_code, 
        d.product, 
       m.manufacturing_cost
    FROM fact_manufacturing_cost m
    JOIN dim_product d
    ON m.product_code = d.product_code
    ORDER BY m.manufacturing_cost ASC
    LIMIT 1
);
