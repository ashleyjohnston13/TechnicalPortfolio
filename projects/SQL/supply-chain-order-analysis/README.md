# Supply Chain Order Analysis (SQL Project)

This project analyzes operational and customer order patterns using SQL queries written for the Chinook database. The goal is to demonstrate practical SQL skills related to order volume analysis, processing time, customer behavior, and support operations.

## Project Structure

```
supply-chain-order-analysis/
├── README.md
└── queries/
    ├── 01_order_volume_by_country.sql
    ├── 02_average_processing_time.sql
    ├── 03_high_value_orders.sql
    ├── 04_repeat_customers.sql
    └── 05_order_frequency_by_employee.sql
```

---

## 1. Order Volume by Country
**File:** [queries/01_order_volume_by_country.sql](queries/01_order_volume_by_country.sql)

```
SELECT BillingCountry,
       COUNT(*) AS TotalOrders
FROM invoices
GROUP BY BillingCountry
ORDER BY TotalOrders DESC;
```

---

## 2. Average Processing Time by Customer
**File:** [queries/02_average_processing_time.sql](queries/02_average_processing_time.sql)

```
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       ROUND(AVG(JULIANDAY(i.InvoiceDate) 
               - LAG(JULIANDAY(i.InvoiceDate)) 
                 OVER (PARTITION BY c.CustomerId ORDER BY i.InvoiceDate)), 2) 
           AS AvgDaysBetweenOrders
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY AvgDaysBetweenOrders;
```

---

## 3. High Value Orders
**File:** [queries/03_high_value_orders.sql](queries/03_high_value_orders.sql)

```
SELECT i.InvoiceId,
       c.FirstName,
       c.LastName,
       i.Total AS OrderValue
FROM invoices i
JOIN customers c ON i.CustomerId = c.CustomerId
WHERE i.Total > 20
ORDER BY OrderValue DESC;
```

---

## 4. Repeat Customer Identification
**File:** [queries/04_repeat_customers.sql](queries/04_repeat_customers.sql)

```
SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       COUNT(i.InvoiceId) AS NumOrders
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING NumOrders > 1
ORDER BY NumOrders DESC;
```

---

## 5. Order Frequency by Support Employee
**File:** [queries/05_order_frequency_by_employee.sql](queries/05_order_frequency_by_employee.sql)

```
SELECT e.EmployeeId,
       e.FirstName,
       e.LastName,
       COUNT(i.InvoiceId) AS OrdersSupported
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY OrdersSupported DESC;
```

---

## Skills Demonstrated

- SQL joins and multi-table relational querying
- Window functions
- Aggregation and grouping for operational reporting
- Customer behavior segmentation
- Employee productivity analysis
- Clean folder organization and structured query design

This project highlights real-world order analytics similar to what supply chain, logistics, and operations teams rely on to identify trends, reduce bottlenecks, and monitor performance.
