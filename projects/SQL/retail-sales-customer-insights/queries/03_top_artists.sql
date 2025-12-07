SELECT ar.Name AS Artist,
       SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM artists ar
JOIN albums a ON ar.ArtistId = a.ArtistId
JOIN tracks t ON a.AlbumId = t.AlbumId
JOIN invoice_items il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC
LIMIT 10;
