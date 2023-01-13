-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- value - integer
-- previously_regifted boolean

CREATE TABLE gifts (id serial, gift TEXT, giver VARCHAR(30), value INT, previously_regifted BOOL);


-- 
\echo See details of the table you created
-- 

\d gifts;

-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME value TO price;

SELECT * from gifts;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO 
gifts (gift, 
giver,
price,
previously_regifted)
VALUES 
('peach candle',
'Santa',
9,
true);

SELECT * from gifts;

--
\echo Query for all the columns in your gifts table
-- 

\d gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES

('cinnamon candle', 'Nick', 19, TRUE),
('soap on a rope', 'Rudolf', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
('mango candle', 'The Boss', 49, FALSE)
;

SELECT * from gifts;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--

INSERT INTO gifts (gift, giver, price, previously_regifted)
VALUES
('melon candle', 'suzy', 12, FALSE),
('cinnamon candle', 'Nick', 19, TRUE),
('soap on a rope', 'Rudolf', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
('mango candle', 'The Boss', 49, FALSE)
;

SELECT * from gifts;

--
\echo Query for gifts with a price greater than or equal to 20
--

SELECT * FROM gifts WHERE price >= 20;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--

SELECT gift FROM gifts WHERE gift LIKE '%candle%';

--
\echo Query for every gift whose giver IS Santa OR value is greater than 30
--

SELECT * FROM gifts WHERE giver = 'Santa' OR price > 30;

--
\echo Query for every gift whose giver is NOT Santa
--

SELECT * FROM gifts WHERE giver != 'Santa';

--
\echo Update the second gift to have a value of 2999
-- 

UPDATE gifts SET price = 2999 WHERE id = 2 RETURNING *;


--
\echo Query for the updated item
--

SELECT * FROM gifts WHERE price = 2999 AND id =2;
SELECT * FROM gifts WHERE price = 2999 OR id =2;
--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--

DELETE FROM gifts WHERE giver = 'Santa' RETURNING gift, price;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;


-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 

SELECT COUNT(gift) FROM gifts WHERE gift LIKE '%candle%';

--
\echo Get the AVEREAGE value from all the gifts
--

SELECT AVG(price) FROM gifts;

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts ORDER BY price DESC LIMIT 3 OFFSET 2 ;

--
-- finish
--
DROP TABLE IF EXISTS gifts;
