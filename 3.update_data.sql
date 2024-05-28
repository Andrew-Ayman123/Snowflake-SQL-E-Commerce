-- update Tables
ALTER TABLE Customer
ADD cart_id INT NOT NULL;
ALTER TABLE CARRY
ADD no_of_product INT NOT NULL;
ALTER TABLE CONTAINSTA
ADD no_of_product INT NOT NULL;
--Update data
UPDATE Users
SET user_password = 'DB_123'
WHERE user_name = 'Alice Johnson';