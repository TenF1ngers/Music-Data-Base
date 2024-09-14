-- Вывести альбомы, у которых самая популярная песня имеет больше 50 прослушиваний и отсортировать по названию.
SELECT 'more_auditions' AS table_name, a.title
FROM (SELECT s.album_id
      FROM mus.songs s
      GROUP BY album_id
      HAVING MAX(auditions) > 50) AS top,
    mus.albums a
WHERE a.id = top.album_id
ORDER BY a.title;
