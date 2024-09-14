INSERT INTO mus.users (login, password_hash, email, name, phone, country) VALUES
('ivangorbunov07', 'bbbc796a29bd8ab9544caa7585ee8c20', 'beautyofsilence2013@mail.ru', 'Ivan', '+79855292579', 'Russia'),
('genri_tompson', '7d8a97687345aaa1556c143e6d3fe082', 'genrito@gmail.com', 'Genri', '+19834754323', 'United States'),
('mixer', '10b5e1e383fff2f51f8a7c9fd67f2e03', 'michaelpac@yandex.ru', 'Michael', '+79634550033', 'Russia'),
('enthusiast', '0967c9cd5be5ca8f0d43a4596773ed80', 'georgiy@rambler.ru', 'Georgiy', '+79153651464', 'Russia'),
('extremum', '07adc3a941ff66fe9eb6edf4a3f0f03b', 'pashabit@icloud.com', 'Pavel', '+79266466535', 'Russia'),
('savage_seven', '4728f286329b5ab9619ad24985d407f7', 'nostradamus@icloud.com', 'Andrew', '+79857631328', 'Russia'),
('elegant', 'f811bc496c0f777cc56764e64a44a36b', 'romanv@icloud.com', 'Roman', '+79611348745', 'Russia'),
('designer', '230ace927da4bb74817fa22adc663e0a', 'stasevol@mail.ru', 'Stanislav', '+79166456892', 'Russia'),
('blessing_things', '54cc9162cb774b26d73139f2ea06ec33', 'yusupoff@gmail.com', 'Yusup', '+79183645838', 'Russia'),
('getting_dark', '920b65cfd6ffbce2997dab02d328706a', 'ingvar@yandex.ru', 'Igor', '+79853485736', 'Russia');

INSERT INTO mus.albums (title, genre, release_year, likes) VALUES
('NO NAME', 'Hip hop', 2018, 0),                 /*1*/
('Fallen', 'New-metal', 2003, 0),                /*2*/
('Trapped in a nightmare', 'Hip hop', 2019, 0),  /*3*/
('Numb', 'New-metal', 2003, 0),                  /*4*/
('bad guy', 'Pop music', 2019, 0),               /*5*/
('Красота и уродство', 'Hip hop', 2021, 0),      /*6*/
('Mixed Feelings', 'Hip hop', 2017, 0),          /*7*/
('LGND', 'Hip hop', 2021, 0),                    /*8*/
('Долгий Путь Домой', 'Hip hop', 2013, 0),       /*9*/
('Under Pressure', 'Hip hop', 2014, 0),          /*10*/
('Blood is Rebel', 'Pop music', 2019, 0),        /*11*/
('Duality', 'Hip hoop', 2019, 0);                /*12*/

INSERT INTO mus.songs (title, album_id, duration, auditions, likes) VALUES
('NO NAME', 1, 179, 0, 0),                 /*1*/
('Bring Me To Life', 2, 237, 0, 0),        /*2*/
('Trapped in a nightmare', 3, 199, 0, 0),  /*3*/
('Numb', 4, 187, 0, 0),                    /*4*/
('bad guy', 5, 194, 0, 0),                 /*5*/
('Хоп-механика', 6, 138, 0, 0),            /*6*/
('Агент', 6, 214, 0, 0),                   /*7*/
('Красота и уродство', 6, 159, 0, 0),      /*8*/
('Нон-фикшн', 6, 215, 0, 0),               /*9*/
('Мы все умрём', 6, 166, 0, 0),            /*10*/
('Окно в париж', 6, 193, 0, 0),            /*11*/
('Партизанское радио', 6, 165, 0, 0),      /*12*/
('Лифт', 6, 274, 0, 0),                    /*13*/
('Эминем', 6, 168, 0, 0),                  /*14*/
('Африканские бусы', 6, 146, 0, 0),        /*15*/
('Lights Go Down', 7, 185, 0, 0),          /*16*/
('Winning Smile', 8, 191, 0, 0),           /*17*/
('Пролив Дрейка', 9, 186, 0, 0),           /*18*/
('Alright', 10, 218, 0, 0),                 /*19*/
('Another Level', 11, 190, 0, 0),          /*20*/
('Find Me', 12, 203, 0, 0);                /*21*/

INSERT INTO mus.performers (name, followers) VALUES
('NF', 0),              /*1*/
('Evanescence', 0),     /*2*/
('NEFFEX', 0),          /*3*/
('Linkin Park', 0),     /*4*/
('Billi Eilish', 0),    /*5*/
('Oxxxymiron', 0),      /*6*/
('Bazanji', 0),         /*7*/
('Joznez', 0),          /*8*/
('Kataem', 0),          /*9*/
('Logic', 0),           /*10*/
('Oh the Larceny', 0),  /*11*/
('The Seige', 0);       /*12*/

