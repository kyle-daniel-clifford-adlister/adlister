USE adlister_db;

DROP TABLE IF EXISTS ad_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE if not exists users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE if not exists ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    cost DOUBLE NOT NULL,
    category VARCHAR(240),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
#         ON DELETE CASCADE

);
CREATE TABLE if not exists categories
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(240) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE if not exists ad_categories
(
    ad_id       INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);
INSERT INTO categories(name)
VALUES ('Rifle'), ('Shotgun'), ('Pistol'), ('Revolver'), ('Bolt Action'), ('Semi-Automatic'), ('Lever Action');
SELECT ads.id from ads join ad_categories on ads.id = ad_categories.ad_id join categories on ad_categories.category_id = categories.id;
# select name from categories join ad_categories ac on categories.id = ac.category_id join ads a on a.id = ac.ad_id;

select name from categories join ad_categories ac on categories.id = ac.category_id join ads a on a.id = ac.ad_id;

delete from ad_categories where ad_id = ?
delete from ads where id = ?
# INSERT INTO ads(user_id, title, description, cost, category) VALUES
#     ('1', 'Hellcat Pro', 'flush fitting 15-round magazine', '670.00','3,7');
#
#
#
#
# INSERT INTO ad_categories(ad_id, category_id) VALUE
#     ('1', '3');
