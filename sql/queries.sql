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
  likes    INT,
  comments INT,
  category INT,
  CONSTRAINT fk_phc_works_category FOREIGN KEY (category) REFERENCES phc_categories (id)
);

INSERT INTO phc_categories (name)
VALUES ('Участники 10-12 лет'),
       ('Участники 13-15 лет'),
       ('Участники 16-18 лет');

INSERT INTO phc_works (name, likes, comments, category)
VALUES ('Я узнал, что у меня есть огромная семья', 160, 30, 1),
       ('Сказка зимнего леса', 110, 20, 2),
       ('Лесная прогулка с зайцем', 50, 15, 1),
       ('Магический единорог', 95, 35, 2),
       ('Пиратский остров с сокровищами', 100, 46, 1),
       ('Смешной котенок на горшке', 130, 46, 1),
       ('Радуга и её друзья', 102, 99, 2),
       ('Фея с волшебной палочкой', 530, 300, 2),
       ('Автомобильная гонка с монстрами', 80, 25, 2),
       ('Путешествие на воздушном шаре', 75, 22, 2),
       ('Забавные морские обитатели', 45, 10, 2),
       ('Магический замок в облаках', 120, 55, 3),
       ('Сказочный лес с грибами и ягодами', 85, 30, 3),
       ('Капитан космического корабля', 70, 20, 2),
       ('Рисование мира из мультфильмов', 150, 65, 2),
       ('Робот-автобус в городе', 200, 90, 2),
       ('Озорные эльфы на природе', 55, 15, 2),
       ('Весёлая ферма с животными', 180, 70, 3);
