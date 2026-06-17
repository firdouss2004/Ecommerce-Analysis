/* 
   E-COMMERCE SQL PROBLEM STATEMENTS SOLUTIONS 
   Schema: Customers, Orders, OrderDetails, Products, Category,
           Suppliers, Shippers, Payments
   Database: MySQL
   Author: Taskeen Firdous
*/

create database ecom;
use ecom;


/* Q1. Identify the Numbers of customers connected with the company each year. */

SELECT 
      COUNT(customerId)                 AS no_of_customer, 
      YEAR(DateEntered)                 AS year
FROM customers
GROUP BY year;


/* Q2. Segment the customers into “New” and “Old” categories. 
      Tag the customer as “New” if his database stored date is greater than “1st July 2020” ELSE customer as “Old”.Also,
	  find the count of customers in both the categories. */

SELECT 
      CASE
          WHEN DateEntered > '2020-07-01' THEN 'New'
          ELSE 'Old'
      END AS category,
      COUNT(*)                           AS count_cust
FROM customers
GROUP BY category;


/* Q3. Identify the average order amount 
      by each CustomerID 
	  in each month of Year “2020”. */

SELECT 
      customerId,
      AVG(Total_order_amount)           AS avg_order_amt,
      MONTH(OrderDate) month,
      YEAR(orderdate) year
FROM orders
WHERE YEAR(orderdate) = 2020
GROUP BY customerId , year , month;


/* Q4.Identify the most selling Product in 2021. 
     According to Number of orders. */

SELECT 
      t3.productid,
      t3.product, 
      COUNT(*)                        AS number_of_order
FROM orders t1
JOIN orderdetails t2 
ON t1.orderid = t2.orderid
JOIN products t3 
ON t2.productid = t3.productid
WHERE YEAR(orderdate) = 2021
GROUP BY t3.product , t3.productid
ORDER BY number_of_order DESC
LIMIT 1;


/* Q5.Identify which Supplier Company supplied
     the least number of products */

SELECT 
      t3.supplierid,
      t3.companyname,
      COUNT(*)                     AS Number_of_products
FROM products t1
JOIN orderdetails t2 
ON t1.productid = t2.productid
JOIN suppliers t3 
ON t2.supplierid = t3.supplierid
GROUP BY t3.companyname , t3.supplierid
ORDER BY Number_of_products ASC
LIMIT 1;


/* Q6.The company is tying up with a Bank for providing offers to a certain set of premium customers only.
   We want to know those CustomerIDs 
   who have ordered for a total amount of 
   more than 70000 in the past 3 months */

SELECT 
    CustomerID,
    round(SUM(Total_order_amount))               AS total_spent_last_3_months
FROM Orders 
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY CustomerID
HAVING SUM(Total_order_amount) > 70000
ORDER BY total_spent_last_3_months DESC;



/* Q7. Top-selling and least-selling category in 2021 
       (by number of orders).*/

-- Full ranking
SELECT 
    cat.CategoryName,
    COUNT(od.OrderDetailID)     AS total_orders,
    SUM(od.Quantity)            AS total_units_sold,
    SUM(o.Total_order_amount)   AS total_revenue
FROM Category cat
JOIN Products p     ON cat.CategoryID  = p.Category_ID
JOIN OrderDetails od ON p.ProductID   = od.ProductID
JOIN Orders o        ON od.OrderID    = o.OrderID
WHERE YEAR(o.OrderDate) = 2021
GROUP BY cat.CategoryName
ORDER BY total_orders DESC;


-- Top-selling only
SELECT 
    cat.CategoryName,
    COUNT(od.OrderDetailID) AS total_orders,
    'Top Selling'           AS category_tag
FROM Category cat
JOIN Products p      ON cat.CategoryID = p.Category_ID
JOIN OrderDetails od ON p.ProductID    = od.ProductID
JOIN Orders o        ON od.OrderID     = o.OrderID
WHERE YEAR(o.OrderDate) = 2021
GROUP BY cat.CategoryName
ORDER BY total_orders DESC
LIMIT 1;

-- Least-selling only
SELECT 
    cat.CategoryName,
    COUNT(od.OrderDetailID) AS total_orders,
    'Least Selling'         AS category_tag
