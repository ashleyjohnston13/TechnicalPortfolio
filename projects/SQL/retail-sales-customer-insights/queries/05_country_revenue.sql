SELECT BillingCountry,
       COUNT(*) AS NumInvoices,
       SUM(Total) AS Revenue
FROM invoices
GROUP BY BillingCountry
ORDER BY Revenue DESC;
