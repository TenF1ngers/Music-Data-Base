-- Создаем индекс для быстрого поиска по жанрам
CREATE INDEX albums_genre_idx
ON mus.albums (genre);

-- Создаем индекс для быстрого поиска по году выпуска альбома
CREATE INDEX albums_release_year_idx
ON mus.albums (release_year);

-- Создаем индекс для быстрого поиска пользователя по стране
CREATE INDEX users_country_idx
ON mus.users (country);
