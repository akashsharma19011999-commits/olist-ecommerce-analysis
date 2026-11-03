CREATE DATABASE e_commerce;
use e_commerce;



# loading olist_customers_dataset


create table olist_customers_dataset(
customer_id	text,
customer_unique_id	text,
customer_zip_code_prefix	int,
customer_city	text,
customer_state text);

select*from olist_customers_dataset;
select count(*) from olist_customers_dataset;


SET global local_infile= on;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'D:/E commerce/olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

# olist_geolocation_dataset 

set global local_infile=1;


create table olist_geolocation_dataset(
geolocation_zip_code_prefix	int,
geolocation_lat	float,
geolocation_lng	float,
geolocation_city text,	
geolocation_state text);

load data local infile 'D:/E commerce/olist_geolocation_dataset.csv'
into table olist_geolocation_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from olist_geolocation_dataset;
select*from olist_geolocation_dataset;

set global local_infile=1;

select*from olist_geolocation_dataset;

# olist_order_items_dataset


CREATE TABLE olist_order_items_dataset (
    order_id text,
    order_item_id int,
    product_id text,
    seller_id text,
    shipping_limit_date DATETIME,
    price float,
    freight_value float
);

load data local infile 'D:/E commerce/olist_order_items_dataset.csv'
into table olist_order_items_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

 select count(*) from olist_order_items_dataset;

# olist_order_payments_dataset

create table olist_order_payments_dataset(order_id text,	payment_sequential int,	payment_type text,	payment_installments int, payment_value float);

load data local infile 'D:/E commerce/olist_order_payments_dataset.csv'
into table olist_order_payments_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from olist_order_payments_dataset;

# olist_order_reviews_dataset

create table olist_order_reviews_dataset(review_id text,	order_id text,	review_score int,	review_comment_title text,
review_comment_message text,	review_creation_date datetime,	review_answer_timestamp datetime);

load data local infile 'D:/E commerce/olist_order_reviews_dataset.csv'
into table olist_order_reviews_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\r\n'
ignore 1 lines;

select count(*) from olist_order_reviews_dataset;

SELECT * FROM olist_order_reviews_dataset
WHERE review_id = 'efe49f1d6f951dd88b51e6ccd4cc548f';

SELECT * FROM olist_order_reviews_dataset
WHERE review_id IN ('636b237e87574ba29654deaba9eb9797', '29a50943bdeaba02e4a222241a4b583a');

set global local_infile=0;

DELETE FROM olist_order_reviews_dataset
WHERE review_id = '636b237e87574ba29654deaba9eb9797';

