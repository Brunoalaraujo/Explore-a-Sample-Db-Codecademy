SELECT invoice_items.TrackId, 
	tracks.Name,
	albums.Title Album, 
	genres.Name Genre, 
	SUM(invoice_items.UnitPrice * invoice_items.Quantity) Total
FROM invoice_items
INNER JOIN tracks 
	ON invoice_items.TrackId = tracks.TrackId
INNER JOIN albums 
	ON tracks.AlbumId = albums.AlbumId
JOIN genres 
	ON tracks.GenreId = genres.GenreId
GROUP BY invoice_items.TrackId
ORDER BY SUM(invoice_items.UnitPrice * invoice_items.Quantity) DESC