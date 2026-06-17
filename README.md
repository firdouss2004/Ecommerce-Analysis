# E-Commerce Analytics Dashboard

A complete end-to-end data analytics project on an e-commerce dataset — covering SQL analysis, business problem solving, and interactive Power BI dashboards.

---

## Project Overview

This project analyzes an 8-table e-commerce relational database to answer real-world business questions using MySQL, and visualizes the insights through 3 Power BI dashboards covering Sales, Customer Behaviour, and Supply & Logistics.

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

---

## 3 Power BI Dashboards

### Dashboard 1 — Sales & Revenue
Tracks overall business performance including revenue trends, category breakdown, discount analysis, top products, and payment method split.

**Key visuals:** KPI cards · Line chart (monthly trend) · Bar chart (by category) · Donut (payment split) · Top 10 products table

---

### Dashboard 2 — Customer Behaviour
Analyzes customer acquisition, segmentation, geographic distribution, and payment preferences.

**Key visuals:** KPI cards · Map (customers by country) · Line chart (new customers/month) · Donut (segments) · Top customers table

---

### Dashboard 3 — Supply & Logistics
Monitors operational efficiency — shipper performance, delivery times, supplier volumes, and fulfillment speed.

**Key visuals:** KPI cards · Horizontal bar (shipper comparison) · Shipper flag table · Supplier volume table · Monthly shipment trend

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