INSERT INTO olist_order_reviews_dataset
(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
VALUES
('636b237e87574ba29654deaba9eb9797', 'd7361a834a2dd8db2f6f133ce291ab6b', 2, NULL,
 'foi escrito que o produto já foi entregue, mas não chegou nada :\\', '2017-03-04 00:00:00', '2017-03-09 22:01:37'),
('29a50943bdeaba02e4a222241a4b583a', 'f63f9a7699e3674c80a4ba92e56dfbb8', 5, NULL,
 'Minha primeira compra to satisfeito muito bom', '2017-10-11 00:00:00', '2017-10-11 15:56:12');
 
 SELECT COUNT(*) FROM olist_order_reviews_dataset;
SELECT review_score, COUNT(*) FROM olist_order_reviews_dataset GROUP BY review_score ORDER BY review_score;

select count(*) from olist_order_reviews_dataset;









DESCRIBE olist_order_reviews_dataset;

select*from olist_order_reviews_dataset;

# olist_orders_dataset
set global local_infile=1;

create table olist_orders_dataset(
order_id text,
customer_id text,
order_status text,	
order_purchase_timestamp datetime,
order_approved_at datetime,	
order_delivered_carrier_date timestamp,
order_delivered_customer_date datetime,	
order_estimated_delivery_date datetime);

load data local infile 'D:/E commerce/olist_orders_dataset.csv'
into table olist_orders_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from olist_orders_dataset;
select*from olist_orders_dataset;

# olist_products_dataset

create table olist_products_dataset(product_id text,	product_category_name text, product_name_lenght float,	product_description_lenght float,
	product_photos_qty int,	product_weight_g float,	product_length_cm float,	product_height_cm float,	product_width_cm float);
    
    load data local infile 'D:/E commerce/olist_products_dataset.csv'
into table olist_products_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from olist_products_dataset;

# olist_seller_dataset 
    create table olist_sellers_dataset (seller_id	text, seller_zip_code_prefix int,	seller_city	text, seller_state text);
    
    load data local infile 'D:/E commerce/olist_sellers_dataset.csv'
into table olist_sellers_dataset
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from olist_sellers_dataset;

# product_category_name_translation

create table product_category_name_translation(product_category_name text,	product_category_name_english text);

load data local infile 'D:/E commerce/product_category_name_translation.csv'
into table product_category_name_translation
character set latin1
fields terminated by ','
enclosed by'"'
lines terminated by '\n'
ignore 1 lines;

select count(*) from product_category_name_translation;
select *from product_category_name_translation;





SELECT 'customers' AS tbl, COUNT(*) AS total_rows FROM olist_customers_dataset
UNION ALL SELECT 'geolocation', COUNT(*) FROM olist_geolocation_dataset
UNION ALL SELECT 'order_items', COUNT(*) FROM olist_order_items_dataset
UNION ALL SELECT 'order_payments', COUNT(*) FROM olist_order_payments_dataset
UNION ALL SELECT 'order_reviews', COUNT(*) FROM olist_order_reviews_dataset
UNION ALL SELECT 'orders', COUNT(*) FROM olist_orders_dataset
UNION ALL SELECT 'products', COUNT(*) FROM olist_products_dataset
UNION ALL SELECT 'sellers', COUNT(*) FROM olist_sellers_dataset
UNION ALL SELECT 'translation', COUNT(*) FROM product_category_name_translation;


--  Data Loaded 

--

USE e_commerce;
SHOW TABLES;

SELECT
  SUM(order_approved_at IS NULL)                         AS approved_null,
  SUM(order_approved_at < '1900-01-01')                  AS approved_zero,
  SUM(order_delivered_carrier_date IS NULL)              AS carrier_null,
  SUM(order_delivered_carrier_date < '1900-01-01')       AS carrier_zero,
  SUM(order_delivered_customer_date IS NULL)             AS customer_null,
  SUM(order_delivered_customer_date < '1900-01-01')      AS customer_zero
FROM olist_orders_dataset;

SELECT
  SUM(product_category_name IS NULL) AS category_null,
  SUM(product_category_name = '')    AS category_blank
FROM olist_products_dataset;

SET SQL_SAFE_UPDATES = 0;

UPDATE olist_orders_dataset
SET order_approved_at = NULL
WHERE order_approved_at < '1900-01-01';

UPDATE olist_orders_dataset
SET order_delivered_carrier_date = NULL
WHERE order_delivered_carrier_date < '1900-01-01';

UPDATE olist_orders_dataset
SET order_delivered_customer_date = NULL
WHERE order_delivered_customer_date < '1900-01-01';

UPDATE olist_products_dataset
SET product_category_name = NULL
WHERE product_category_name = '';

SET SQL_SAFE_UPDATES = 1;

SELECT
  SUM(order_approved_at IS NULL)                         AS approved_null,
  SUM(order_approved_at < '1900-01-01')                  AS approved_zero,
  SUM(order_delivered_carrier_date IS NULL)              AS carrier_null,
  SUM(order_delivered_carrier_date < '1900-01-01')       AS carrier_zero,
  SUM(order_delivered_customer_date IS NULL)             AS customer_null,
  SUM(order_delivered_customer_date < '1900-01-01')      AS customer_zero
FROM olist_orders_dataset;


SET SQL_SAFE_UPDATES = 0;

UPDATE olist_orders_dataset
SET order_delivered_carrier_date = NULL
WHERE order_delivered_carrier_date < '1900-01-01';	

SHOW COLUMNS FROM olist_orders_dataset LIKE 'order_delivered_carrier_date';

SET SESSION sql_mode = '';
SET SQL_SAFE_UPDATES = 0;
UPDATE olist_orders_dataset SET order_delivered_carrier_date = NULL WHERE order_delivered_carrier_date < '1900-01-01';

SET SQL_SAFE_UPDATES = 1;

SHOW COLUMNS FROM olist_orders_dataset LIKE 'order_delivered_carrier_date';

set global local_infile=0;

UPDATE olist_orders_dataset
SET order_delivered_carrier_date = NULL
WHERE CAST(order_delivered_carrier_date AS CHAR) = '0000-00-00 00:00:00';

SELECT COUNT(*) AS carrier_null
FROM olist_orders_dataset
WHERE order_delivered_carrier_date IS NULL;

SELECT
  SUM(product_category_name IS NULL) AS category_null,
  SUM(product_category_name = '')    AS category_blank
FROM olist_products_dataset;

# Flat Table
# clean table of product category(english category)

CREATE TABLE products_clean AS
SELECT
    p.product_id,
    CASE
        WHEN p.product_category_name IS NULL THEN 'unknown'
        WHEN p.product_category_name = 'pc_gamer' THEN 'pc_gamer'
        WHEN p.product_category_name = 'portateis_cozinha_e_preparadores_de_alimentos' THEN 'portable_kitchen_food_preparers'
        ELSE COALESCE(t.product_category_name_english, 'unknown')
    END AS category
FROM olist_products_dataset p
LEFT JOIN product_category_name_translation t
       ON p.product_category_name = t.product_category_name;
       
       SELECT COUNT(*) AS total_rows,
       SUM(category = 'unknown') AS unknown_rows
FROM products_clean;

# clean table of payments

CREATE TABLE payments_agg AS
SELECT
    a.order_id,
    a.order_payment_value,
    a.payment_installments,
    a.has_credit_card,
    m.payment_type
FROM (
    SELECT
        order_id,
        SUM(payment_value)               AS order_payment_value,
        MAX(payment_installments)        AS payment_installments,
        MAX(payment_type = 'credit_card') AS has_credit_card
    FROM olist_order_payments_dataset
    GROUP BY order_id
) a
JOIN (
    SELECT order_id, payment_type
    FROM (
        SELECT order_id, payment_type,
               ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY payment_value DESC) AS rn
        FROM olist_order_payments_dataset
    ) x
    WHERE rn = 1
) m ON a.order_id = m.order_id;

