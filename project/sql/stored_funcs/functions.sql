-- Процедура, позволяющая увеличивать количество прослушиваний определенного трека
-- (срабатывает, когда пользователь запустил трек)
CREATE OR REPLACE PROCEDURE mus.update_auditions(s_id NUMERIC, num NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE mus.songs
    SET auditions = CASE
        WHEN auditions IS NULL THEN num
        ELSE auditions + num
    END
    WHERE id = s_id;
END;
$$;

-- Пользователь добавляет трек в любимую музыку
CREATE OR REPLACE PROCEDURE mus.insert_favourite_song(usr_log text, s_id NUMERIC, dt TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO mus.favorite_songs (user_login, song_id, add_date)  VALUES
    (usr_log, s_id, dt);
END;
$$;



