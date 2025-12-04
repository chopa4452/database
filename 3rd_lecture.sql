use menudb;

CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT INTO phone (phone_code , phone_name , phone_price )
VALUES (1, 'galaxyS23', 1200000),
       (2, 'iPhone14pro', 1433000),
       (3, 'galaxyZfold3', 1730000);

SELECT * FROM phone;

select * from phone where phone_name = 'galaxyS23';

EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

CREATE INDEX idx_name 
ON phone (phone_name);

EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

CREATE INDEX idx_name_price
ON phone (phone_name, phone_price);

SHOW INDEX FROM phone;

SELECT * FROM phone WHERE phone_name = 'iPhone14pro';

EXPLAIN SELECT * FROM phone WHERE phone_name = 'iPhone14pro';

OPTIMIZE TABLE phone;

DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;

DROP INDEX idx_name_price ON phone;
SHOW INDEX FROM phone;