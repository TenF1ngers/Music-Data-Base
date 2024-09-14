-- Проранжировать исполнителей по количеству подписчиков.
SELECT 'perform_conquest' AS table_name, DENSE_RANK() OVER (ORDER BY followers DESC) AS rank, name
FROM mus.performers