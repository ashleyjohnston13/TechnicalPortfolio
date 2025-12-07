SELECT e.EmployeeId,
       e.FirstName,
       e.LastName,
       COUNT(i.InvoiceId) AS OrdersSupported
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY OrdersSupported DESC;
