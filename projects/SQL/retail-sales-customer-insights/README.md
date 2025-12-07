# Retail Sales Customer Insights (SQL Project)

This project analyzes customer behavior, revenue patterns, and employee performance using SQL queries written for the Chinook database. The goal is to demonstrate practical SQL skills including joins, grouping, aggregation, filtering, and multi-table relational analysis.

## Project Structure

```
retail-sales-customer-insights/
├── README.md
└── queries/
    ├── 01_top_customers.sql
    ├── 02_revenue_by_genre.sql
    ├── 03_top_artists.sql
    ├── 04_employee_performance.sql
    └── 05_country_revenue.sql
```

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

## 2. Revenue by Music Genre
File: queries/02_revenue_by_genre.sql

```
SELECT g.Name AS Genre,
       SUM(ii.UnitPrice * ii.Quantity) AS Revenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
GROUP BY g.Name
ORDER BY Revenue DESC;
```

## 3. Top Revenue-Generating Artists
File: queries/03_top_artists.sql

```
SELECT ar.Name AS Artist,
       SUM(ii.UnitPrice * ii.Quantity) AS Revenue
FROM artists ar
JOIN albums a ON ar.ArtistId = a.ArtistId
JOIN tracks t ON a.AlbumId = t.AlbumId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC
LIMIT 10;
```

## 4. Employee Sales Performance
File: queries/04_employee_performance.sql

```
SELECT e.FirstName,
       e.LastName,
       COUNT(i.InvoiceId) AS InvoicesHandled,
       SUM(i.Total) AS RevenueGenerated
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueGenerated DESC;
```

## 5. Revenue by Country
File: queries/05_country_revenue.sql

```
SELECT BillingCountry,
       COUNT(*) AS NumInvoices,
       SUM(Total) AS Revenue
FROM invoices
GROUP BY BillingCountry
ORDER BY Revenue DESC;
```

## Skills Demonstrated

- SQL joins and multi-table relational querying
- Aggregation and grouping (SUM, COUNT)
- Filtering and sorting
- Writing modular SQL scripts
- Analyzing customer and business insights
- Organizing SQL work into a clean query folder
