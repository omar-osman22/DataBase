WITH t1 AS
(SELECT  I.BillingCountry Country,
		 Inv.TrackId TrackId
FROM Invoice I
JOIN InvoiceLine Inv
ON I.InvoiceId = Inv.InvoiceId )
SELECT  A.Name Artist,
		t1.Country Country,
		Count(t1.TrackId) Track_sales
FROM Artist A
JOIN Album Al
ON A.ArtistId = Al.ArtistId 
JOIN Track T
ON Al.AlbumId = T.AlbumId
JOIN t1 
ON T.TrackId = t1.TrackId
GROUP BY 2
ORDER BY 3 DESC
		