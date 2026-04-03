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


