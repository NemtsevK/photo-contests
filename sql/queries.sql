CREATE
  DATABASE test_db DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_general_ci';

CREATE TABLE phc_categories
(
  id   INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE phc_works
(
  id       INT AUTO_INCREMENT PRIMARY KEY,
  name     VARCHAR(255),
  image    VARCHAR(255),
  likes    INT,
  comments INT,
  category INT,
  CONSTRAINT fk_phc_works_category FOREIGN KEY (category) REFERENCES phc_categories (id)
);

INSERT INTO phc_categories (name)
VALUES ('Участники 10-12 лет'),
       ('Участники 13-15 лет'),
       ('Участники 16-18 лет');

INSERT INTO phc_works (name, image, likes, comments, category)
VALUES ('Удивительный макромир', 'photo-1.jpg', 160, 30, 1),
       ('Красоты Краснодарского края', 'photo-2.jpg', 110, 20, 2),
       ('У перекрёстка дорог', 'photo-3.jpg', 50, 15, 1),
       ('Опылитель', 'photo-4.jpg', 95, 35, 2),
       ('Приэльбрусье', 'photo-5.jpg', 100, 46, 1),
       ('Раннее утро', 'photo-6.jpg', 130, 46, 1),
       ('Летний вечер в деревне', 'photo-7.jpg', 102, 99, 2),
       ('У реки', 'photo-8.jpg', 530, 300, 2),
       ('Туман в лесу', 'photo-9.jpg', 150, 65, 2),
       ('Гуси в деревне', 'photo-10.jpg', 55, 15, 2),
       ('Заяц в лесу', 'photo-11.jpg', 200, 90, 2),
       ('Ромашки', 'photo-12.jpg', 180, 70, 3);
