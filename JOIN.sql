-- JOIN
-- SQL문의 컬럼 또는 테이블에 별칭을 달아줄 수 있다. 이러한 별칭을 ALIAS라고 한다.
use employeedb;
use menudb;

SELECT 
    menu_code AS 'code',
    menu_name AS name,
    menu_price 'price'
FROM
    tbl_menu
ORDER BY price;

-- 테이블 별칭
SELECT
    a.category_code,
    a.menu_name
FROM
    -- tbl_menu AS a
    tbl_menu a
ORDER BY 
    a.category_code,
    a.menu_name;

-- INNER JOIN
-- 두 테이블의 교집합을 반환하는 SQL JOIN 유형 / 명시적으로 이 방식을 더 많이 사용
select
	a.menu_name,
	b.category_name
from
	tbl_menu a
join tbl_category b on a.category_code = b.category_code;

desc tbl_menu;
desc tbl_category;

-- using을 활용한 JOIN
-- 컬럼명이 같을 경우 USING으로 서로 연관 있는 컬럼에 대한 조건을 작성하여 JOIN하는 경우

SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
INNER JOIN tbl_category b USING (category_code);

-- LEFT JOIN
-- 첫 번째(왼쪽) 테이블의 모든 레코드와 두 번째(오른쪽) 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형
select * from tbl_menu;
select * from tbl_category;
SELECT 
	a.category_name,
	b.menu_name
from tbl_category a
left join tbl_menu b on a.category_code = b.category_code
where a.category_code in (8,9,10)

-- RIGHT JOIN
-- 두 번째(오른쪽) 테이블의 모든 레코드와 첫 번째(왼쪽) 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형

SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- cross join
-- 두 테이블의 모든 가능한 조합을 반환하는 SQL JOIN 유형

SELECT 
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
CROSS JOIN tbl_category b;

-- SELF JOIN
-- 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 SQL JOIN 유형
-- 카테고리별 대분류 확인을 위한 SELF JOIN 조회

SELECT
    a.category_name,
    b.category_name
FROM 
    tbl_category a
JOIN tbl_category b ON a.ref_category_code = b.category_code
WHERE a.ref_category_code IS NOT NULL;

-- NESTED LOOP JOIN
-- MySQL은 기본적으로 NESTED LOOP JOIN을 사용한다.

SELECT /*+ NO_HASH_JOIN(a) */
    a.menu_name,
    b.category_name
FROM 
    tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;

-- HASH JOIN
-- MySQL 8.0.18버전 이후 지원하게 되었다.

SELECT /*+ HASH_JOIN(a) */
    a.menu_name,
    b.category_name
FROM
    tbl_menu a
JOIN tbl_category b ON a.category_code = b.category_code;