SELECT COUNT(*) AS total_rows,
       SUM(has_credit_card) AS credit_card_orders,
       ROUND(SUM(order_payment_value), 2) AS total_payment
FROM payments_agg;

# clean table of reviews 

CREATE TABLE reviews_agg AS
SELECT order_id, review_score
FROM (
    SELECT order_id, review_score,
           ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY review_answer_timestamp DESC) AS rn
    FROM olist_order_reviews_dataset
) x
WHERE rn = 1;

SELECT review_score, COUNT(*) AS total
FROM reviews_agg
GROUP BY review_score
ORDER BY review_score;

# clean table of customes

CREATE TABLE customers_clean AS
SELECT
    customer_id,
    customer_unique_id,
    LOWER(TRIM(customer_city)) AS customer_city
FROM olist_customers_dataset;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customer_unique_id) AS unique_customers,
       SUM(customer_city = 'sao paulo') AS sao_paulo_rows
FROM customers_clean;

# clean table of sellers 

CREATE TABLE sellers_clean AS
SELECT
    seller_id,
    CASE
        WHEN LOWER(TRIM(seller_city)) IN (
            'sao paulo', 'são paulo', 'sao  paulo', 'sao paulo - sp',
            'sao paulo sp', 'sao paulo / sao paulo', 'sao paulop'
        ) THEN 'sao paulo'
        ELSE LOWER(TRIM(seller_city))
    END AS seller_city
FROM olist_sellers_dataset;

SELECT COUNT(*) AS total_rows,
       SUM(seller_city = 'sao paulo') AS sao_paulo_rows
FROM sellers_clean;

# Table of orders table 

CREATE TABLE order_totals AS
SELECT
    order_id,
    SUM(price + freight_value) AS order_total
FROM olist_order_items_dataset
GROUP BY order_id;

SELECT COUNT(*) AS total_rows,
       ROUND(SUM(order_total), 2) AS total_value
FROM order_totals;

