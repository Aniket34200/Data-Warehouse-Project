-- =============================================================================
--             Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers
AS
SELECT
    ci.cst_id AS customer_id, 
    ci.cst_key AS customer_key,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    ci.cst_marital_status AS maritial_status,
    CASE 
        WHEN ci.cst_gndr <> 'Unknown' THEN ci.cst_gndr
        ElSE COALESCE(ca.gen, 'Unknown')
    END AS gender,
    ci.cst_create_date AS create_date,
    ca.bdate AS birth_date,
    la.country AS country
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS la
ON ci.cst_key = la.cid;

GO


-- =============================================================================
--              Create Dimension: gold.dim_products
-- =============================================================================

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products
AS
SELECT 
    pi.prd_id AS product_id, 
    pi.cat_id AS category_id,
    pi.prd_key AS product_key,
    pi.prd_nm AS product_name,
    pi.prd_cost AS product_cost,
    pi.prd_line AS product_line,
    pi.prd_start_dt AS start_date,
    pi.prd_end_dt AS end_date,
    pc.cat AS category,
    pc.subcat AS subcategory,
    pc.maintenance AS maintenance
from silver.crm_prd_info AS pi
LEFT JOIN silver.erp_px_cat_g1v2 AS pc
ON pi.cat_id = pc.id
WHERE pi.prd_end_dt IS NULL; -- filter historical data 

GO 


-- =============================================================================
--           Create Fact Table: gold.fact_sales
-- =============================================================================

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales 
AS 
SELECT 
    sls_ord_num AS order_number, 
    sls_prd_key AS product_key, 
    sls_cust_id AS customer_id, 
    sls_order_dt AS order_date, 
    sls_ship_dt AS ship_date,
    sls_due_dt AS due_date,
    sls_sales AS sales,
    sls_quantity AS quantity,
    sls_price AS price
FROM silver.crm_sales_details 


