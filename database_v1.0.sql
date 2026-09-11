CREATE TABLE `user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` BIGINT NOT NULL
);
CREATE TABLE `publisher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `event_id` BIGINT NOT NULL
);
CREATE TABLE `events`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NOT NULL,
    `publisher_id` BIGINT NOT NULL,
    `pictures` SET
        ('') NOT NULL,
        `publishing_date` DATETIME NOT NULL,
        `city_id` BIGINT NOT NULL
);
CREATE TABLE `categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `mcategory`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` BIGINT NOT NULL,
    `event_id` BIGINT NOT NULL
);
CREATE TABLE `application`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL
);
CREATE TABLE `cities`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `postcode` BIGINT NOT NULL
);
ALTER TABLE
    `events` ADD CONSTRAINT `events_id_foreign` FOREIGN KEY(`id`) REFERENCES `publisher`(`event_id`);
ALTER TABLE
    `cities` ADD CONSTRAINT `cities_id_foreign` FOREIGN KEY(`id`) REFERENCES `events`(`city_id`);
ALTER TABLE
    `categories` ADD CONSTRAINT `categories_id_foreign` FOREIGN KEY(`id`) REFERENCES `mcategory`(`category_id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_id_foreign` FOREIGN KEY(`id`) REFERENCES `application`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_id_foreign` FOREIGN KEY(`id`) REFERENCES `application`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_id_foreign` FOREIGN KEY(`id`) REFERENCES `mcategory`(`event_id`);
ALTER TABLE
    `user` ADD CONSTRAINT `user_id_foreign` FOREIGN KEY(`id`) REFERENCES `publisher`(`user_id`);