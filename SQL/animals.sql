-- 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
CREATE DATABASE 'human_friends';
USE 'human_friends';

-- 8. Создать таблицы с иерархией из диаграммы в БД
CREATE TABLE 'animals' (
     id INT AUTO_INCREMENT PRIMARY KEY,
     animals_class VARCHAR(20)
);

INSERT INTO 'animals' (animals_class) VALUES
    ('pets'),
    ('packs');  
    
CREATE TABLE 'pets' (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_family VARCHAR (20),
    animals_id INT,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO 'pets' (animal_family, animals_id) VALUES
    ('dogs', 1),
    ('cats', 1),  
    ('hamsters', 1); 

CREATE TABLE 'packs' (
    id INT AUTO_INCREMENT PRIMARY KEY,
    animal_family VARCHAR (20),
    animals_id INT,
    FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO 'packs' (animal_family, animals_id) VALUES
    ('horses', 2),
    ('camels', 2),  
    ('donkeys', 2); 

CREATE TABLE 'dogs' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'pets_id' INT,
  FOREIGN KEY ('pets_id') REFERENCES 'pets' ('id') ON DELETE CASCADE
);

CREATE TABLE 'cats' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'pets_id' INT,
  FOREIGN KEY ('pets_id') REFERENCES 'animals' ('id') ON DELETE CASCADE
);

CREATE TABLE 'hamsters' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'pets_id' INT,
  FOREIGN KEY ('pets_id') REFERENCES 'animals' ('id') ON DELETE CASCADE
);

CREATE TABLE 'horses' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'packs_id' INT,
  FOREIGN KEY ('packs_id') REFERENCES 'animals' ('id') ON DELETE CASCADE
);

CREATE TABLE 'camels' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'packs_id' INT,
  FOREIGN KEY ('packs_id') REFERENCES 'animals' ('id') ON DELETE CASCADE
);

CREATE TABLE 'donkeys' (
   id INT AUTO_INCREMENT,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'packs_id' INT,
  FOREIGN KEY ('packs_id') REFERENCES 'animals' ('id') ON DELETE CASCADE
);

-- 9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения
INSERT INTO 'dogs' ('name', 'commands', 'date_of_birth', 'pets_id') VALUES
  ('name_of_dog1', 'command1, command2', '2001-01-01', 1),
  ('name_of_dog2', 'command3, command4', '2002-02-02', 1),
  ('name_of_dog3', 'command5, command6', '2003-03-03', 1),
  ('name_of_dog4', 'command7, command8', '2004-04-04', 1);

INSERT INTO 'cats' ('name', 'commands', 'date_of_birth', 'pets_id') VALUES
  ('name_of_cat1', 'command1, command2', '2001-01-01', 2),
  ('name_of_cat2', 'command3, command4', '2002-02-02', 2),
  ('name_of_cat3', 'command5, command6', '2003-03-03', 2),
  ('name_of_cat4', 'command7, command8', '2004-04-04', 2);

INSERT INTO 'hamsters' ('name', 'commands', 'date_of_birth', 'pets_id') VALUES
  ('name_of_hamster1', 'command1, command2', '2001-01-01', 3),
  ('name_of_hamster2', 'command3, command4', '2002-02-02', 3),
  ('name_of_hamster3', 'command5, command6', '2003-03-03', 3),
  ('name_of_hamster4', 'command7, command8', '2004-04-04', 3);

INSERT INTO 'horses' ('name', 'commands', 'date_of_birth', 'packs_id') VALUES
  ('name_of_horse1', 'command1, command2', '2001-01-01', 1),
  ('name_of_horse2', 'command3, command4', '2002-02-02', 1),
  ('name_of_horse3', 'command5, command6', '2003-03-03', 1),
  ('name_of_horse4', 'command7, command8', '2004-04-04', 1);

INSERT INTO 'camels' ('name', 'commands', 'date_of_birth', 'packs_id') VALUES
  ('name_of_camel1', 'command1, command2', '2001-01-01', 2),
  ('name_of_camel2', 'command3, command4', '2002-02-02', 2),
  ('name_of_camel3', 'command5, command6', '2003-03-03', 2),
  ('name_of_camel4', 'command7, command8', '2004-04-04', 2);

