--*************************************************************************
--                 Bulk insertion data with Full load 
--*************************************************************************


--=========================================================================
--                       bronze.crm_cust_info
--=========================================================================
TRUNCATE TABLE bronze.crm_cust_info;

BULK INSERT bronze.crm_cust_info
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_crm\cust_info.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);

--=========================================================================
--                      bronze.crm_prd_info
--=========================================================================
TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_crm\prd_info.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);

--=========================================================================
--                      bronze.crm_sales_details
--=========================================================================
TRUNCATE TABLE bronze.crm_sales_details;

BULK INSERT bronze.crm_sales_details
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_crm\sales_details.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);



--=========================================================================
--                      bronze.erp_cust_az12
--=========================================================================
TRUNCATE TABLE bronze.erp_cust_az12;

BULK INSERT bronze.erp_cust_az12
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_erp\CUST_AZ12.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);

--=========================================================================
--                      bronze.erp_loc_a101
--=========================================================================
TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_erp\LOC_A101.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);

--=========================================================================
--                      bronze.erp_px_cat_g1v2
--=========================================================================
TRUNCATE TABLE bronze.erp_px_cat_g1v2;

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'E:\_My Data Projects\Data-Warehouse-Project\source_erp\PX_CAT_G1V2.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    TABLOCK
);


