use employeedb;

-- SELECT(3) 실습문제
-- 부서별 직원 급여의 총합 중 가장 큰 액수를 출력하세요
select * from employee;

select dept_code, sum(salary) as SAL
from employee
where dept_code is not null
group by dept_code;

select MAX(SAL)
from (
	select dept_code, sum(salary) as SAL
	from employee
	where dept_code is not null
	group by dept_code
) as tbl_dept_sal;

-- ### Q2.
-- 서브쿼리를 이용하여 영업부인 직원들의 사원번호, 직원명, 부서코드, 급여를 출력하세요.
-- 참고. 영업부인 직원은 부서명에 ‘영업’이 포함된 직원임
select * from employee where dept_code in ('d4', 'd5', 'd6', 'd7');
select * from department;

select dept_id
from department
where dept_title like '%영업%'

-- 영업부인 직원들의 dept_id가 d4, d5, d6, d7
select
	emp_id,
	emp_name,
	dept_code,
	salary
from
	employee
where dept_code = (
	select dept_id
	from department
	where dept_title like '%영업%'
)
	
-- 서브쿼리와 JOIN을 이용하여 영업부인 직원들의 사원번호,
-- 직원명, 부서명, 급여를 출력하세요.
select * from employee;
select * from department;

select
	emp.emp_id,
	emp.emp_name,
	dep.dept_title,
	salary
from employee emp
join department dep on emp.dept_code = dep.dept_id
where emp.dept_code in (
	select dept_id
	from department
	where dept_title like '%영업%'
)


-- ### Q4.
-- 1. JOIN을 이용하여 부서의 부서코드, 부서명, 해당 부서가 위치한 지역명,
-- 국가명을 추출하는 쿼리를 작성하세요.
select * from department;
select * from location;
select * from nation;  

select
	dept.dept_id,
	dept.dept_title,
	loc.local_name,
	nat.national_name
from department dept
join location loc on dept.location_id = local_code
join nation nat on loc.national_code = nat.national_code

-- 2. 위 1에서 작성한 쿼리를 서브쿼리로 활용하여 모든 직원의 사원번호,
-- 직원명, 급여, 부서명, (부서의) 국가명을 출력하세요.
-- 단, 국가명 내림차순으로 출력되도록 하세요.
select
	emp.emp_id,
	emp.emp_name,
	emp.salary,
	dln.dept_title,
	dln.national_name
from employee emp
join (
	select
	dept.dept_id,
	dept.dept_title,
	loc.local_name,
	nat.national_name
from department dept
join location loc on dept.location_id = local_code
join nation nat on loc.national_code = nat.national_code
) as dln on (emp.dept_code = dln.dept_id)
order by dln.national_name


-- ### Q5.
-- 러*시아에서 발발한 전쟁으로 인해 정신적 피해를 입은 직원들에게 위로금을 전달하려고 합니다.
-- 위로금은 각자의 급여에 해당 직원의 급여 등급에 해당하는 최소 금액을 더한 금액으로 정했습니다.*
-- *Q4에서 작성한 쿼리를 활용하여 해당 부서의 국가가 ‘러시아’인 직원들을 대상으로,
-- 직원의 사원*번호, 직원명, 급여, 부서명, 국가명, 위로금을 출력하세요.
-- 단, 위로금의 결과 집합 헤더는 ‘위로금’으로 출력되도록 하고, 위로금 내림차순으로
-- 출력되도록 하세요.

select
	emp.emp_id,
	emp.emp_name,
	emp.salary,
	dln.dept_title,
	dln.national_name,
	emp.salary + sg.min_sal as '위로금'
from employee emp
join (
	select
	dept.dept_id,
	dept.dept_title,
	loc.local_name,
	nat.national_name
from department dept
join location loc on dept.location_id = local_code
join nation nat on loc.national_code = nat.national_code
) as dln on (emp.dept_code = dln.dept_id)
join sal_grade as sg on emp.sal_level = sg.sal_level
where dln.national_name = '러시아'
order by 위로금 desc;

-- 서브쿼리를 쓸 수 밖에 없는 사람
select
	dept_title,
	(select avg(salary) from employee) as salary
from department;


-- UPDATE / DELETE문에서 서브쿼리 사용
update employee e
set salary = salary * 1.1
where e.dept_id = (
	select dept_id from department
	where dept_name = '마케팅'
);

