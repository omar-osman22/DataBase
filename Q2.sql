WITH t1 AS
  (SELECT *
   FROM PlaylistTrack
   JOIN Playlist ON Playlist.PlaylistId = PlaylistTrack.PlaylistId),
     t2 AS
  (SELECT t1.Name Playlist,
          t1.TrackId,
          G.Name Genre
   FROM Genre G
   JOIN Track T ON G.GenreId = T.GenreId
   JOIN t1 ON t1.TrackId = T.TrackId)
SELECT t2.Playlist,
       t2.Genre Genre,
       Count(t2.Genre) COUNT
FROM t2
GROUP BY 1
ORDER BY 3 DESC