INSERT INTO mus.performers_albums (performer_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);

INSERT INTO mus.subscriptions (title, description, period, price) VALUES
('Free plan', 'Access to the entire assortment of music,' ||
              'Travel abroad with your music for up to 14 days,' ||
              'Pick and play any track on mobile (Available on select playlists),' ||
              'There is no way to listen to music in any order,' ||
              'Music with ads,' ||
              'The highest quality of music is not available', 'No limit', '$0.00'),    /*1*/
('Premium', 'Access to the entire assortment of music,' ||
            'Travel abroad with your music,' ||
            'Pick and play any track on mobile everywhere,' ||
            'Play offline,' ||
            'On-demand playback,' ||
            'Play songs in any order,' ||
            'Download music,' ||
            'Highest music quality,' ||
            'Ad-free music listening', '1 month', '$9.99'),       /*2*/
('Premium', 'Access to the entire assortment of music,' ||
            'Travel abroad with your music,' ||
            'Pick and play any track on mobile everywhere,' ||
            'Play offline,' ||
            'On-demand playback,' ||
            'Play songs in any order,' ||
            'Download music,' ||
            'Highest music quality,' ||
            'Ad-free music listening', '1 year', '$79.99'),       /*3*/
('Student plan', 'Access to the entire assortment of music,' ||
            'Travel abroad with your music,' ||
            'Pick and play any track on mobile everywhere,' ||
            'Play offline,' ||
            'On-demand playback,' ||
            'SHOWTIME' ||
            'Play songs in any order,' ||
            'Download music,' ||
            'Highest music quality,' ||
            'Ad-free music listening', '1 month', '$4.99'),  /*4*/
('Duo', '2 Premium accounts for a couple under one roof,' ||
        'Ad-free music listening, play offline, on-demand playback', '1 month', '$12.99'),          /*5*/
('Family', '6 Premium accounts for family members living under one roof,' ||
           'Block explicit music,' ||
           'Ad-free music listening, play offline, on-demand playback', '1 month', '$15.99');       /*6*/

INSERT INTO mus.users_subs (user_login, sub_id, valid_from, valid_to) VALUES
('ivangorbunov07', 3, '2022-09-10 13:15:17', '2023-09-10 13:15:17'),
('genri_tompson', 5, '2023-01-10 15:45:35', '2023-02-10 15:45:35'),
('extremum', 5, '2023-01-10 15:45:35', '2023-02-10 15:45:35'),
('mixer', 4, '2022-10-16 18:29:59', '2022-11-16 18:29:59'),
('enthusiast', 1, '2023-02-08 20:12:13', NULL),
('savage_seven', 4, '2022-08-02 10:45:03', '2022-09-02 10:45:03'),
('elegant', 1, '2022-05-23 12:13:10', NULL),
('designer', 3, '2023-01-01 00:02:01', '2024-01-01 00:02:01'),
('blessing_things', 2, '2022-06-17 17:21:35', '2022-07-18 17:21:35'),
('getting_dark', 2, '2022-06-23 16:39:12', '2022-07-24 16:39:12'),
('blessing_things', 5, '2022-07-25 10:20:15', '2022-08-25 10:20:15'),
('getting_dark', 5, '2022-07-25 10:20:15', '2022-08-25 10:20:15'),
('blessing_things', 5, '2022-08-25 10:20:15', '2022-09-25 10:20:15'),
('getting_dark', 5, '2022-08-25 10:20:15', '2022-09-25 10:20:15'),
('blessing_things', 5, '2022-09-25 10:20:15', '2022-10-26 10:20:15'),
('getting_dark', 5, '2022-09-25 10:20:15', '2022-10-26 10:20:15');

INSERT INTO mus.favorite_songs (user_login, song_id, add_date) VALUES
('ivangorbunov07', 1, '2022-09-10 13:20:21'),
('ivangorbunov07', 2, '2022-10-10 14:25:25'),
('ivangorbunov07', 6, '2022-11-16 16:20:21'),
('ivangorbunov07', 7, '2022-12-09 11:23:11'),
('ivangorbunov07', 10, '2023-04-11 15:25:22'),
('ivangorbunov07', 20, '2023-05-07 13:20:21'),
('ivangorbunov07', 15, '2023-06-23 18:20:34'),
('ivangorbunov07', 18, '2023-06-24 10:30:21'),
('ivangorbunov07', 11, '2023-07-07 14:59:20'),
('ivangorbunov07', 3, '2023-07-10 19:35:29'),
('ivangorbunov07', 8, '2023-08-24 20:19:11'),
('ivangorbunov07', 5, '2023-09-09 15:10:22'),

