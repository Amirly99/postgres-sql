CREATE TABLE authors
(
    id         INTEGER PRIMARY KEY,
    first_name VARCHAR(128),
    last_name  VARCHAR(128),
    email      VARCHAR(256),
    created_at TIMESTAMP


);
CREATE TABLE posts
(
    id         INTEGER PRIMARY KEY,
    title      VARCHAR(255),
    created_at TIMESTAMP,
    update_at  TIMESTAMP


);
ALTER TABLE authors
    ADD COLUMN about VARCHAR(256);
ALTER TABLE authors
    ADD COLUMN nick VARCHAR(256);

CREATE TABLE authors_books
(
    books_name VARCHAR(256) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    authors_id INT,
    posts_id   INT,
    PRIMARY KEY (authors_id, posts_id),
    FOREIGN KEY (authors_id) REFERENCES authors (id),
    FOREIGN KEY (posts_id) REFERENCES posts (id)

);
ALTER TABLE authors
    DROP COLUMN created_at;
ALTER TABLE authors
    ADD COLUMN created_at TIMESTAMP DEFAULT NOW();


CREATE TABLE subscibers
(

    id    INTEGER PRIMARY KEY,
    email VARCHAR(255)

);
ALTER TABLE authors
    ADD CONSTRAINT email_nick UNIQUE (email, nick);

ALTER TABLE posts
    ADD COLUMN images_url VARCHAR(256);
CREATE Table tags
(
    id         INTEGER PRIMARY KEY,
    tag        VARCHAR(256),
    created_at TIMESTAMP


);

CREATE TABLE multiple_accounts
(

    accounts_name VARCHAR(256),
    posts_id      INT,
    tags_id       INT,
    PRIMARY KEY (posts_id, tags_id),
    FOREIGN KEY (posts_id) REFERENCES posts (id),
    FOREIGN KEY (tags_id) REFERENCES tags (id)


);
INSERT INTO tags
VALUES (1, '**************8', Default);

ALTER TABLE authors
    ADD COLUMN update_at VARCHAR(256);
CREATE OR REPLACE VIEW authors_posts_view AS
SELECT c.posts_id,
       c.authors_id AS a_p,
       a.nick,
       b.title,
       b.created_at
FROM authors_books c
         INNER JOIN authors a ON c.authors_id = a.id
         INNER JOIN posts b ON c.posts_id = b.id;

ALTER TABLE subscibers
    DROP COLUMN email;
ALTER TABLE subscibers
    ADD COLUMN email VARCHAR(256) NOT NULL;


CREATE TABLE phone
(


    id          BIGSERIAL PRIMARY KEY NOT NULL,
    phone_mark  VARCHAR(256) UNIQUE,
    phone_model VARCHAR(256)          NOT NULL,
    created_at  TIMESTAMP DEFAULT NOW()
);

CREATE TABLE phone_charging
(
    id       BIGSERIAL PRIMARY KEY NOT NULL,
    usb_name VARCHAR(256)          NOT NULL,
    phone_id INT,
    FOREIGN KEY (phone_id) REFERENCES phone (id)

);
ALTER TABLE phone_charging
    ADD CONSTRAINT phone_id1 UNIQUE (phone_id);

CREATE TABLE football_command
(

    football_id                   BIGSERIAL PRIMARY KEY,
    football_command_name         VARCHAR(256)   NOT NULL,
    football_command_stadium_name VARCHAR(256)   NOT NULL,
    football_command_budget       NUMERIC(16, 2) not null,
    football_command_created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE football_players
(
    id           BIGSERIAL PRIMARY KEY,
    players_name VARCHAR(256) NOT NULL,
    coach_name   VARCHAR(256) NOT NULL,
    football_id  INT,
    FOREIGN KEY (football_id) REFERENCES football_command (football_id)

);

