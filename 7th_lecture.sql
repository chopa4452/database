-- TRIGGER

use menudb;

-- tbl_menu_log 테이블 생성

drop table if exists tbl_menu_log;

CREATE TABLE tbl_menu_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    menu_code INT,
    menu_name VARCHAR(100),
    action VARCHAR(10),
    action_time DATETIME
);

-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP TRIGGER IF EXISTS trg_after_menu_insert$$

-- AFTER INSERT 트리거 생성
CREATE TRIGGER trg_after_menu_insert
AFTER INSERT ON tbl_menu
FOR EACH ROW
BEGIN
    -- tbl_menu_log에 로그 기록 추가
    INSERT INTO tbl_menu_log (menu_code, menu_name, action, action_time)
    VALUES (NEW.menu_code, NEW.menu_name, 'INSERT', NOW());
END$$

-- DELIMITER 복구
DELIMITER ;

-- tbl_menu에 새로운 메뉴 추가
INSERT INTO tbl_menu (menu_name, menu_price, category_code, orderable_status)
VALUES ('트리거메뉴', 9000, 2, 'Y');

-- tbl_menu_log에서 로그 확인
SELECT * FROM tbl_menu_log;

DROP TABLE IF EXISTS tbl_menu_log;

CREATE TABLE tbl_menu_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    menu_code INT,
    menu_name VARCHAR(100),
    action VARCHAR(10),
    action_time DATETIME
);

DELIMITER $$


-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP TRIGGER IF EXISTS trg_after_menu_update$$

-- AFTER UPDATE 트리거 생성
CREATE TRIGGER trg_after_menu_update
AFTER UPDATE ON tbl_menu
FOR EACH ROW
BEGIN
    INSERT INTO tbl_menu_log (menu_code, menu_name, action, action_time)
    VALUES (NEW.menu_code, NEW.menu_name, 'UPDATE', NOW());
END$$

-- DELIMITER 복구
DELIMITER ;

-- tbl_menu에서 메뉴 정보 수정
UPDATE tbl_menu SET menu_price = 9500 WHERE menu_name = '트리거메뉴';

-- tbl_menu_log에서 로그 확인
SELECT * FROM tbl_menu_log;



-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP TRIGGER IF EXISTS trg_after_menu_delete$$

-- AFTER DELETE 트리거 생성
CREATE TRIGGER trg_after_menu_delete
AFTER DELETE ON tbl_menu
FOR EACH ROW
BEGIN
    -- 삭제 로그 기록
    INSERT INTO tbl_menu_log (menu_code, menu_name, action, action_time)
    VALUES (OLD.menu_code, OLD.menu_name, 'DELETE', NOW());
END$$

-- DELIMITER 복구
DELIMITER ;

-- tbl_menu에서 메뉴 삭제
DELETE FROM tbl_menu WHERE menu_name = '트리거메뉴';

-- tbl_menu_log에서 로그 확인
SELECT * FROM tbl_menu_log;

-- 존재하면 삭제하는 구문. 넣으면 좋다.
DROP TRIGGER IF EXISTS trg_after_menu_insert;
DROP TRIGGER IF EXISTS trg_after_menu_update;
DROP TRIGGER IF EXISTS trg_after_menu_delete;

SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE, ACTION_TIMING
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE TRIGGER_SCHEMA = 'menudb';   # 데이터베이스 명
-- Trigger 생성 권한 / 트리거를 생성하려면 해당 테이블에 대한 CREATE TRIGGER 권한이 필요하다.
grant TRIGGER ON menudb.* TO capybara@'%';
-- 권한 철회
REVOKE TRIGGER ON menudb.* FROM capybara@'%';

-- DELIMITER 변경
DELIMITER $$

-- 기존에 존재한다면 삭제
DROP TRIGGER IF EXISTS trg_before_insert_example$$

-- BEFORE INSERT 트리거 생성
CREATE TRIGGER trg_before_insert_example
BEFORE INSERT ON tbl_example
FOR EACH ROW
BEGIN
    -- value가 음수일 경우 에러 발생
    IF NEW.value < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '음수 값은 허용되지 않습니다.';
    END IF;
END$$

-- DELIMITER 복구
DELIMITER ;


----

-- 1. tbl_example 테이블 생성 (필요한 경우)
CREATE TABLE IF NOT EXISTS tbl_example (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value INT NOT NULL
);

-- 2. 트리거가 동작하는지 확인하기 위한 정상 데이터 삽입
INSERT INTO tbl_example (value) VALUES (10);

-- 3. 테이블 데이터 확인 (정상적으로 삽입되었는지 확인)
SELECT * FROM tbl_example;

-- 4. 음수 값 삽입 시도 (트리거 작동 여부 확인)
INSERT INTO tbl_example (value) VALUES (-5);

-- 5. 트리거로 인해 오류 발생 확인
-- 트리거 작동 시 다음과 같은 메시지가 반환되어야 함:
-- Error Code: 1644. 음수 값은 허용되지 않습니다.