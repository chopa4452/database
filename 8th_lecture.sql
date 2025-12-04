create database my_database;

use menudb;

-- tbl menu에서 menu_name만 가져와 보기
SELECT menu_name as 메뉴이름 -- 별칭쓰기
FROM tbl_menu;

-- tbl_menu에서 menu_code, menu_price 가져오기

SELECT 
    menu_code, 
    menu_name, 
    menu_price
FROM
    tbl_menu;

-- tbl_menu에서 모든 열 데이터 검색
select * from tbl_menu;

select 6+3;
select 6/3;
select 6*3;

select now()
select concat('홍.', ' ', '길동') as 'full_name';

-- 상위 카테고리 코드가 null이 아닌 카테고리의 카테고리 코드와 카테고리명을 출력하세요.
-- 단, 카테고리명을 기준으로 내림차순 정렬하여 출력하세요.

select * from where null is not;

SELECT 
    menu_name, 
    menu_price, 
    orderable_status
FROM
    tbl_menu
WHERE
    orderable_status = 'Y';

-- 가격이 13000원 이상인 경우를 출력
SELECT 
    menu_code,
    menu_name, 
    orderable_status
FROM
    tbl_menu
where
	menu_price >= 13000;

SELECT 
    menu_code,
    menu_name, 
    orderable_status
FROM
    tbl_menu
where
	orderable_status<> 'Y';

select
	menu_code,
	menu_name,
	orderable_status
from 
	tbl_menu
where
	menu_price <= 10000;


-- 메뉴명에 김치가 포함된 메뉴 가져오기 / concat으로 특정 문자열을 검색할 수 있다.
select
	menu_code,
	menu_name,
	orderable_status
from 
	tbl_menu
where
	menu_name like concat('%', '김치', '%');


select 1 or 1, 1 or 0, 0 or 1;
select 0 or 0;
select 1 or null, 0 or null, null or null

-- tbl_menu에서 orderable_status = 'Y' 거나 category_code = 10
select
	menu_code,
	menu_name,
	orderable_status,
	category_code
from
	tbl_menu
where
	orderable_status = 'Y' or category_code = 10
order by
	category_code desc;
-- desc는 내림차순

-- tbl_menu에서 가격이 5000원 이상, category_code가 10인 데이터
select
	*
from
	tbl_menu
where
	menu_price >= 5000 or category_code= 10;

-- AND와 OR
select 1 or 0 and 0;
select 0 and 0;
select (1 or 0) and 0;


--
SELECT
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = 4 OR
    menu_price = 9000 AND
    menu_code > 10;

--
SELECT
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    category_code = 4 OR
    (menu_price = 9000 and menu_code > 10);

--
SELECT
    menu_code, 
    menu_name, 
    menu_price,
    category_code,
    orderable_status
FROM
    tbl_menu
where
	menu_price >= 10000 and menu_price <= 25000
order by
	menu_price;

--
SELECT 
    menu_name, 
    menu_price, 
    category_code
FROM
    tbl_menu
WHERE
    menu_price BETWEEN 10000 AND 25000
ORDER BY 
    menu_price;

--
SELECT 
	menu_code,
    menu_name, 
    menu_price, 
    category_code,
    orderable_status
FROM
    tbl_menu
WHERE
    menu_price NOT BETWEEN 10000 AND 25000
ORDER BY 
    menu_price;

--
select
	menu_name,
	menu_price
from
	tbl_menu
where
	menu_name like concat('%', '마늘', '%')
order by
	menu_name;

-- 빵이 맨 뒤에 붙는 메뉴를 출력
select
	menu_name,
	menu_price
from
	tbl_menu
where
	menu_name like concat('%빵')
order by
	menu_name;

-- 메뉴 가격이 5,000원 이상이면서 카테고리코드는 10이면서 메뉴이름에 갈치라는 단어가 들어간 메뉴 데이터 조회
select 
	menu_name,
	category_code,
	menu_price
