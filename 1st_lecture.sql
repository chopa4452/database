-- 유저 생성
create user 'capybara'@'%' IDENTIFIED by 'capybara';

-- 사용할 데이터베이스(스키마) 변경
use mysql;

-- user 목록 확인
select * from user;

-- 스키마 생성
create database menudb;

-- menudb에 대한 모든 권한 설정
GRANT ALL PRIVILEGES ON menudb.* TO 'capybara'@'%';

-- 해당 사용자 권한 확인
show grants for 'capybara'@'%'

use menudb;

-- tb1 테이블 생성
create table if not exists tb1 (
	pk int primary key,
	fk int,
	col1 varchar(255),
	check(col1 in ('Y', 'N'))
) engine = innodb;

-- 테이블 컬럼 정보 확인
describe tb1;

-- 기본 select 문
select * from tb1;

-- 기본 insert 구문 (insert into 테이블명 values(값)
insert into tb1 values (1, 10, 'Y');
-- 순서를 정해서 할 수도 있다.
-- insert into tb1(pk, col1, fk) values (1, 'Y', 10)

select * from tb1;

CREATE TABLE IF NOT EXISTS tb2 (
    pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

describe tb2;

-- AUTO increment 컬럼은 null값이 들어와야 한다.
INSERT INTO tb2 VALUES (null, 10, 'Y');
INSERT INTO tb2 VALUES (null, 20, 'Y');

SELECT * FROM tb2;

-- ALTER
-- ALTER TABLE 테이블행 ADD 컬럼명

-- tb2 col2 컬럼 추가
ALTER TABLE tb2
ADD col2 INT NOT NULL;

DESCRIBE tb2;

ALTER TABLE tb2 DROP COLUMN col2;

DESCRIBE tb2;

-- 행 이름 및 데이터 형식 변경 : ALTER TABLE 테이블명 CHANGE COLUMN 기존컬럼명 바꿀 컬럼명 컬럼정의
alter table tb2 change column fk change_fk int not null;

DESCRIBE tb2;

-- 계약 조건 삭제 : ALTER TABLE 테이블명 drop 제약조건
alter table tb2 drop primary key;

-- 컬럼 정의 변경
alter table tb2 modify pk int;

describe tb2;

-- 다시 primary key 제약조건 제거
alter table tb2 drop primary key;

describe tb2;

-- 다시 primary key 제약조건 추가
alter table tb2 add primary key(pk);

describe tb2;

-- 한번에 여러개 컬럼 추가
alter table tb2
add col3 date not null,
ADD col4 TINYINT NOT NULL;

SELECT @@GLOBAL.sql_mode;     -- MySQL 데이터베이스 서버의 전역 SQL 모드 설정을 조회하는 쿼리

set GLOBAL sql_mode = '';

SELECT @@GLOBAL.sql_mode;

-- 한번에 여러개 컬럼 추가(재진행)
alter table tb2
add col3 date not null,
ADD col4 TINYINT NOT NULL;

-- tb3 테이블 생성
CREATE TABLE IF NOT EXISTS tb3 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

describe tb3;

-- tb3 테이블 삭제
DROP TABLE IF EXISTS tb3;

-- tb4 테이블 생성
CREATE TABLE IF NOT EXISTS tb4 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

-- tb5 테이블 생성
CREATE TABLE IF NOT EXISTS tb5 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

-- 한번에 2개의 테이 삭제
DROP TABLE IF EXISTS tb4, tb5;

CREATE TABLE IF NOT EXISTS tb6 (
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 VARCHAR(255),
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

describe tb6;

-- 4개 행 데이터 INSERT
INSERT INTO tb6 VALUES (null, 10, 'Y');
INSERT INTO tb6 VALUES (null, 20, 'Y');
INSERT INTO tb6 VALUES (null, 30, 'Y');
INSERT INTO tb6 VALUES (null, 40, 'Y');

select * from tb6;

truncate tb6;