('genri_tompson', 12, '2023-01-10 15:46:35'),
('genri_tompson', 11, '2023-01-11 17:22:45'),
('genri_tompson', 15, '2023-01-14 14:20:21'),
('genri_tompson', 14, '2023-01-15 23:20:25'),
('genri_tompson', 1, '2023-01-25 03:35:27'),
('genri_tompson', 9, '2023-01-26 13:20:21'),
('genri_tompson', 16, '2023-01-27 13:20:21'),
('genri_tompson', 5, '2023-02-01 13:13:19'),

('extremum', 14, '2023-01-12 15:55:35'),
('extremum', 6, '2023-01-13 13:20:21'),
('extremum', 11, '2023-01-16 13:20:21'),
('extremum', 18, '2023-02-08 11:50:35'),

('mixer', 5, '2022-10-16 18:30:59'),
('mixer', 10, '2022-10-20 13:20:21'),
('mixer', 15, '2022-10-21 13:25:21'),
('mixer', 4, '2022-10-22 13:30:21'),
('mixer', 19, '2022-10-26 14:20:25'),
('mixer', 6, '2022-11-01 13:20:21'),
('mixer', 1, '2022-11-14 18:30:59'),

('enthusiast', 19, '2023-02-08 20:12:13'),
('enthusiast', 10, '2023-02-09 13:20:21'),
('enthusiast', 3, '2023-02-10 13:20:21'),
('enthusiast', 11, '2023-02-15 23:23:21'),
('enthusiast', 12, '2023-02-18 13:20:20'),
('enthusiast', 9, '2023-02-20 13:40:21'),
('enthusiast', 1, '2023-02-25 15:20:30'),
('enthusiast', 14, '2023-02-28 18:30:21'),
('enthusiast', 13, '2023-03-05 22:10:21'),
('enthusiast', 4, '2023-03-10 13:15:29'),

('savage_seven', 8, '2022-08-15 10:45:03'),
('savage_seven', 16, '2022-08-25 19:54:21'),
('savage_seven', 13, '2022-09-01 10:45:03'),

('elegant', 6, '2022-05-25 12:13:10'),
('elegant', 12, '2022-05-26 14:20:22'),
('elegant', 3, '2022-05-28 13:24:23'),
('elegant', 9, '2022-06-28 14:30:29'),
('elegant', 10, '2022-08-29 16:10:59'),

('designer', 7, '2023-01-10 00:02:01'),
('designer', 1, '2023-05-15 08:19:21'),
('designer', 6, '2023-06-24 19:39:21'),
('designer', 12, '2023-08-10 13:20:55'),
('designer', 16, '2023-12-25 20:02:01'),

('blessing_things', 15, '2022-06-18 17:21:35'),
('blessing_things', 10, '2022-06-20 13:20:21'),
('blessing_things', 2, '2022-06-30 13:20:21'),
('blessing_things', 19, '2022-07-07 13:20:21'),
('blessing_things', 12, '2022-09-10 13:20:21'),
('blessing_things', 20, '2022-09-05 13:20:21'),
('blessing_things', 3, '2022-09-07 13:20:21'),
('blessing_things', 11, '2022-09-25 13:20:21'),
('blessing_things', 6, '2022-10-20 10:20:15'),

('getting_dark', 13, '2022-06-24 16:39:12'),
('getting_dark', 20, '2022-06-26 22:20:21'),
('getting_dark', 8, '2022-06-25 13:20:21'),
('getting_dark', 3, '2022-08-19 13:20:21'),
('getting_dark', 14, '2022-08-20 13:20:21'),
('getting_dark', 11, '2022-08-21 13:20:21'),
('getting_dark', 15, '2022-08-22 13:20:21'),
('getting_dark', 2, '2022-09-13 13:20:21'),
('getting_dark', 9, '2022-09-14 13:20:21'),
('getting_dark', 5, '2022-09-19 13:20:21'),
('getting_dark', 16, '2022-10-10 13:20:21'),
('getting_dark', 4, '2022-10-25 10:19:14');

INSERT INTO mus.added_albums (user_login, album_id) VALUES
('ivangorbunov07', 4),
('genri_tompson', 7),
('getting_dark', 2),
('getting_dark', 6),
('getting_dark', 11),
('getting_dark', 8),
('ivangorbunov07', 1),
('elegant', 11),
('genri_tompson', 3),
('elegant', 9),
('elegant', 4),
('savage_seven', 11),
('genri_tompson', 10),
('savage_seven', 4),
('blessing_things', 1),
('mixer', 11),
('extremum', 1),
('designer', 9),
('mixer', 5),
('blessing_things', 2),
('blessing_things', 6),
('enthusiast', 6),
('extremum', 4),
('savage_seven', 10),
('savage_seven', 8),
('extremum', 11),
('enthusiast', 5);