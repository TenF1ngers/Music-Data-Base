-- Создаём триггер на обновление чартов при каждом обновлении поля auditions в mus.songs
CREATE OR REPLACE FUNCTION mus.update_target_table()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM mus.charts;

    INSERT INTO mus.charts (song_id, album_id, auditions)
    SELECT id, album_id, auditions
    FROM mus.songs
    WHERE auditions IS NOT NULL
    ORDER BY auditions DESC
    LIMIT 10;

    RETURN NULL;
END;
$$;

CREATE TRIGGER source_table_update_trigger
    AFTER UPDATE OF auditions ON mus.songs
    FOR EACH ROW
    EXECUTE FUNCTION mus.update_target_table();

-- Создаём триггер на добавление любимого трека пользователем. Происходит обновление
-- количества лайков у трека
CREATE OR REPLACE FUNCTION mus.update_songs_likes()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
BEGIN
    WITH sum AS (
        SELECT song_id, COUNT(*) AS likes
        FROM mus.favorite_songs fs
        GROUP BY song_id
    )
    UPDATE mus.songs s
    SET likes = sum.likes
    FROM sum
    WHERE s.id = sum.song_id;

    RETURN NULL;
END;
$$;

CREATE TRIGGER favourite_songs_insert_trigger
    AFTER INSERT ON mus.favorite_songs
    FOR EACH ROW
    EXECUTE FUNCTION mus.update_songs_likes();
