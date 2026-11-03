# Olist E-commerce Sales & Delivery Analysis

E-commerce sales and delivery analysis of the Olist dataset (2016–2018) using MySQL and Power BI.

## Objective
Understand how sales, customers, payments, reviews, and delivery perform on the Olist marketplace, and find what is working well and where the business can improve.

## Tools
MySQL (data cleaning, flat table, KPIs), Power BI (flat table and dashboard)

## Dataset
- Brazilian E-Commerce Public Dataset by Olist, 2016–2018 , Provided by ExcelR.
- 9 tables loaded (geolocation was loaded but not used in the KPIs), 8 joined into one flat table
- 99,441 orders and 112,650 order items
- Grain of the flat table: 1 row = 1 order item

## Data Preparation
- Aggregated payments and reviews at order level before joining, to avoid duplicate rows
- Created fields: delivery days, weekday/weekend, purchase hour, time slot, item_payment_value (payment split across items)
- Data quality issues found and fixed:
  - 610 products had a null category, and 2 categories were missing from the translation table
  - 775 orders had no item, and some orders had more than one review or payment row
  - Sao Paulo seller city was written in several spellings
  - Blank dates became zero dates during the MySQL load
  - A backslash in one review comment merged two rows

## Key Insights
- Total sales R$13.59M from 98,666 orders, average order value R$137.75
- Top category: health_beauty (R$1.26M)
- 1-star orders took 19.6 days to deliver, vs 10.65 days for 5-star orders
- Sales peak at 2 PM, and November 2017 was the biggest month (R$1.01M)
- Only 23% of orders are placed on weekends

## Recommendations
- Improve delivery in slow categories (for example office furniture, 20.84 days) and distant cities (for example Salvador), since slow delivery lowers review        scores
- Run promotions between 2 PM and 8 PM, when sales peak
- Add weekend offers to grow weekend orders

## Dashboard
6 KPIs and 9 charts built in Power BI.

## Files
- SQL_Olist_E_commerce_Analysis.sql – MySQL cleaning, flat table, and KPI queries
- power_bi_Olist_E-commerce Dashboard.pbix – Power BI dashboard