FROM Category cat
JOIN Products p      ON cat.CategoryID = p.Category_ID
JOIN OrderDetails od ON p.ProductID    = od.ProductID
JOIN Orders o        ON od.OrderID     = o.OrderID
WHERE YEAR(o.OrderDate) = 2021
GROUP BY cat.CategoryName
ORDER BY total_orders ASC
LIMIT 1;


/*  Q8.Identify the shipper companies whose average delivery time exceeds 3 days, 
so that they can be flagged for delivery performance improvement.*/


   SELECT  s.CompanyName,
           ROUND(AVG(DATEDIFF(o.DeliveryDate, o.ShipDate)), 1) AS Avg_Delivery_Days
   FROM    shippers s
   JOIN    orders   o ON s.ShipperID = o.ShipperID
   GROUP BY s.ShipperID, s.CompanyName
   HAVING  AVG(DATEDIFF(o.DeliveryDate, o.ShipDate)) > 3
   ORDER BY Avg_Delivery_Days DESC;


/* Q9.Find out the Average delivery time for each category by each shipper.*/

   SELECT  c.CategoryName,
           s.ShipperID,
           s.CompanyName,
           ROUND(AVG(DATEDIFF(o.DeliveryDate, o.ShipDate)), 1) AS Avg_Delivery_Time
   FROM    category     c
   JOIN    products     p  ON c.CategoryID = p.Category_id
   JOIN    orderdetails od ON od.ProductID = p.ProductID
   JOIN    orders       o  ON o.OrderID    = od.OrderID
   JOIN    shippers     s  ON o.ShipperID  = s.ShipperID
   GROUP BY c.CategoryName, s.ShipperID, s.CompanyName
   ORDER BY s.ShipperID, c.CategoryName;
   
   
   /* Q10.	We need to see the most used Payment method by customers such that
   we can tie-up with those Banks in order to attract more customers to our website*/

    SELECT  py.PaymentType,
           COUNT(*) AS Usage_Count
   FROM    orders   o
   JOIN    payments py ON o.PaymentID = py.PaymentID
   GROUP BY py.PaymentType
   ORDER BY Usage_Count DESC
   LIMIT 1;


/* Q11.	Write a query to show the number of customers, number of orders placed, 
   and total order amount per month in the year 2021. Assume that we are only interested
   in the monthly reports for a single year (January-December).*/


   SELECT  MONTHNAME(OrderDate)                     AS Month,
           COUNT(*)                                 AS No_Of_Orders,
           COUNT(DISTINCT CustomerID)               AS No_Of_Customers,
           ROUND(SUM(Total_order_amount), 2)        AS Total_Order_Amount
   FROM    orders
   WHERE   YEAR(OrderDate) = 2021
   GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
   ORDER BY MONTH(OrderDate);
   
   
   /* Q12.Derive a monthly cumulative sum of total order amounts for the year 2021,showcase month-wise aggregation and cumulative
		  totals for analytical purposes.*/

   SELECT  Monthwise,
           ROUND(SUM(Monthly_Total) OVER (ORDER BY Month_Num), 2) AS Cumulative_Total
   FROM (
       SELECT  MONTH(OrderDate)       AS Month_Num,
               MONTHNAME(OrderDate)   AS Monthwise,
               SUM(Total_order_amount) AS Monthly_Total
       FROM    orders
       WHERE   YEAR(OrderDate) = 2021
       GROUP BY MONTH(OrderDate), MONTHNAME(OrderDate)
   ) t
   ORDER BY Month_Num;


/* 13. Find Category with highest revenue.*/

   SELECT  p.Category_ID,
           c.CategoryName,
           ROUND(SUM(o.Total_order_amount), 2) AS Total_Revenue
   FROM    orders       o
   JOIN    orderdetails od ON o.OrderID    = od.OrderID
   JOIN    products     p  ON od.ProductID = p.ProductID
   JOIN    category     c  ON p.Category_ID = c.CategoryID
   GROUP BY p.Category_ID, c.CategoryName
   ORDER BY Total_Revenue DESC
   LIMIT 1;

										
