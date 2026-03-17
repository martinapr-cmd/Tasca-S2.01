INSERT INTO users (username, email, password, birth_date, gender, country, postal_code)
VALUES
('CoolGuy', 'CoolGuy1@gmail.com', 'password123', '2001-05-23', 'male',  'USA', '12345'),
('MariJanes', 'JanesMari@gmail.com', 'password222', '1986-08-14', 'female', 'UK', '34567'),
('BombGuy', 'AOIEU@gmail.com', 'coolpassword4', '2003-03-24',  'male', 'UK', '12346'),
('TomTom1', 'TomasHills@gmail.com', 'ApasswordLOL', '2002-09-04', 'other', 'UK', '45678');

INSERT INTO channels (user_id, name, description, date_joined)
VALUES
(1, 'SkatingIsCool', 'Sick af', '2019-01-10'),
(2, 'CookingWithJanes', 'Every recipe you can imagine!', '2014-07-23'),
(3, 'BombGuy707', 'This is very legal. Old channel got deleted.', '2024-06-15');


INSERT INTO videos (user_id, channel_id, title, description, file_size, file_name, 
duration, thumbnail, views, likes, dislikes, status, upload_date)
VALUES
(1, 1, '4pm skating at the park', 'someone called the cops, did a cool trick', 
500, 'VID_20240218_201455.mp4', 840, 'thumb1.jpg', 1240, 450, 30, 'public', '2024-01-12 03:30:00'),
(2, 2, 'how to make ratatouille', 'ratatouille recipe step by step, ingredients below', 
700, 'ratatouillerecipevideo.mp4', 2100, 'ratatouille_pic.jpg', 20540, 1020, 40, 'public', '2017-04-20 17:45:00' ),
(3, 3, 'Testing some new equipment I bought', 'No, I will tell you where to buy this stuff',
400, 'VID_8282372_362672.mp4', 240, 'aaaaaajss.jpg', 140, 60, 2, 'public', '2025-04-22 16:20:00');

INSERT INTO tags (tag_name)
VALUES
('vlog'),
('tutorial'),
('science'),
('funny'),
('cooking');

INSERT INTO video_tags (video_id, tag_id)
VALUES
(1, 1), -- vlog
(1, 4), -- funny
(2, 5), -- cooking
(3, 2), -- tutorial
(3, 3); -- science

INSERT INTO subscriptions (subscriber_id, channel_id, subscription_date)
VALUES
(4, 1, '2023-01-15 10:00:00'),
(4, 2, '2020-03-24 15:00:00' ),
(4, 3, '2024-06-30 19:00:00');


INSERT INTO video_likes (user_id, video_id, like_type, datetime)
VALUES
(4, 1, 'like', '2024-02-12 18:00:00'),
(4, 2, 'like', '2020-04-20 16:30:00'),
(1, 3, 'dislike', '2026-02-28 04:15:00');


INSERT INTO playlists (user_id, name, creation_date, status)
VALUES
(4, 'Recipes', '2024-03-20 12:00:00', 'public'),
(4, 'Cool Vids', '2025-04-13 17:00:00', 'public');


INSERT INTO playlist_videos (playlist_id, video_id)
VALUES
(1, 2),
(2, 1),
(2, 3);


INSERT INTO comments (user_id, video_id, text, datetime)
VALUES
(4, 2, 'I replaced butter with milk, tastes fine. thumbsup:-)', '2024-02-12 18:10:00'),
(4, 1, 'Very cool trick!', '2020-04-20 16:30:00'),
(1, 3, 'dislike cause ur annoyin af', '2026-02-28 04:30:00');


INSERT INTO comment_likes (user_id, comment_id, like_type, datetime)
VALUES
(2, 1, 'like', '2024-02-13 16:00:00'),
(1, 2, 'like', '2020-04-23 01:30:00'),
(3, 3, 'dislike', '2026-02-30 17:28:00');