-- Вывести данные пользователей со скрытыми полями.
CREATE OR REPLACE VIEW mus.users_data AS
SELECT login, CONCAT(SUBSTR(password_hash, 1, 4), '************************', SUBSTR(password_hash, 29, 32)) AS masked_p_hash,
       CONCAT('*********', SUBSTR(email, LENGTH(email) - 9)) AS masked_email,
       CONCAT(SUBSTR(phone, 1, 2), '******', SUBSTR(phone, LENGTH(phone) - 3)) AS masked_phone
FROM mus.users AS u;

-- Вывести информацию о подписках со скрытыми логинами пользователей.
CREATE OR REPLACE VIEW mus.subs_data AS
SELECT CONCAT(SUBSTR(user_login, 1, 2), '********', SUBSTR(user_login, LENGTH(user_login) - 1)) AS masked_login,
       valid_from, valid_to
FROM mus.users_subs us;

-- Для каждой песни определить, находится она в чартах или нет.
CREATE OR REPLACE VIEW mus.ranking_songs AS
WITH top AS (
SELECT ROW_NUMBER() OVER(ORDER BY c.auditions) AS rank, c.song_id
FROM mus.charts c
)
SELECT top.rank, s.id AS song_id, s.title, s.duration, s.auditions, s.likes
FROM mus.songs AS s
LEFT JOIN top
ON s.id = top.song_id;

-- Для каждого пользователя определить его любимый жанр, исходя из количества жанров в его любимых треках.
CREATE OR REPLACE VIEW mus.favourite_genres AS
WITH g AS(
    SELECT user_login, a.genre, COUNT(*) AS cnt
    FROM mus.favorite_songs fs
    LEFT JOIN mus.songs s ON fs.song_id = s.id
    LEFT JOIN mus.albums a ON s.album_id = a.id
    GROUP BY fs.user_login, a.genre
    ORDER BY user_login
), m AS (
    SELECT user_login, MAX(cnt) AS max
             FROM g
             GROUP BY user_login
)
SELECT g.user_login, g.genre
FROM g, m
WHERE m.user_login = g.user_login AND g.cnt = m.max;

-- Для каждого типа подписки определить количество использований в данный момент.
CREATE OR REPLACE VIEW mus.subs_usage AS
WITH cur AS (
SELECT sub_id, COUNT(*) AS cnt
FROM mus.users_subs us
WHERE us.valid_to >= to_timestamp(to_char(now(), 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')
GROUP BY sub_id
)
SELECT subs.id, subs.title, cur.cnt
FROM mus.subscriptions subs
LEFT JOIN cur ON subs.id = cur.sub_id
ORDER BY subs.id;

-- Имя каждого пользователя вместе со страной проживания с замаскированным логином.
CREATE OR REPLACE VIEW mus.usr_location AS
SELECT CONCAT(SUBSTR(login, 1, 2), '********', SUBSTR(login, LENGTH(login) - 1)) AS masked_login,
       name, country
FROM mus.users;