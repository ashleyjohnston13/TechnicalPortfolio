SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       ROUND(
           AVG(
               JULIANDAY(i.InvoiceDate)
               - LAG(JULIANDAY(i.InvoiceDate))
                 OVER (PARTITION BY c.CustomerId ORDER BY i.InvoiceDate)
           ),
           2
       ) AS AvgDaysBetweenOrders
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY AvgDaysBetweenOrders;