# Flat table ------------------------------------------------------------------------------------------------------------------------------------------------- 

CREATE TABLE flat_table AS
SELECT
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.seller_id,
    i.price,
    i.freight_value,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    c.customer_unique_id,
    c.customer_city,
    p.category,
    s.seller_city,
    pa.order_payment_value,
    pa.payment_installments,
    pa.has_credit_card,
    pa.payment_type,
    r.review_score,
    TIMESTAMPDIFF(SECOND, o.order_purchase_timestamp, o.order_delivered_customer_date) / 86400 AS delivery_days,
    CASE WHEN WEEKDAY(o.order_purchase_timestamp) >= 5 THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    HOUR(o.order_purchase_timestamp) AS purchase_hour,
    CASE
        WHEN HOUR(o.order_purchase_timestamp) < 6  THEN 'Night'
        WHEN HOUR(o.order_purchase_timestamp) < 12 THEN 'Morning'
        WHEN HOUR(o.order_purchase_timestamp) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_slot,
    i.price + i.freight_value AS item_total,
    ot.order_total,
    CASE
        WHEN ot.order_total IS NULL OR ot.order_total = 0 THEN NULL
        ELSE pa.order_payment_value * (i.price + i.freight_value) / ot.order_total
    END AS item_payment_value
FROM olist_order_items_dataset i
LEFT JOIN olist_orders_dataset o  ON i.order_id    = o.order_id
LEFT JOIN customers_clean c       ON o.customer_id = c.customer_id
LEFT JOIN products_clean p        ON i.product_id  = p.product_id
LEFT JOIN sellers_clean s         ON i.seller_id   = s.seller_id
LEFT JOIN payments_agg pa         ON i.order_id    = pa.order_id
LEFT JOIN reviews_agg r           ON i.order_id    = r.order_id
LEFT JOIN order_totals ot         ON i.order_id    = ot.order_id;


SELECT
    COUNT(*)                              AS total_rows,
    ROUND(SUM(price), 2)                  AS total_price,
    ROUND(SUM(item_payment_value), 2)     AS total_payment,
    COUNT(DISTINCT order_id)              AS total_orders,
    COUNT(DISTINCT customer_unique_id)    AS total_customers,
    COUNT(DISTINCT seller_id)             AS total_sellers
FROM flat_table;

select*from flat_table;	-- Data Cleaning and transformation completed here 


# KPI 1: Total Sale, Delivered Sale, Total Customer, Total Seller

SELECT
    ROUND(SUM(price), 2) AS total_sale,
    ROUND(SUM(CASE WHEN order_status = 'delivered' THEN price ELSE 0 END), 2) AS delivered_sale,
    COUNT(DISTINCT customer_unique_id) AS total_customer,
    COUNT(DISTINCT seller_id) AS total_seller
FROM flat_table;


-- KPI 2 : Weekday vs Weekend payment statistics

SELECT
    day_type,
    ROUND(SUM(item_payment_value), 2) AS total_payment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(item_payment_value) / COUNT(DISTINCT order_id), 2) AS avg_payment_per_order
FROM flat_table
GROUP BY day_type;


-- Orders which have review score 5 through Credit Payments

SELECT COUNT(DISTINCT order_id) AS credit_card_5star_orders
FROM flat_table
WHERE review_score = 5
  AND has_credit_card = 1;
  
  -- KPI 4: 5-star orders by payment type
  
SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS five_star_orders
FROM flat_table
WHERE review_score = 5
GROUP BY payment_type
ORDER BY five_star_orders DESC;

-- KPI 5: Shop-wise average delivery days (pet shop, audio, home appliances 2)

SELECT category, LENGTH(category) AS len
FROM products_clean
WHERE category LIKE '%pet%'
GROUP BY category, LENGTH(category);


SET SQL_SAFE_UPDATES = 0;

UPDATE products_clean
SET category = REPLACE(category, CHAR(13), '');

UPDATE flat_table
SET category = REPLACE(category, CHAR(13), '');

SET SQL_SAFE_UPDATES = 1;

SELECT category, LENGTH(category) AS len
FROM products_clean
WHERE category LIKE '%pet%'
GROUP BY category, LENGTH(category);

