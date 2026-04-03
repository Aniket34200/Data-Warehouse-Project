--*************************************************************************
--          Data insertion in Silver using Stored Procedure
--*************************************************************************

--=========================================================================
--                       silver.crm_cust_info
--=========================================================================

INSERT INTO silver.crm_cust_info (
    cst_id, 
    cst_key, 
    cst_firstname, 
    cst_lastname, 
    cst_marital_status,
    cst_gndr, 
    cst_create_date
)

SELECT 
    cst_id, 
    cst_key, 
    TRIM(cst_firstname) as cst_firstname,   -- remove extra spaces from first name
    TRIM(cst_lastname) as cst_lastname,    -- remove extra spaces from last name
    CASE 
        WHEN UPPER(TRIM(cst_marital_status)) = 'M' then 'Married'
        WHEN UPPER(TRIM(cst_marital_status)) = 'S' then 'Single'
        ELSE 'Unknown'
    END as cst_marital_status,   -- normalize maritial status into readable format 
    CASE 
        WHEN UPPER(TRIM(cst_gndr)) = 'M' then 'Male'
        WHEN UPPER(TRIM(cst_gndr)) = 'F' then 'Female'
        ELSE 'Unknown'
    END as cst_gndr,     -- normalize gender into readable format
    cst_create_date
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date desc) as flag
    FROM bronze.crm_cust_info
)t 
where flag = 1 AND cst_id IS NOT NULL   -- select the most recent record and non null values



--=========================================================================
--                      silver.crm_prd_info
--=========================================================================

INSERT INTO silver.crm_prd_info(
    prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)

SELECT
    prd_id,
    REPLACE(SUBSTRING(prd_key, 1, 5),'-','_') AS cat_id,
    SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
    prd_nm, 
    ISNULL(prd_cost,0) AS prd_cost, 
    CASE 
        WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
        WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
        WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
        WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
        ELSE 'Unknown'
    END AS prd_line, 
    prd_start_dt,
    DATEADD(DAY, -1, 
        LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)
    ) AS prd_prev_end_dt
FROM bronze.crm_prd_info



--=========================================================================
--                      silver.crm_sales_details
--=========================================================================



