USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ad_categories;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    cost DOUBLE NOT NULL,
    category VARCHAR(240) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE

);
CREATE TABLE categories
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE ad_categories
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);
INSERT INTO categories(name)
VALUES ('Rife'), ('Shotgun'), ('Pistol'), ('Revolver'), ('Bolt Action'), ('Semi-Automatic'), ('Lever Action');

INSERT INTO users(username, email, password) VALUES
    ('myuser', 'my_email@email.com', 'abc123');

INSERT INTO ads(user_id, title, description, cost, category) VALUES
    ('1', 'Hellcat Pro', 'flush fitting 15-round magazine', '670.00','3,7');




INSERT INTO ad_categories(ad_id, category_id) VALUE
    ('1', '3');