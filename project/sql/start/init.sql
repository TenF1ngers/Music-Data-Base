CREATE SCHEMA IF NOT EXISTS mus;

CREATE TABLE IF NOT EXISTS mus.users (
    login VARCHAR(128) NOT NULL PRIMARY KEY,
    password_hash VARCHAR(256) NOT NULL,
    email VARCHAR(128) NOT NULL,
    name VARCHAR(128) NOT NULL,
    phone VARCHAR(128) NOT NULL,
    country VARCHAR(128) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS mus.albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    genre VARCHAR(128) NOT NULL,
    release_year INTEGER NOT NULL,
    likes INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS mus.songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    album_id INTEGER NOT NULL,
    duration INTEGER NOT NULL,
    auditions INTEGER DEFAULT 0,
    likes INTEGER DEFAULT 0,
        FOREIGN KEY (album_id) REFERENCES mus.albums(id)
);

CREATE TABLE IF NOT EXISTS mus.performers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    followers INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS mus.subscriptions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(128) NOT NULL,
    description VARCHAR(2048) NOT NULL,
    period VARCHAR(128) NOT NULL,
    price VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS mus.favorite_songs (
    user_login VARCHAR(128) NOT NULL,
    song_id INTEGER NOT NULL,
    add_date TIMESTAMP NOT NULL,
        FOREIGN KEY (user_login) REFERENCES mus.users(login),
        FOREIGN KEY (song_id) REFERENCES mus.songs(id)
);

CREATE TABLE IF NOT EXISTS mus.added_albums (
    user_login VARCHAR(128) NOT NULL,
    album_id INTEGER NOT NULL,
        FOREIGN KEY (user_login) REFERENCES mus.users(login),
        FOREIGN KEY (album_id) REFERENCES mus.albums(id)
);

CREATE TABLE IF NOT EXISTS mus.charts (
    song_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    auditions INTEGER DEFAULT 0 NOT NULL,
        FOREIGN KEY (song_id) REFERENCES mus.songs(id),
        FOREIGN KEY (album_id) REFERENCES mus.albums(id)
);

CREATE TABLE IF NOT EXISTS mus.users_subs (
    user_login VARCHAR(128) NOT NULL,
    sub_id INTEGER NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP DEFAULT NULL,
        FOREIGN KEY (user_login) REFERENCES mus.users(login),
        FOREIGN KEY (sub_id) REFERENCES mus.subscriptions(id)
);

CREATE TABLE IF NOT EXISTS mus.performers_albums (
    performer_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
        FOREIGN KEY (performer_id) REFERENCES mus.performers(id),
        FOREIGN KEY (album_id) REFERENCES mus.albums(id)
);