SELECT g.Name AS Genre,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY g.Name
ORDER BY Revenue DESC;
