-- Crea 3 dojos
INSERT INTO dojos (name, created_at, updated_at)
VALUES ("Python Dojo", NOW(), NOW()), ("Java Dojo", NOW(), NOW()), ("RubyOnRails Dojo", NOW(), NOW());

-- Elimina los 3 dojos
SET SQL_SAFE_UPDATES = 0;
DELETE FROM dojos_y_ninjas.dojos; 

-- Crea otros 3 dojos nuevos
INSERT INTO dojos (name, created_at, updated_at)
VALUES ("Front-end Dojo", NOW(), NOW()), ("Back-end Dojo", NOW(), NOW()), ("Fullstack Dojo", NOW(), NOW());

-- Crea tres ninjas y que pertenezcan  al dojo 1  (inicia en dojo_id 4 por los anteriores eliminados)
INSERT INTO ninjas (first_name, last_name, age, created_at, updated_at, dojo_id)
VALUES ("Annie", "Molko", 23, NOW(), NOW(), 4), ("Carpe", "Winner", 28, NOW(), NOW(), 4), ("Andy", "Nobody", 25, NOW(), NOW(), 4);

--  Crea tres ninjas y que pertenezcan  al dojo 2
INSERT INTO ninjas (first_name, last_name, age, created_at, updated_at, dojo_id)
VALUES ("Carlos", "Sainz", 26, NOW(), NOW(), 5), ("Max", "Verstappen", 24, NOW(), NOW(), 5), ("Sergio", "Perez", 32, NOW(), NOW(), 5);

-- Crea tres ninjas y que pertenezcan  al dojo 3  
INSERT INTO ninjas (first_name, last_name, age, created_at, updated_at, dojo_id)
VALUES ("Fernando", "Alonso", 40, NOW(), NOW(), 6), ("Lewis", "Hamilton", 36, NOW(), NOW(), 6), ("Sebastian", "Vettel", 35, NOW(), NOW(), 6);


-- Recupera los ninjas del primer dojo
SELECT first_name, last_name, dojo_id, name FROM dojos
JOIN ninjas ON dojos.dojos_id = ninjas.dojo_id
WHERE dojos_id = 4;

-- Recupera los ninjas del último dojo
SELECT first_name, last_name, dojo_id, name FROM dojos
JOIN ninjas ON dojos.dojos_id = ninjas.dojo_id
WHERE dojos_id = (SELECT dojos_id 
FROM dojos 
ORDER BY dojos_id DESC 
LIMIT 1);

-- Recupera el dojo del último ninja
SELECT dojo_id, name FROM dojos
JOIN ninjas ON dojos.dojos_id = ninjas.dojo_id
WHERE ninjas_id = (SELECT ninjas_id
FROM ninjas
ORDER BY ninjas_id DESC
LIMIT 1)

