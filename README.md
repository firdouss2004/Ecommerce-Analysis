# E-Commerce Analytics Dashboard

A complete end-to-end data analytics project on an e-commerce dataset — covering SQL analysis, business problem solving, and interactive Power BI dashboards.

---

## Project Overview

This project analyzes an 8-table e-commerce relational database to answer 13 real-world business questions using MySQL, and visualizes the insights through 3 Power BI dashboards covering Sales, Customer Behaviour, and Supply & Logistics.

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL | Data querying & analysis |
| Power BI Desktop | Dashboard & visualization |
| Microsoft Excel | Schema reference |
| GitHub | Version control & portfolio |

---

## Dataset Schema

The dataset contains 8 relational tables:

| Table | Description |
|-------|-------------|
| `Orders` | Order header — dates, amounts, customer, shipper, payment |
| `OrderDetails` | Line items — product, quantity, supplier per order |
| `Products` | Product info — name, brand, category, price, rating |
| `Category` | Product categories with active/inactive flag |
| `Customers` | Customer master — name, location, join date |
| `Suppliers` | Supplier companies and their country |
| `Shippers` | Shipping companies and contact |
| `Payments` | Payment methods and allowed status |

**Schema file:** [`data/ecommerce_schema.xlsx`](data/ecommerce_schema.xlsx)

---

## 13 Business Problem Statements & SQL Solutions

All 13 queries are in [`sql/Problem_Statement_Solutions.sql`](sql/Problem_Statement_Solutions.sql)

| # | Problem Statement | Key SQL Concept |
|---|-------------------|----------------|
| 1 | Number of customers connected each year | GROUP BY YEAR |
| 2 | Segment customers into New vs Old (cutoff: July 2020) | CASE WHEN |
| 3 | Avg order amount per customer per month in 2020 | GROUP BY CustomerID + MONTH |
| 4 | Most selling product in 2021 by number of orders | JOIN + ORDER BY + LIMIT |
| 5 | Supplier company that supplied the least products | JOIN + ORDER BY ASC + LIMIT |
| 6 | Premium customers with orders > ₹70,000 in last 3 months | HAVING + DATE_SUB |
| 7 | Top-selling and least-selling category in 2021 | JOIN + GROUP BY + LIMIT |
| 8 | Flag shippers with avg delivery time < 3 days | AVG + DATEDIFF + CASE |
| 9 | Avg delivery time per category by each shipper | Multi-table JOIN + GROUP BY |
| 10 | Most used payment method by customers | COUNT + ORDER BY |
| 11 | Monthly customers, orders, and revenue for 2021 | GROUP BY MONTH |
| 12 | Monthly cumulative revenue for 2021 | Window Function — SUM() OVER() |
| 13 | Category with the highest revenue | JOIN + SUM + ORDER BY |

---

## 3 Power BI Dashboards

### Dashboard 1 — Sales & Revenue
Tracks overall business performance including revenue trends, category breakdown, discount analysis, top products, and payment method split.

**Key visuals:** KPI cards · Line chart (monthly trend) · Bar chart (by category) · Donut (payment split) · Top 10 products table

![Sales Dashboard](screenshots/dashboard1_sales.png)

---

### Dashboard 2 — Customer Behaviour
Analyzes customer acquisition, segmentation, geographic distribution, and payment preferences.

**Key visuals:** KPI cards · Map (customers by country) · Line chart (new customers/month) · Donut (segments) · Top customers table

![Customer Dashboard](screenshots/dashboard2_customers.png)

---

### Dashboard 3 — Supply & Logistics
Monitors operational efficiency — shipper performance, delivery times, supplier volumes, and fulfillment speed.

**Key visuals:** KPI cards · Horizontal bar (shipper comparison) · Shipper flag table · Supplier volume table · Monthly shipment trend

![Logistics Dashboard](screenshots/dashboard3_logistics.png)

---

## Key Insights

- **Customer segmentation** reveals the split between one-time, regular, and loyal buyers — useful for targeted marketing campaigns
- **Discount analysis** by category highlights where margin is being given away vs where pricing is healthy
- **Shipper flagging** identifies which logistics partners consistently deliver in under 3 days — candidates for incentive programs
- **Cumulative revenue query (Q12)** uses SQL window functions to track monthly momentum against annual targets
- **Premium customer query (Q6)** directly supports a bank tie-up initiative by surfacing high-spend customers in the last 3 months


## How to Run

### SQL Queries
1. Import your data into MySQL
2. Open `sql/Problem_Statement_Solutions.sql` in MySQL Workbench
3. Run queries one by one — each is clearly labeled with its problem number

### Power BI Dashboards
1. Install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
2. Open `powerbi/ecommerce_dashboard.pbix`
3. Update the data source to your MySQL connection or local Excel file
4. Refresh data — all 3 dashboards populate automatically

---

## Author

Taskeen Firdous  
Data Analyst  

---

## License

This project is open source and available under the [MIT License](LICENSE).