SELECT
    category,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM flat_table
WHERE category IN ('pet_shop', 'audio', 'home_appliances_2')
GROUP BY category
ORDER BY avg_delivery_days; -- KPI 5 here 


-- KPI 6: Category-wise average payment value (pet shop, audio, home appliances 2)

SELECT
    category,
    ROUND(AVG(item_payment_value), 2) AS avg_payment_value
FROM flat_table
WHERE category IN ('pet_shop', 'audio', 'home_appliances_2')
GROUP BY category
ORDER BY avg_payment_value;


-- KPI 7: Top 10 sales categories

SELECT
    category,
    ROUND(SUM(price), 2) AS total_sale
FROM flat_table
GROUP BY category
ORDER BY total_sale DESC
LIMIT 10;


-- Kpi 8: Average delivery days based on review scores

SELECT
    review_score,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM flat_table
WHERE review_score IS NOT NULL
GROUP BY review_score
ORDER BY review_score;

--  KPI 9: Average price and average payment for customers in Sao Paulo

SELECT
    ROUND(AVG(price), 2)              AS avg_price,
    ROUND(AVG(item_payment_value), 2) AS avg_payment
FROM flat_table
WHERE customer_city = 'sao paulo';

-- KPI 10: Average price and average payment for sellers in Sao Paulo

SELECT
    ROUND(AVG(price), 2)              AS avg_price,
    ROUND(AVG(item_payment_value), 2) AS avg_payment
FROM flat_table
WHERE seller_city = 'sao paulo';

-- KPI 11: Peak Hours Sales (the time of day with the highest sales) -- important KPI

SELECT
    purchase_hour,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2)     AS total_sale
FROM flat_table
GROUP BY purchase_hour
ORDER BY purchase_hour;
-- Insight - The highest number of orders occurs at 16:00 (6,628), and the highest sales occur at 14:00 (948,289.93).

-- KPI 12: Time slot wise sale (Morning, Afternoon, Evening, Night)

SELECT
    time_slot,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2)     AS total_sale
FROM flat_table
GROUP BY time_slot
ORDER BY total_sale DESC;
-- Insight - The highest volume of sales occurs in the afternoon (between 12 and 6 PM).

-- KPI 13: Basic summary KPIs

SELECT
    COUNT(DISTINCT order_id)                              AS total_orders,
    COUNT(*)                                              AS total_items_sold,
    ROUND(SUM(freight_value), 2)                          AS total_freight,
    ROUND(SUM(price) / COUNT(DISTINCT order_id), 2)       AS avg_order_value,
    ROUND(AVG(price), 2)                                  AS avg_item_price,
    COUNT(DISTINCT product_id)                            AS unique_products_sold,
    ROUND(SUM(item_payment_value), 2)                     AS total_payment,
    ROUND(SUM(item_payment_value) / COUNT(DISTINCT order_id), 2) AS avg_payment_per_order
FROM flat_table;


-- KPI 14: Review KPIs

SELECT
    COUNT(*)                                            AS orders_with_review,
    ROUND(AVG(review_score), 2)                         AS avg_review_score,
    SUM(review_score = 1)                               AS star_1,
    SUM(review_score = 2)                               AS star_2,
    SUM(review_score = 3)                               AS star_3,
    SUM(review_score = 4)                               AS star_4,
    SUM(review_score = 5)                               AS star_5,
    ROUND(SUM(review_score = 5) * 100 / COUNT(*), 2)    AS pct_5_star,
    ROUND(SUM(review_score = 1) * 100 / COUNT(*), 2)    AS pct_1_star
FROM (
    SELECT DISTINCT order_id, review_score
    FROM flat_table
    WHERE review_score IS NOT NULL
) t;

-- KPI 15: Order status breakdown and delivery KPIs
SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(COUNT(DISTINCT order_id) * 100 /
          (SELECT COUNT(DISTINCT order_id) FROM flat_table), 2) AS pct_of_orders
FROM flat_table
GROUP BY order_status
ORDER BY total_orders DESC;

-- KPI 16: Overall delivery days aur fastest / slowest categories

SELECT ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM flat_table;

