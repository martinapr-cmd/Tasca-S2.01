CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('male','female','other'),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE TABLE channels (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    date_joined DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE videos (
    video_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    channel_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    file_size INT,
    file_name VARCHAR(255),
    duration INT UNSIGNED,
    thumbnail VARCHAR(500),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public','unlisted','private') NOT NULL,
    upload_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

CREATE TABLE tags (
    tag_id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(100) NOT NULL
);

CREATE TABLE video_tags (
    video_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE subscriptions (
    subscriber_id INT NOT NULL,
    channel_id INT NOT NULL,
    subscription_date DATETIME NOT NULL,
    PRIMARY KEY (subscriber_id, channel_id),
    FOREIGN KEY (subscriber_id) REFERENCES users(user_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

CREATE TABLE video_likes (
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    like_type ENUM('like','dislike') NOT NULL,
    datetime DATETIME NOT NULL,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    creation_date DATETIME NOT NULL,
    status ENUM('public','private') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlist_videos (
    playlist_id INT NOT NULL,
    video_id INT NOT NULL,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    text TEXT NOT NULL,
    datetime DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comment_likes (
    user_id INT NOT NULL,
    comment_id INT NOT NULL,
    like_type ENUM('like','dislike') NOT NULL,
    datetime DATETIME NOT NULL,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);


