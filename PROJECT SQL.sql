-- Data Cleaning project
SELECT *
FROM starbucks.directory;

-- remove dublicate 
-- standardize the data 
-- null values or blank values 
-- remove any columns or rows

CREATE TABLE starbucks.starbucks_cafe
LIKE starbucks.directory;
INSERT starbucks.starbucks_cafe
SELECT*
FROM starbucks.directory;

-- 1. Remove Duplicates
# First let's check for duplicates

SELECT*
FROM starbucks.starbucks_cafe;

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`, City, Country
) AS row_num
FROM starbucks.starbucks_cafe;

SELECT*
FROM(SELECT  Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`, City, Country,
ROW_NUMBER() OVER(
PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`,City ,Country
) AS row_num
FROM starbucks.starbucks_cafe)duplicates
WHERE row_num>1;

WITH duplicate_cte AS
(SELECT*,
ROW_NUMBER() OVER(
PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`,City, Country
) AS row_num
FROM starbucks.starbucks_cafe)
SELECT*
FROM duplicate_cte
WHERE row_num>1;

SELECT*
FROM  starbucks.starbucks_cafe
WHERE `City`='Ajman';

SELECT*
FROM(SELECT  Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`, City, Country,
ROW_NUMBER() OVER(
PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`,City ,Country
) AS row_num
FROM starbucks.starbucks_cafe)duplicates
WHERE row_num>1;

CREATE TABLE starbucks.starbucks_cafe2 (
  `Brand` text,
  `Store Number` text,
  `Store Name` text,
  `Ownership Type` text,
  `Street Address` text,
  `City` text,
  `State/Province` text,
  `Country` text,
  `Postcode` text,
  `Phone Number` text,
  `Timezone` text,
  `Longitude` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT*
FROM starbucks.starbucks_cafe2
WHERE row_num > 1;

INSERT INTO starbucks.starbucks_cafe2
SELECT*,
ROW_NUMBER() OVER(PARTITION BY Brand, `Store Number`, `Store Name`, `Ownership Type`, `Street Address`, City, Country)
AS row_num
FROM starbucks.starbucks_cafe;

DELETE
FROM starbucks.starbucks_cafe2
WHERE row_num > 1;

SELECT*
FROM starbucks.starbucks_cafe2;

-- 2.standardize the data 
SELECT City,TRIM(City)
FROM starbucks.starbucks_cafe2;

UPDATE  starbucks.starbucks_cafe2
SET City=TRIM(City);

SELECT *
FROM starbucks.starbucks_cafe2
WHERE City='Ajman';

UPDATE starbucks.starbucks_cafe2
SET city = 'Ajman'
WHERE City = 'Ajman';

SELECT City
FROM starbucks.starbucks_cafe2
WHERE City = 'Ajman';

SELECT DISTINCT City,TRIM(TRAILING '-' FROM City)
FROM starbucks.starbucks_cafe2;

UPDATE starbucks.starbucks_cafe2
SET City =TRIM(TRAILING '-' FROM City)
WHERE City = 'Ajman';

SELECT*
FROM starbucks.starbucks_cafe2;

ALTER TABLE starbucks.starbucks_cafe2
MODIFY COLUMN `Phone Number` TEXT;

SELECT*
FROM starbucks.starbucks_cafe2;

SELECT *
FROM starbucks.starbucks_cafe2
WHERE (`Phone Number` IS NULL OR `Phone Number` = '')
  AND (`Postcode` IS NULL OR `Postcode` = '');


UPDATE starbucks.starbucks_cafe2
SET `Phone Number` = NULL
WHERE `Phone Number` = '';

UPDATE starbucks.starbucks_cafe2
SET `Postcode` = NULL
WHERE `Postcode` = '';

SELECT*
FROM starbucks.starbucks_cafe2;

SELECT t1.`Store Name`, t1.`Phone Number`, t2.`Phone Number` AS correct_phone
FROM starbucks.starbucks_cafe2 t1
JOIN starbucks.starbucks_cafe2 t2
  ON t1.`Store Name` = t2.`Store Name`
WHERE (t1.`Phone Number` IS NULL OR t1.`Phone Number` = '')
  AND t2.`Phone Number` IS NOT NULL;
  
UPDATE starbucks.starbucks_cafe2 t1
JOIN starbucks.starbucks_cafe2 t2
  ON t1.`Store Name` = t2.`Store Name`
SET t1.`Phone Number` = t2.`Phone Number`
WHERE (t1.`Phone Number` IS NULL OR t1.`Phone Number` = '')
  AND t2.`Phone Number` IS NOT NULL;
  
SELECT*
FROM starbucks.starbucks_cafe2;

UPDATE starbucks.starbucks_cafe2 t1
JOIN starbucks.starbucks_cafe2 t2
  ON t1.`Store Name` = t2.`Store Name`
SET t1.`Postcode` = t2.`Postcode`
WHERE (t1.`Postcode` IS NULL OR t1.`Postcode` = '')
  AND t2.`Postcode` IS NOT NULL;

DELETE
FROM starbucks.starbucks_cafe2
WHERE (`Phone Number` IS NULL AND `Phone Number` = '')
  AND (`Postcode` IS NULL AND `Postcode` = '');

SELECT*
FROM starbucks.starbucks_cafe2;

ALTER TABLE starbucks.starbucks_cafe2
DROP COLUMN row_num;

SELECT*
FROM starbucks.starbucks_cafe2;

