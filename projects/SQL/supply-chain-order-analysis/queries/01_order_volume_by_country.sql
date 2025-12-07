SELECT BillingCountry,
       COUNT(*) AS TotalOrders
FROM invoices
GROUP BY BillingCountry
ORDER BY TotalOrders DESC;
