WITH t1 AS
  (SELECT Artist.Name Artist,
          Genre.Name Genre
   FROM Artist
   JOIN Album ON Album.ArtistId = Artist.ArtistId
   JOIN Track ON Album.AlbumId = Track.AlbumId
   JOIN Genre ON Track.GenreId = Genre.GenreId
   GROUP BY 1,
            2)
SELECT t1.Artist,
       count(t1.Artist) Genres_count
FROM t1
GROUP BY 1
ORDER BY 2 DESC