INSERT INTO 'donkeys' ('name', 'commands', 'date_of_birth', 'packs_id') VALUES
  ('name_of_donkey1', 'command1, command2', '2001-01-01', 3),
  ('name_of_donkey2', 'command3, command4', '2002-02-02', 3),
  ('name_of_donkey3', 'command5, command6', '2003-03-03', 3),
  ('name_of_donkey4', 'command7, command8', '2004-04-04', 3);
  
-- 10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
  DROP TABLE 'camels';
  
-- Создаем таблицу "horses_and_donkeys"
CREATE TABLE 'horses_and_donkeys' (
   id INT AUTO_INCREMENT PRIMARY KEY,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'packs_id' INT,
  'animal_family' VARCHAR(10)
);

-- Вставляем данные из "horses" в таблицу "horses_and_donkeys"
INSERT INTO 'horses_and_donkeys' ('name', 'commands', 'date_of_birth', 'packs_id', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'packs_id', 'Horse' AS 'animal_family'
FROM 'horses';

-- Вставляем данные из "donkeys" в таблицу "horses_and_donkeys"
INSERT INTO 'horses_and_donkeys' ('name', 'commands', 'date_of_birth', 'packs_id', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'packs_id', 'Donkey' AS 'animal_family'
FROM 'donkeys';

-- 11.Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- до месяца подсчитать возраст животных в новой таблице
CREATE TABLE 'young_animals' (
  id INT AUTO_INCREMENT PRIMARY KEY,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'animal_family' VARCHAR(10),
  'age_months' INT
);

INSERT INTO 'young_animals' ('name', 'commands', 'date_of_birth', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'Dog' AS 'animal_family', TIMESTAMPDIFF(MONTH, 'date_of_birth', CURDATE()) AS 'age_months'
FROM 'dogs'
WHERE 'date_of_birth' BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO 'young_animals' ('name', 'commands', 'date_of_birth', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'Cat' AS 'animal_family', TIMESTAMPDIFF(MONTH, 'date_of_birth', CURDATE()) AS 'age_months'
FROM 'cats'
WHERE 'date_of_birth' BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO 'young_animals' ('name', 'commands', 'date_of_birth', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'Hamster' AS 'animal_family', TIMESTAMPDIFF(MONTH, 'date_of_birth', CURDATE()) AS 'age_months'
FROM 'hamsters'
WHERE 'date_of_birth' BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO 'young_animals' ('name', 'commands', 'date_of_birth', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'Donkey' AS 'animal_family', TIMESTAMPDIFF(MONTH, 'date_of_birth', CURDATE()) AS 'age_months'
FROM 'donkeys'
WHERE 'date_of_birth' BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

INSERT INTO 'young_animals' ('name', 'commands', 'date_of_birth', 'animal_family')
SELECT 'name', 'commands', 'date_of_birth', 'Horse' AS 'animal_family', TIMESTAMPDIFF(MONTH, 'date_of_birth', CURDATE()) AS 'age_months'
FROM 'horses'
WHERE 'date_of_birth' BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

-- 12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
CREATE TABLE 'all_animals' (
  id INT AUTO_INCREMENT PRIMARY KEY,
  'name' VARCHAR(20),
  'commands' VARCHAR(50),
  'date_of_birth' DATE,
  'family' VARCHAR(10),
  'animal_class' VARCHAR(10)
);

INSERT INTO 'all_animals' ('name', 'commands', 'date_of_birth', 'family', 'animal_class')
SELECT 'name', 'commands', 'date_of_birth', 'dogs' AS 'family', 'pets' AS 'animal_class'
FROM 'dogs';

INSERT INTO 'all_animals' ('name', 'commands', 'date_of_birth', 'family', 'animal_class')
SELECT 'name', 'commands', 'date_of_birth', 'cats' AS 'family', 'pets' AS 'animal_class'
FROM 'cats';

INSERT INTO 'all_animals' ('name', 'commands', 'date_of_birth', 'family', 'animal_class')
SELECT 'name', 'commands', 'date_of_birth', 'hamsters' AS 'family', 'pets' AS 'animal_class'
FROM 'hamsters';

INSERT INTO 'all_animals' ('name', 'commands', 'date_of_birth', 'family', 'animal_class')
SELECT 'name', 'commands', 'date_of_birth', 'horses' AS 'family', 'paks' AS 'animal_class'
FROM 'horses';

INSERT INTO 'all_animals' ('name', 'commands', 'date_of_birth', 'family', 'animal_class')
SELECT 'name', 'commands', 'date_of_birth', 'donkeys' AS 'family', 'paks' AS 'animal_class'
FROM 'donkeys';
