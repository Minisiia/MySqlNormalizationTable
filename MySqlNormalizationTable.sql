/*
Нормализируйте заданную таблицу
*/

DROP DATABASE army;
CREATE DATABASE army;
USE army;

CREATE TABLE officers(
id INT AUTO_INCREMENT NOT NULL,
s_name VARCHAR(20),
f_name VARCHAR(20),
patronymic VARCHAR(20),
officer_rank VARCHAR(20),
PRIMARY KEY (id)
);

INSERT INTO officers
(s_name, f_name, patronymic, officer_rank) 
VALUES
('Буров', 'Олег', 'Сергеевич', 'майор'),
('Рыбаков', 'Николай', 'Григорьевич', 'майор'),
('Деребанов', 'Виталий', 'Ярославович', 'подполковник');

CREATE TABLE weapon(
id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(20),
officer_id INT,
PRIMARY KEY (id),
FOREIGN KEY (officer_id) REFERENCES officers(id)
);

INSERT INTO weapon
(name,officer_id)
VALUES
('AK-47', 1),('Глок20', 2),('АК-74', 3);

CREATE TABLE soldiers(
id INT AUTO_INCREMENT NOT NULL,
s_name VARCHAR(20),
f_name VARCHAR(20),
patronymic VARCHAR(20),
of_numer VARCHAR(20),
platoon VARCHAR(20),
PRIMARY KEY (id)
);

INSERT INTO soldiers
(s_name, f_name, patronymic, of_numer, platoon)
VALUES
('Петров','Виталий','Александрович', 205, 222),
('Лодарев','Петр','Сергеевич', 221, 232),
('Леонтьев','Константин','Витальевич', 201, 212),
('Духов','Руслан','Михайлович', NULL, 100);

CREATE TABLE soldiersWeapon(
id_soldier INT,
id_weapon INT,
FOREIGN KEY (id_soldier) REFERENCES soldiers(id),
FOREIGN KEY (id_weapon) REFERENCES weapon(id)
);

INSERT INTO soldiersWeapon
(id_soldier, id_weapon)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 2),
(3, 1),
(3, 2),
(4, 1);

-- Проверка всех таблиц
SELECT * FROM soldiersWeapon;
SELECT * FROM soldiers;
SELECT * FROM weapon;
SELECT * FROM officers;

-- Проверка связей. Вывести фамилии солдатов и название оружия, которое выдал подполковник
SELECT soldiers.s_name, weapon.name
FROM soldiersWeapon
JOIN soldiers
ON soldiersWeapon.id_soldier = soldiers.id
JOIN weapon
ON soldiersWeapon.id_weapon = weapon.id
JOIN officers
ON weapon.officer_id = officers.id
WHERE officers.officer_rank = 'подполковник';