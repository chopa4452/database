use menudb;

-- INSERT : 값 추가
select * from tbl_menu;
select count(*) from tbl_menu;

insert into tbl_menu values(null, '바나나해장국', 8500, 4, 'Y')

select * from tbl_menu;

insert into tbl_menu (menu_name, menu_price, category_code, orderable_status)
values('초콜릿죽', 6500, 7, 'Y');
select * from tbl_menu;

insert into tbl_menu (orderable_status, menu_price, menu_name, category_code)
values('Y', 5500, '파인애플탕', 4);
select * from tbl_menu;

insert into
	tbl_menu
values
	(null, '참치맛아이스크림', 1700, 12, 'Y'),
	(null, '멸치맛아이스크림', 1500, 11, 'Y'),
	(null, '소시지맛커피', 2500, 8, 'Y')
select * from tbl_menu;

-- UPDATE : 값 수정
select
	menu_code,
	category_code
from
	tbl_menu
where 
	menu_name = '파인애플탕';

desc tbl_menu;

select * from tbl_menu where menu_code = 7;

update tbl_menu
set category_code = 12
where menu_code = 7;


select menu_code
	from tbl_menu
	where menu_name = '파인애플탕';

-- SUBQUERRY를 활용할 수도 있다.
update tbl_menu
set category_code = 6
where menu_code = (
	select tmp.menu_code
	from (
		select menu_code
		from tbl_menu
		where menu_name = '파인애플탕'
	) tmp
);

select *
		from tbl_menu
		where menu_name = '파인애플탕'
		
-- delete : 삭제
delete from tbl_menu
order by menu_price
limit 2;

select *
from tbl_menu
order by menu_price
limit 2;

delete from tbl_menu
where menu_code = 4;

select * from tbl_menu where menu_code = 4;

delete from
	tbl_menu
where mene_price < 5000;

select * from tbl_menu where menu_price < 5000;

select * from tbl_menu;
delete from tbl_menu;

-- REPLACE
-- 데이터가 없을 때 replace는 insert로 작동한다.
-- 데이터가 있으면 해당하는 값을 update로 작동한다.
REPLACE INTO tbl_menu VALUES (17, '참기름소주', 5000, 10, 'Y');
REPLACE tbl_menu VALUES (17, '참기름소주', 3000, 10, 'Y');
select * from tbl_menu;

REPLACE tbl_menu
SET menu_code = 2,
    menu_name = '우럭쥬스',
    menu_price = 20000,
    category_code = 9,
    orderable_status = 'Y';

