-- SET OPERATIONS
-- 두 개 이상의 SELECT문의 결과 집합을 결합하는데 사용한다.
-- 중요한점은 결합하는 결과 집합의 컬럼(컬럼 수, 컬럼 순서, 데이터타입)이

use menudb;

-- UNION
-- 두 개 이상의 SELECT문의 결과를 결합한다. 중복된 레코드는 제거한다.
select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code = 10 -- 2 3 4 11 12 17
union
select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code < 9000; -- 1 2 3 4 10 12 13 17 21

select * from tbl_menu;

-- union all 중복제거하지 않고 모든 데이터 반환
select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code = 10 -- 2 3 4 11 12 17
union all
select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code < 9000; -- 1 2 3 4 10 12 13 17 21
	
	-- intersect
	-- 두 select문의 결과 중 공통되는 레코드만 반환한다.
	
	select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code = 10 -- 2 3 4 11 12 17
intersect
select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	category_code < 9000; -- 1 2 3 4 10 12 13 17 21
	
	-- minus
	-- 첫 번째 select문의 결과에서 두 번째 select문의 결과가 포함되는 레코드 제외 == left join
	