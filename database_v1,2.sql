CREATE TABLE `user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` BIGINT NOT NULL,
    `birth_date` DATETIME NOT NULL
);
CREATE TABLE `publisher`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL
);
CREATE TABLE `events`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `pictures` SET
        ('') NOT NULL,
        `event_date_start` DATETIME NOT NULL,
        `event_date_end` DATETIME NOT NULL,
        `publishing_date` DATETIME NOT NULL,
        `city_id` BIGINT NOT NULL,
        `age_restricted` BOOLEAN NOT NULL
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
CREATE TABLE `favorites`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL
);
ALTER TABLE
    `events` ADD CONSTRAINT `events_city_id_foreign` FOREIGN KEY(`city_id`) REFERENCES `cities`(`id`);
ALTER TABLE
    `application` ADD CONSTRAINT `application_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `mcategory` ADD CONSTRAINT `mcategory_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `publisher` ADD CONSTRAINT `publisher_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `publisher` ADD CONSTRAINT `publisher_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `application` ADD CONSTRAINT `application_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `mcategory` ADD CONSTRAINT `mcategory_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);