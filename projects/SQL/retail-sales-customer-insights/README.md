# Retail Sales Customer Insights (SQL Project)

This project analyzes customer behavior, revenue patterns, and sales performance using SQL queries built on the Chinook database. The goal is to demonstrate advanced SQL skills including joins, grouping, aggregation, and business-focused analytical queries.

The Chinook dataset models a digital music store, containing customers, invoices, tracks, employees, and more. This project extracts insights related to customer value, product performance, and sales operations.

---

## Project Structure

retail-sales-customer-insights/
│
├── README.md
└── queries/
    ├── 01_top_customers.sql
    ├── 02_revenue_by_genre.sql
    ├── 03_top_artists.sql
    ├── 04_employee_performance.sql
    └── 05_country_revenue.sql

---

## 1. Top Revenue Customers
File: queries/01_top_customers.sql

SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       SUM(i.Total) AS TotalSpent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 10;

---

## 2. Revenue by Music Genre
File: queries/02_revenue_by_genre.sql

SELECT g.Name AS Genre,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY Revenue DESC;

---

## 3. Top Revenue-Generating Artists
File: queries/03_top_artists.sql

SELECT ar.Name AS Artist,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM artists ar
JOIN albums a ON ar.ArtistId = a.ArtistId
JOIN tracks t ON a.AlbumId = t.AlbumId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC
LIMIT 10;

---

## 4. Employee Sales Performance
File: queries/04_employee_performance.sql

SELECT e.FirstName,
       e.LastName,
       COUNT(i.InvoiceId) AS InvoicesHandled,
       SUM(i.Total) AS RevenueGenerated
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueGenerated DESC;

---

## 5. Revenue by Country
File: queries/05_country_revenue.sql

SELECT BillingCountry,
       COUNT(*) AS NumInvoices,
       SUM(Total) AS Revenue
FROM invoices
GROUP BY BillingCountry
ORDER BY Revenue DESC;

---

## Skills Demonstrated

- SQL joins and multi-table relational querying
- Grouping and aggregation functions
- Revenue modeling and business metric creation
- Customer value segmentation
- Employee performance analytics
- Organized SQL project file structure

---

## Summary

This project highlights analytical SQL queries designed to extract meaningful business insights from a relational dataset. It demonstrates strength in writing clean, interpretable SQL for decision-making and analytics workflows.
