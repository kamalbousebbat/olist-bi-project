# olist-bi-project

# 🛒 BI Project — E-commerce Analysis (Olist Dataset)

##  Overview
This project presents a complete Business Intelligence (BI) pipeline built on the Brazilian e-commerce dataset provided by :contentReference[oaicite:0]{index=0}.  
The objective is to design a professional BI architecture: from raw data extraction to a star-schema Data Warehouse and interactive dashboards.

**Goal:**  
Transform raw transactional data into actionable business insights for decision-makers.

---

##  BI Architecture

**Data Flow:**

---

##  Data Warehouse Model (Star Schema)

**Fact Table**
- `Sales` (1 row = 1 product in 1 order)

**Dimensions**
- `Time`
- `Product`
- `Customer`
- `Seller`

**Main Measures**
- `price`
- `freight_value`
- `total_item_value`
- `delivery_delay_days`
- `review_score`
- `is_delivered`

---

##  ETL Process (Pentaho)

- Extract data from SQLite source tables:
  - orders, order_items, order_payments, order_reviews, products, customers, sellers, geolocation
- Transformations:
  - Joins between transactional tables
  - Data cleaning (NULL handling, duplicates)
  - Calculated measures (total_item_value, delivery_delay_days, is_delivered)
  - Mapping surrogate keys to dimensions
- Load:
  - Dimensions first
  - Fact table (`Sales`) last

---

## Data Quality & Validation

To ensure data reliability, several validation checks were performed:

- ✔ Row count comparison between SQLite and DWH  
- ✔ Revenue totals comparison  
- ✔ Average delivery delay comparison  
- ✔ Average review score comparison  
- ✔ Referential integrity (no NULL foreign keys in fact table)

Results between source and Data Warehouse are consistent, validating the ETL pipeline.

---

## Power BI Report Structure

The Power BI report contains:

- **Overview  & Dashboard**  
  Executive summary with main KPIs (Revenue, Orders, Delivery Rate, Avg Review Score)

- **Time Analysis**  
  Monthly and yearly sales trends

- **Product Analysis**  
  Top categories and products by revenue

- **Satisfaction & Delivery**  
  Customer review distribution and delivery performance

- **Seller Performance**  
  Top sellers and sales distribution

---

##  Key KPIs

- Total Revenue  
- Total Orders  
- Top Product Categories  
- Average Delivery Delay  
- Delivery Rate (%)  
- Average Review Score  

---

##  Tech Stack

- **Source:** SQLite  
- **ETL:** Pentaho Data Integration  
- **Data Warehouse:** MySQL  
- **Visualization:** Power BI  

---

##  Project Structure



---

##  How to Run the Project

1. Import the Olist SQLite database  
2. Create the Data Warehouse schema in MySQL  
3. Run Pentaho ETL transformations (dimensions → fact)  
4. Open the Power BI file and refresh data source  
5. Explore dashboards and insights  

---



##  Author

**Kamal Bousebbat**  
BI / Data Analytics Project  
2026
