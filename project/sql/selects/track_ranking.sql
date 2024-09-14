-- Проранжировать альбомы по общему количеству прослушиваний треков.
SELECT 'track_ranking' AS table_name, ROW_NUMBER() OVER (ORDER BY com.sum_aud DESC) AS rank, a.title, com.sum_aud
FROM (SELECT album_id, SUM(auditions) AS sum_aud
      FROM mus.songs s
      GROUP BY album_id) AS com, mus.albums a
WHERE com.album_id = a.id AND com.sum_aud IS NOT NULL;
