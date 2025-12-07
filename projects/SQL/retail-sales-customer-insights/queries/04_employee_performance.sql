SELECT e.FirstName,
       e.LastName,
       COUNT(i.InvoiceId) AS InvoicesHandled,
       SUM(i.Total) AS RevenueGenerated
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY RevenueGenerated DESC;