-- KPI 16: Categories with the fastest and slowest deliveries
-- Note: Categories with fewer than 100 delivered items do not have a reliable average, so we exclude them.

SELECT
    category,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM flat_table
GROUP BY category
HAVING COUNT(delivery_days) >= 100
ORDER BY avg_delivery_days ASC
LIMIT 5;

-- KPI 17: 5 Slowest categories 
SELECT
    category,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM flat_table
GROUP BY category
HAVING COUNT(delivery_days) >= 100
ORDER BY avg_delivery_days DESC
LIMIT 5;

-- KPI 17: Share of payment types and average installments

SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(COUNT(DISTINCT order_id) * 100 /
          (SELECT COUNT(DISTINCT order_id) FROM flat_table), 2) AS pct_of_orders,
    ROUND(AVG(payment_installments), 2) AS avg_installments
FROM flat_table
GROUP BY payment_type
ORDER BY total_orders DESC;


-- KPI 18: Percentage od credit card orders
SELECT
    COUNT(DISTINCT CASE WHEN has_credit_card = 1 THEN order_id END) AS credit_card_orders,
    COUNT(DISTINCT order_id)                                        AS total_orders,
    ROUND(COUNT(DISTINCT CASE WHEN has_credit_card = 1 THEN order_id END) * 100
          / COUNT(DISTINCT order_id), 2)                            AS pct_credit_card
FROM flat_table;

-- KPI 19: Year-wise and month-wise sales

-- (A) Year-wise sales 

SELECT
    YEAR(order_purchase_timestamp)  AS order_year,
    COUNT(DISTINCT order_id)        AS total_orders,
    ROUND(SUM(price), 2)            AS total_sale
FROM flat_table
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY order_year;

-- (B) Month-wise sales

SELECT
    YEAR(order_purchase_timestamp)   AS order_year,
    MONTH(order_purchase_timestamp)  AS order_month,
    COUNT(DISTINCT order_id)         AS total_orders,
    ROUND(SUM(price), 2)             AS total_sale
FROM flat_table
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY order_year, order_month;

-- KPI 20: Day-wise Sales (Mon to Sun)
SELECT
    WEEKDAY(order_purchase_timestamp)  AS day_no,
    DAYNAME(order_purchase_timestamp)  AS day_name,
    COUNT(DISTINCT order_id)           AS total_orders,
    ROUND(SUM(price), 2)               AS total_sale
FROM flat_table
GROUP BY WEEKDAY(order_purchase_timestamp), DAYNAME(order_purchase_timestamp)
ORDER BY day_no;
-- Insight: Sales are highest on Monday and lowest on Saturday.

-- KPI 21A: Category-wise average review score (best and worst) 

SELECT
    category,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    COUNT(review_score)         AS rated_items
FROM flat_table
GROUP BY category
HAVING COUNT(review_score) >= 100
ORDER BY avg_review_score DESC
LIMIT 5;

-- KPI 21B: The 5 worst categories (based on review scores)
SELECT
    category,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    COUNT(review_score)         AS rated_items
FROM flat_table
GROUP BY category
HAVING COUNT(review_score) >= 100
ORDER BY avg_review_score ASC
LIMIT 5;


-- KPI 22: City-wise average delivery days (top 10 customer cities)

SELECT
    customer_city,
    COUNT(DISTINCT order_id)       AS total_orders,
    ROUND(AVG(delivery_days), 2)   AS avg_delivery_days
FROM flat_table
GROUP BY customer_city
ORDER BY total_orders DESC
LIMIT 10;


-- KPI 23: Sales-wise bottom 10 categories

SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2)     AS total_sale,
    ROUND(AVG(price), 2)     AS avg_price
FROM flat_table
GROUP BY category
ORDER BY total_sale ASC
LIMIT 10;

-- KPI 24: Sales-wise top 10 customer cities

SELECT
    customer_city,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2)     AS total_sale
FROM flat_table
GROUP BY customer_city
ORDER BY total_sale DESC
LIMIT 10;

-- KPI 25: Sales-wise top 10 seller cities

SELECT
    seller_city,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(price), 2)     AS total_sale
FROM flat_table
GROUP BY seller_city
ORDER BY total_sale DESC
LIMIT 10;


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------