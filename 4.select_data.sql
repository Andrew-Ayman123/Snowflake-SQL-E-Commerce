-- Show users with their phone numbers and address as an array
WITH
  ALL_USERS_WITH_ALL_PHONE
  AS

  (
    SELECT U.user_email, U.USER_NAME, ARRAY_AGG(UP.USER_PHONE_NUMBER) as USER_PHONE_NUMBERS
    FROM USERS as U
      LEFT JOIN user_user_phone_number as UP
      ON U.user_email=UP.user_email
    GROUP BY U.user_email,U.USER_NAME
  )
SELECT UP.user_email, UP.USER_NAME, UP.USER_PHONE_NUMBERS, ARRAY_AGG(UA.USER_ADDRESSES) as USER_ADDRESSES
FROM ALL_USERS_WITH_ALL_PHONE as UP
  LEFT JOIN user_user_addresses as UA
  ON UP.user_email=UA.user_email
GROUP BY UP.user_email,UP.USER_NAME,UP.USER_PHONE_NUMBERS;
-- Show admin info
SELECT A.admin_role, U.*
FROM ADMIN as A
  INNER JOIN USERS AS U
  ON A.user_email = U.user_email;
--show Age of users and ordring them fom oldest
SELECT user_email, user_name, BIRTH_OF_DATE , DATEDIFF(year,
BIRTH_OF_DATE,'2024-05-01'
::DATE ) AS age
FROM user
ORDER BY age DESC;
--get total no. of products per user
SELECT
  C.USER_EMAIL,
  IFNULL(SUM(CR.NO_OF_PRODUCT),0) AS total_no_of_products
FROM customer as C
  LEFT JOIN CARRY AS CR
  ON C.USER_EMAIL = CR.USER_EMAIL
GROUP BY C.USER_EMAIL
ORDER BY total_no_of_produts DESC;
-- Show total profit for each supplier
SELECT
  S.USER_EMAIL,
  IFNULL(SUM(P.PRODUCT_PRICE_PER_UNIT*P.PRODUCT_QUANTITY),0) AS total_profit
FROM SUPPLIER AS S
  LEFT JOIN PRODUCT as P
  ON S.user_email=P.user_email
GROUP BY S.user_email
ORDER BY total_profit DESC;