CREATE TABLE `user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `birth_date` DATETIME NOT NULL
);
CREATE TABLE `events`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NOT NULL,
    `pictures` SET
        ('') NOT NULL,
        `publisher_id` INT NOT NULL,
        `start_date` DATETIME NOT NULL,
        `end_date` DATETIME NOT NULL,
        `city_id` INT NOT NULL,
        `age_limit` INT NOT NULL
);
CREATE TABLE `categories`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `mcategory`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` INT NOT NULL,
    `event_id` INT NOT NULL
);
CREATE TABLE `applicant`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_id` INT NOT NULL,
    `user_id` INT NOT NULL
);
CREATE TABLE `cities`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `zip_code` INT NOT NULL
);
CREATE TABLE `favorites`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `event_id` INT NOT NULL,
    `user_id` INT NOT NULL
);
ALTER TABLE
    `events` ADD CONSTRAINT `events_city_id_foreign` FOREIGN KEY(`city_id`) REFERENCES `cities`(`id`);
ALTER TABLE
    `applicant` ADD CONSTRAINT `applicant_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `mcategory` ADD CONSTRAINT `mcategory_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);
ALTER TABLE
    `favorites` ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `events` ADD CONSTRAINT `events_publisher_id_foreign` FOREIGN KEY(`publisher_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `applicant` ADD CONSTRAINT `applicant_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `user`(`id`);
ALTER TABLE
    `mcategory` ADD CONSTRAINT `mcategory_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `events`(`id`);