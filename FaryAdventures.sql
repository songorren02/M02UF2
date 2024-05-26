DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS characters;
DROP PROCEDURE IF EXISTS ruleta_rusa;

CREATE TABLE characters(
	id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR (16) NOT NULL,
	age CHAR (3) NOT NULL,
	gender CHAR (3) NOT NULL,
	level CHAR (3) NOT NULL,
	health CHAR (3) NOT NULL,
	weight CHAR (3) NOT NULL,
	height CHAR (3) NOT NULL,
	origin CHAR (2) NOT NULL
);

INSERT INTO characters (name, age, gender, level, health, weight, height, origin)
VALUES
	('El Fary', '86', 'NB', '200', '70', '1.2', '47', 'GY'),
	('El Cigala', '54', 'M', '150', '80', '2.4', '150', 'RU'),
	('El Churumbel', '86', 'M', '33', '33', '2.3', '333', 'AS'),
	('El Kiko', '54', 'F', '69', '100', '1.1', '420', 'RE');

CREATE TABLE stats(
	id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	reputation CHAR (3) NOT NULL,
	speed CHAR (2) NOT NULL,
	morality CHAR (3) NOT NULL,
	defense CHAR (3) NOT NULL,
	hunger CHAR (3) NOT NULL,
	reflex CHAR (2) NOT NULL,
	stamina CHAR (3) NOT NULL,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);

INSERT INTO stats (reputation, speed, morality, defense, hunger, reflex, stamina, id_character)
VALUES
	('100', '3', '80', '2', '0', '0', '-1', '1'),
	('80', '6', '8', '9', '20', '8', '90', '2'),
	('1', '10', '0', '10', '1', '10', '50', '3'),
	('20', '10', '2', '100', '100', '0', '30', '4');

CREATE TABLE items (
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	item CHAR (16) NOT NULL,
	type CHAR (16) NOT NULL,
	rarity CHAR (2) NOT NULL,
	color CHAR (7) NOT NULL,
	size INT NOT NULL
);

INSERT INTO items (item, type, rarity, color, size)
VALUES
	('Braga', 'Ocio', '4', '#000000', '50'),
	('Microfono', 'Habla', '1', '#000000', '40'),
	('Puro', 'curacion', '7', '#7c4f00', '1000'),
	('Coca', 'boost', '10', '#ffffff', '50'),
	('Escobilla del wc', 'Limpieza', '3', '#FFFFFF', '40');

CREATE TABLE characters_items (
	id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT NULL,
	id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_item) REFERENCES items(id_item)
);

INSERT INTO characters_items (id_character, id_item)
VALUES
	(1,2),
	(3,3),
	(4,1),
	(2,4),
	(2,3),
	(3,2),
	(4,4),
	(3,3);

CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR (16) NOT NULL
);

INSERT INTO weapons_types (type)
VALUES
	('melee'),
	('proyectil');

CREATE TABLE weapons (
	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	weapon VARCHAR (16) NOT NULL,
	damage INT NOT NULL,
	level INT NOT NULL,
	size INT NOT NULL,
	height FLOAT NOT NULL,
	weight FLOAT NOT NULL,
	id_weapon_type INT UNSIGNED NOT NULL
);

INSERT INTO weapons (weapon, damage, level, size, height, weight, id_weapon_type)
VALUES
	('navaja', 20, 1, 7, 12.5, 1.5, 1),
	('palillo', 1, 2, 5, 4, 0.025, 2),
	('dildo', 1000, 20, 25, 20, 0.5, 1),
	('jabon', 50, 10, 10, 0.4, 1.2, 2);

CREATE TABLE characters_weapons (
	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT NULL,
	id_weapon INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES
	(2,3),
	(3,1),
	(1,3),
	(1,2);

DELIMITER $$

CREATE PROCEDURE ruleta_rusa()
BEGIN
	DECLARE ruleta INT UNSIGNED;
    
    SELECT FLOOR(rand()*(10-1+1)) INTO ruleta;
    
    IF ruleta = 5
    THEN
    SELECT 'El calvo ha muerto';
    ELSE
    SELECT 'Has perdido una empanadilla';
    END IF;
    
END $$
DELIMITER ;
    

	























