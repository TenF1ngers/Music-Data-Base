WITH play AS (
    SELECT song_id, COUNT(*) AS count
    FROM mus.favorite_songs AS fs
    GROUP BY song_id
)
UPDATE mus.songs
SET likes = play.count
FROM play
WHERE mus.songs.id = play.song_id;

WITH play AS (
    SELECT album_id, COUNT(*) AS count
    FROM mus.added_albums AS fs
    GROUP BY album_id
)
UPDATE mus.albums
SET likes = play.count
FROM play
WHERE mus.albums.id = play.album_id;

UPDATE mus.songs
SET auditions =
    CASE
        WHEN id = 1 THEN 5
        WHEN id = 2 THEN 28
        WHEN id = 3 THEN 48
        WHEN id = 4 THEN 65
        WHEN id = 5 THEN 63
        WHEN id = 6 THEN 18
        WHEN id = 7 THEN 23
        WHEN id = 8 THEN 7
        WHEN id = 9 THEN 61
        WHEN id = 10 THEN 39
        WHEN id = 11 THEN 5
        WHEN id = 12 THEN 32
        WHEN id = 13 THEN 37
        WHEN id = 14 THEN 70
        WHEN id = 15 THEN 50
        WHEN id = 16 THEN 20
        WHEN id = 20 THEN 54
        WHEN id = 18 THEN 16
        WHEN id = 19 THEN 1
    END;

UPDATE mus.performers
SET followers =
    CASE
        WHEN id = 1 THEN 2
        WHEN id = 2 THEN 5
        WHEN id = 3 THEN 4
        WHEN id = 4 THEN 1
        WHEN id = 5 THEN 9
        WHEN id = 6 THEN 10
        WHEN id = 7 THEN 8
        WHEN id = 8 THEN 8
        WHEN id = 9 THEN 5
        WHEN id = 10 THEN 4
        WHEN id = 11 THEN 7
        WHEN id = 12 THEN 6
    END;

DELETE FROM mus.favorite_songs
WHERE user_login = 'blessing_things' AND song_id = 15;

UPDATE mus.songs
SET likes = likes - 1
WHERE id = 15;

INSERT INTO mus.charts (song_id, album_id, auditions)
SELECT id, album_id, auditions
FROM mus.songs
WHERE auditions IS NOT NULL
ORDER BY auditions DESC
LIMIT 10;
