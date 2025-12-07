SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       COUNT(i.InvoiceId) AS NumOrders
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING NumOrders > 1
ORDER BY NumOrders DESC;
