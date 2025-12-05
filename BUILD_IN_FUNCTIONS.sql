use menudb;

-- 내장함수

-- ASCII(아스키 코드), CHAR(숫자)
select ASCII('A'), CHAR(65);

-- BIT_LENGTH(문자열), CHAR_LENGTH(문자열), LENGTH(문자열)
SELECT BIT_LENGTH('pie'), CHAR_LENGTH('pie'), LENGTH('pie');
SELECT menu_name, BIT_LENGTH(menu_name), CHAR_LENGTH(menu_name), LENGTH(menu_name) from tbl_menu;

-- CONCAT: 문자열을 이어붙임
SELECT CONCAT('호랑이', '기린', '토끼');
SELECT CONCAT_WS(',', '호랑이', '기린', '토끼');
SELECT CONCAT_WS('-', '2023', '05', '31');

SELECT 
    ELT(2, '사과', '딸기', '바나나'), FIELD('딸기', '사과', '딸기', '바나나'), 
    FIND_IN_SET('바나나', '사과,딸기,바나나'), 
	INSTR('사과딸기바나나', '딸기'), LOCATE('딸기', '사과딸기바나나');

-- FORMAT(숫자, 소수점 자릿수)
-- FORMAT: 1000단위마다 콤마(,) 표시를 해 주며 소수점 아래 자릿수(반올림)까지 표현한다.
SELECT FORMAT(123142512521.5635326, 3);

-- BIN(숫자), OCT(숫자), HEX(숫자)
SELECT BIN(65), OCT(65), HEX(65);

-- SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');
SELECT INSERT('내 이름은 아무개입니다.', 7, 3, '홍길동');

-- LEFT(문자열, 길이), RIGHT(문자열, 길이)
SELECT LEFT('Hello World!', 3), RIGHT('Hello World!', 3);

-- LPAD(문자열, 길이, 채울 문자열), RPAD(문자열, 길이, 채울 문자열)
SELECT LPAD('왼쪽', 6, '@'), RPAD('오른쪽', 6 ,'@');

-- LTRIM(문자열), RTRIM(문자열)
SELECT LTRIM('    왼쪽'), RTRIM('  오른쪽    ');

-- TRIM(문자열), TRIM(방향 자를_문자열 FROM 문자열)
SELECT TRIM('    MySQL    '), TRIM(BOTH '@' FROM '@@@@MySQL@@@@');

-- REPEAT(문자열, 횟수)
SELECT REPEAT('재밌어', 3);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열)
SELECT REPLACE('마이SQL', '마이', 'My');

-- REVERSE(문자열)
SELECT REVERSE('stressed');

-- SPACE(길이)
SELECT CONCAT('제 이름은', SPACE(5), '이고 나이는', SPACE(3), '세입니다.');

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT SUBSTRING('안녕하세요 반갑습니다.', 7, 2), SUBSTRING('안녕하세요 반갑습니다.', 7);

-- SUBSTRING_INDEX(문자열, 구분자, 횟수)
SELECT SUBSTRING_INDEX('hong.test@gmail.com', '.', 2), SUBSTRING_INDEX('hong.test@gmail.com', '.', -2);

-- ABS(숫자)
SELECT ABS(-123);

-- CEILING(숫자), FLOOR(숫자), ROUND(숫자)
-- `CEILING: 올림값 반환`
-- `FLOOR: 버림값 반환`
-- `ROUND: 반올림값 반환`
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- TRUNCATE(숫자, 정수)
-- TRUNCATE: 소수점을 기준으로 정수 위치까지 구하고 나머지는 버림
SELECT TRUNCATE(12345.12345, 2), TRUNCATE(12345.12345, -2);

-- CONV(숫자, 원래 진수, 변환할 진수)
SELECT CONV('A', 16, 10), CONV('A', 16, 2), CONV(1010, 2, 8);

-- MOD(숫자1, 숫자2) 또는 숫자1 % 숫자2 또는 숫자1 MOD 숫자2
SELECT MOD(75, 10), 75 % 10, 75 MOD 10;

-- POW(숫자1, 숫자2), SQRT(숫자)
SELECT POW(2, 4), SQRT(16);

-- RAND()
-- RAND: 0이상 1 미만의 실수를 구한다.
SELECT RAND(), FLOOR(RAND() * (11 - 1) + 1);

-- SIGN(숫자)
-- SIGN: 양수면 1, 0이면 0, 음수면 -1을 반환
SELECT SIGN(10.1), SIGN(0), SIGN(-10.1);

-- 날짜 및 시간 관련 함수
-- ADDDATE(날짜, 차이), SUBDATE(날짜, 차이)
SELECT ADDDATE('2023-05-31', INTERVAL 30 DAY), ADDDATE('2023-05-31', INTERVAL 6 MONTH);
SELECT SUBDATE('2023-05-31', INTERVAL 30 DAY), SUBDATE('2023-05-31', INTERVAL 6 MONTH);

-- CURDATE(), CURTIME(), NOW(), SYSDATE()
-- `CURDATE: 현재 연-월-일 추출`
-- `CURTIME: 현재 시:분:초 추출`
-- `NOW() 또는 SYSDATE(): 현재 연-월-일 시:분:초 추출`
SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

-- CURDATE(), CURRENT_DATE(), CURRENT_DATE는 동일
SELECT CURDATE(), CURRENT_DATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME(), CURRENT_TIME은 동일 
SELECT CURTIME(), CURRENT_TIME(), CURRENT_TIME;

-- NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP()는 동일
SELECT NOW(), LOCALTIME, LOCALTIME(), LOCALTIMESTAMP, LOCALTIMESTAMP();

