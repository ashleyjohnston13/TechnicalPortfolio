# Retail Sales and Customer Insights (SQL Analysis)

This project uses the Chinook SQLite database to analyze customer purchasing behavior, revenue trends, and sales performance. The goal is to demonstrate SQL proficiency through business-focused insights across marketing, customer segmentation, and revenue reporting.

This project is part of my analytics portfolio and reflects how I structure data problems, explore database schemas, and write clean SQL queries for real-world analysis.

---

## Database

This analysis uses the publicly available Chinook database, which represents a digital music store. Key tables used include:

- Customers
- Invoices
- InvoiceItems
- Tracks
- Albums
- Artists
- Genres
- Employees

---

## Key Questions Answered

1. Who are the highest-value customers?
2. Which music genres generate the most revenue?
3. Which artists drive the most sales?
4. Which employees support the most revenue through customer accounts?
5. Which countries contribute the highest total revenue?

---

## Folder Structure

retail-sales-customer-insights/
│── chinook.db
│── README.md
│── queries/
│     ├── 01_top_customers.sql
│     ├── 02_revenue_by_genre.sql
│     ├── 03_top_artists.sql
│     ├── 04_employee_performance.sql
│     ├── 05_country_revenue.sql

---

## SQL Queries Included

### 1. Top Revenue Customers  
File: queries/01_top_customers.sql

SELECT c.CustomerId, c.FirstName, c.LastName,
       SUM(i.Total) AS TotalSpent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 10;

---

### 2. Revenue by Music Genre  
File: queries/02_revenue_by_genre.sql

SELECT g.Name AS Genre,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY Revenue DESC;

---

### 3. Top Revenue-Generating Artists  
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

### 4. Employee Sales Performance  
File: queries/04_employee_performance.sql

SELECT e.FirstName, e.LastName,
       COUNT(i.InvoiceId) AS InvoicesHandled,
       SUM(i.Total) AS RevenueGenerated
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueGenerated DESC;

---

### 5. Revenue by Country  
File: queries/05_country_revenue.sql

SELECT BillingCountry,
       COUNT(*) AS NumInvoices,
       SUM(Total) AS Revenue
FROM invoices
GROUP BY BillingCountry
ORDER BY Revenue DESC;

---

## How to Run These Queries in Visual Studio Code

1. Install the "SQLite Viewer" extension in VS Code.
2. Open the chinook.db file using the extension.
3. Navigate to the queries folder and open any .sql file.
4. Highlight the query and run it using the SQLite extension’s interface.
5. View or export results as needed.

---

## Skills Demonstrated

- SQL joins and aggregations
- Customer segmentation
- Revenue reporting
- Organized, modular SQL project structure
- Translating data into business insights

This project demonstrates my ability to use SQL to extract, analyze, and interpret transactional data in a business context.