from
	tbl_menu
where
	menu_price >= 5000 and category_code = 10 and menu_name not like concat('%', '갈치', '%')
order by
	menu_name;

-- IN 연산자 예제와 함께 where절 사용
select
	*
from
	tbl_menu
where
	category_code in (4, 5, 6)
order by
	category_code;

-- IS NULL 연산자와 함께 WHERE절 사용
select 
	*
from 
	tbl_category
where 
	ref_category_code is null;

-- order by 활용
SELECT
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu
order by
	
	menu_price; -- 오름차순이 default / desc는 내림차순
	
-- 
SELECT 
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu
ORDER BY 
    menu_price DESC,
    menu_name ASC;

-- 곱셈 / 곱하기
select
	menu_code,
	menu_price,
	menu_code * menu_price as mul
from
	tbl_menu
order by
	menu_code * menu_price desc
	
--
select field('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');

select 
	field(orderable_status, 'N', 'Y')
from
	tbl_menu;

select * from tbl_menu;

-- null값이 있는 컬럼에 대한 정렬
SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
--     ref_category_code ASC;
    ref_category_code desc;    -- ASC 생략 가능
    
-- 오름차순 시 NULL 마지막으로 (IS NULL ASC)
SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
--     ref_category_code IS NULL ASC;
    ref_category_code IS NULL;    -- ASC 생략 가능
    
-- 내림차순 시 NULL을 마지막으로(DEFAULT)
SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
    -- ref_category_code is null asc;    -- DESC 생략 불가능 / 숫자부터 출력하려면 desc를 사용
    ref_category_code desc;

-- 내림차순 시 NULL을 처음으로
SELECT 
    category_code,
    category_name,
    ref_category_code
FROM
    tbl_category
ORDER BY 
    ref_category_code IS NULL DESC, ref_category_code DESC;    -- DESC 생략 불가능


-- 1번 문제
select
	*
from
	tbl_menu
where
	category_code is not null
order by
	category_code desc
	
-- 2번 문제
select
	menu_name,
	menu_price
from 
	tbl_menu
where
	menu_name like concat('%', '밥', '%') and menu_price >= 20000 and menu_price <= 30000
	
-- 3번 문제
select
	*
from
	tbl_menu
where
	menu_price < 10000 or menu_name like '%김치%'
order by
	menu_price asc, menu_name desc;
use menudb;
-- 4번 문제

select
	category_code,
	menu_price
from
	tbl_menu
where
	category_code not in ('10', '9' ,'8')
	and menu_price = 13000 and orderable_status = 'N'

select
	*
from tbl_menu

use employeedb;

-- select (2) 1번 문제
select 
	*
from
	employee
	
select
	PHONE,
	HIRE_DATE,
	ENT_YN,
	EMP_NAME,
	EMP_ID
from 
	employee
where 
	ENT_YN = 'N' and PHONE like concat('%2')
order by
	HIRE_DATE desc
	limit 3;



	
select
	PHONE,
	HIRE_DATE,
	ENT_YN,
	EMP_NAME,
	EMP_ID
from
	employee
where
	PHONE like concat('%2') and ENT_YN = 'N'
order by
	HIRE_DATE desc
limit 3;

-- select(2) 2번 문제 / employee & job 조인
select
	a.EMP_NAME,
	b.JOB_CODE,
	a.SALARY,
	a.EMP_ID,
	a.EMAIL,
	a.PHONE,
	a.HIRE_DATE,
from
	employee a
left join
	job b on a.job_code = b.job_code
order by
	SALARY desc;

desc job;
desc employee;

select
	*
from 
	job;

-- select(2) 3번 문제 / employee & department
-- 재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고,
-- 마지막에는 전체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
-- 단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’,
-- ‘급여평균’으로 출력되도록 하세요.

select 
	SUM(),
	AVG(SALARY),
	EMP_ID
from
	employee
where
	ENT_YN = 'N'
group by 