-- YEAR(날짜), MONTH(날짜), DAY(날짜),
-- HOUR(시간), MINUTE(시간), SECOND(시간), MICROSECOND(시간) 
-- : 날짜 또는 시간에서 연, 월, 일, 시, 분, 초, 밀리초를 추출
SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAYOFMONTH(CURDATE());
SELECT HOUR(CURTIME()), MINUTE(CURTIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

-- DATE(), TIME()
SELECT DATE(NOW()), TIME(NOW());

-- DATEDIFF(날짜1, 날짜2), TIMEDIFF(날짜1 또는 시간1, 날짜1 또는 시간2)
SELECT DATEDIFF('2023-05-31', NOW()), TIMEDIFF('17:07:11', '13:06:10');

-- DAYOFWEEK(날짜), MONTHNAME(), DAYOFYEAR(날짜)
-- `DAYOFWEEK: 요일 반환(1이 일요일)`
-- `MONTHNAME: 해당 달의 이름 반환`
-- `DAYOFYEAR: 해당 년도에서 몇 일이 흘렀는지 반환`
SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

-- LAST_DAY(날짜)
SELECT LAST_DAY('20230201');

-- MAKEDATE(연도, 정수)
SELECT MAKEDATE(2023, 32);

-- MAKETIME(시, 분, 초)
SELECT MAKETIME(17, 03, 02);

-- PERIOD_ADD(연월, 개월 수), PERIOD_DIFF(연월1, 연월2)
-- `PERIOD_ADD: 연월에서 개월 수 이후의 연월을 구한다.
-- (연월은 YYYY 또는 YYYYMM형식을 사용한다.)`
-- `PERIOD_DIFF: 연월1 - 연월2의 개월 수를 구한다.`
SELECT PERIOD_ADD(202305, 6), PERIOD_DIFF(202305, 202311);

-- QUARTER(날짜)
SELECT QUARTER('2023-05-31');

-- TIME_TO_SEC(시간)
SELECT TIME_TO_SEC('1:1:1');

-- ### Q1.
-- Q1에서 생성한 TEAM_INFO 테이블과 MEMBER_INFO 테이블에 아래와 같이 데이터를
-- INSERT하는 쿼리를 작성하세요.
-- 단, 삽입 대상 컬럼명은 반드시 명시해야 합니다.
-- - TEAM_INFO 테이블 삽입 후 조회 결과
-- ![image.png]
-- (attachment:a8e9b76d-bbd6-46f4-9fd1-ae50d53264d0:image.png)
-- - MEMBER_INFO 테이블 삽입 후 조회 결과
-- ![image.png]
-- (attachment:ff6a3651-bf24-4c2d-be5d-7c2825da0f5a:image.png)

use employeedb;
select * from team_info;
-- insert 문 3개씩
insert into team_info (team_code, team_name, team_detail, use_yn)
values(1, '음악감상부', '클래식 및 재즈 음악을 감상하는 사람들의 모임', 'Y')

insert into team_info (team_name, team_detail, use_yn)
values('맛집탐방부', '맛집을 찾아다니는 사람들의 모임', 'N')

insert into team_info (team_code, team_name, team_detail, use_yn)
values(3, '행복찾기부', null, 'Y')

select * from member_info;
insert into member_info (member_code, member_name, birth, division_code, detail_info, contact, team_code, active_status)
values(1, '송가인', '1990-01-30', 1, '안녕하세요 송가인입니다~', '010-9494-9494', 1, 'H')

insert into member_info (member_name, birth, division_code, detail_info, contact, team_code, active_status)
values('임영웅', '1992-05-03', null, '국민아들 임영웅입니다~', 'hero@trot.com', 1, 'Y')

insert into member_info (member_name, birth, division_code, detail_info, contact, team_code, active_status)
values('태진아', null, null, null, '(1급 기밀)', 3, 'Y')

select * from department;
select * from job;
select
	count(*),
	dept.dept_title,
	j.job_name
from department dept
left join employee emp on dept.dept_id = emp.dept_code
join job j on j.job_code = emp.job_code 
where ((dept.dept_title = '기술지원부' and j.job_name = '대리') or (dept.dept_title = '인사관리부' and j.job_name = '사원') or (dept.dept_title like '%영업%' and j.job_name = '부장')) 
group by dept.dept_title


-- Q1

select
	EMP_NAME,
	concat( SUBSTRING(PHONE, 1, 3), '-',
        	SUBSTRING(PHONE, 4, 4), '-',
        	SUBSTRING(PHONE, 8, 4)) as PHONE
from employee
where phone like concat('010', '%');
-- substring(phone, 1, 3) = '010'

-- Q2
select * from employee;

-- 강사님 코드
select
	emp_name as 직원명,
	date_format(hire_date, '%Y년%m월%d일') as 입사일,
	format(SALARY,0) as 급여
from employee
where datediff(now(), hire_date) > (20*365)
order by hire_date, salary desc;

-- 내 코드
select
	emp_name as 직원명,
	date_format(hire_date, '%Y년%m월%d일') as 입사일,
	format(SALARY,0) as 급여
from employee
where timestampdiff(year, hire_date, curdate()) >= 20
order by hire_date, salary desc;



-- Q3
select * from employee;
select
	EMP_NAME,
	format(SALARY,0) as SALARY,
	round((count(*) / (select count(*) from employee)) * 100, 2) as 백분율
	-- TOTAL_SALARY
from employee;


-- Q4
select
	EMP_NAME,
	LPAD(EMAIL, 20, ' '),
	
from employee;