-- Для каждого пользователя вывести песни, которые он добавлял, их дату и предыдущую добавленную песню.
SELECT 'add_track_bro' AS table_name, DENSE_RANK() OVER (ORDER BY fs.user_login), fs.user_login, s.title, fs.add_date,
       LAG(s.title, 1, NULL) OVER (PARTITION BY user_login ORDER BY fs.add_date) AS prev_song
FROM mus.favorite_songs fs, mus.songs s
WHERE fs.song_id = s.id;
