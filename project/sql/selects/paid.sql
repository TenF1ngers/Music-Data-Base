-- Вывести всех пользователей, у которых на данный момент есть платная подписка.
SELECT 'paid' AS table_name, user_login
FROM mus.users_subs us
WHERE valid_to >= to_timestamp(to_char(now(), 'YYYY-MM-DD HH24:MI:SS'), 'YYYY-MM-DD HH24:MI:SS')
