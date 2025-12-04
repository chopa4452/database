-- GROUPING
use menudb;
-- GROUP BY를 활용한 메뉴가 존재하는 카테고리 그룹 조회
SELECT 
    category_code
FROM
    tbl_menu
GROUP BY category_code;

-- count 활용
select
	category_code,
	count(*)
from
	tbl_menu
group by
	category_code;

-- SUM 함수 활용
select
	category_code,
	SUM(menu_price),
	count(*)
from
	tbl_menu
group by
	category_code;

-- AVG 함수 활용
select
	category_code,
	AVG(menu_price),
	count(*)
from
	tbl_menu
group by
	category_code;

-- 2개 이상의 그룹 생성
SELECT 
    menu_price,
    category_code
FROM
    tbl_menu
GROUP BY 
    menu_price,
    category_code
order by menu_price, category_code;

-- HAVING 절
SELECT 
    menu_price,
    category_code
FROM
    tbl_menu
GROUP BY 
    menu_price,
    category_code
HAVING 
    category_code >= 5 AND category_code <= 8;

-- ROLLUP
-- 컬럼 한 개를 활용한 ROLLUP(카테고리별 총합)
SELECT 
    category_code,
    SUM(menu_price) as 합계
FROM
    tbl_menu
GROUP BY
    category_code
WITH ROLLUP;

-- ROLLUP을 통해 먼저 나온 컬럼의 총합을 구하고 이후 나오는 컬럼의 총합도 구하는 방식이다.
SELECT 
    menu_price,
    category_code,
    SUM(menu_price)
FROM
    tbl_menu
GROUP BY 
    menu_price,
    category_code
WITH ROLLUP;