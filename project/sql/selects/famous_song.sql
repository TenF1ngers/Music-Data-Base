-- Для каждого альбома вывести самую популярную песню и количество прослушиваний и лайков.
WITH top AS (
SELECT album_id, MAX(auditions) as max_aud
FROM mus.songs s
GROUP BY album_id
)
SELECT 'famous_song' AS table_name, s.album_id, s.title, s.auditions, s.likes
FROM mus.songs s, top
WHERE s.album_id = top.album_id AND s.auditions = top.max_aud;
