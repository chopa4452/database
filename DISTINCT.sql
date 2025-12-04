-- DISTINCT

use menudb;


SELECT 
    category_code
FROM
    tbl_menu
ORDER BY 
    category_code;

SELECT 
    DISTINCT category_code
FROM
    tbl_menu
ORDER BY 
    category_code;

SELECT
	ref_category_code
FROM 
	tbl_category;

-- 다중영 DISTINCT
SELECT 
    category_code, 
    orderable_status
FROM
    tbl_menu;

