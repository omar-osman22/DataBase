WITH t1 AS
  (SELECT Al.Title Album,
          Al.AlbumId AlbumID,
          COUNT(*) Tracks_no,
          SUM(T.UnitPrice)
   FROM Track T
   JOIN Album Al ON Al.AlbumId = T.AlbumId
   GROUP BY 1
   ORDER BY 4 DESC),
     t2 AS
  (SELECT t1.AlbumId AlbumId,
          t1.Tracks_no Tracks_no,
          SUM(Inv.UnitPrice * Inv.Quantity) Total_sales
   FROM InvoiceLine Inv
   JOIN Track T ON Inv.TrackId = T.TrackId
   JOIN t1 ON T.AlbumId = t1.AlbumID
   GROUP BY 1
   ORDER BY 3 DESC),
     t3 AS
  (SELECT AVG(t2.Tracks_no) Average
   FROM t2)
SELECT t2.AlbumId,
       t2.Tracks_no,
       t2.Total_sales,
       CASE
           WHEN t2.Total_sales >=
                  (SELECT Average
                   FROM t3) THEN 'More than Average'
           ELSE 'Less than Average'
       END AS Heavy
FROM t2
ORDER BY 3 DESC
