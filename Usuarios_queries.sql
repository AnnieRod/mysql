-- Recupera todos los usuarios
SELECT * FROM users;

-- Crea 3 usuarios
INSERT INTO users(first_name, last_name, email, created_at, updated_at) 
VALUES ("Annie", "Molko", "annie@mail.com", NOW(), NOW()), ("Carpe", "Mart", "carpe@mail.com", NOW(), NOW()), ("Andy", "Nobody", "nobody@mail.com", NOW(), NOW());

-- Recupera primer usuario que usa email
SELECT first_name, email FROM users
WHERE users_id = 1;

-- Recupera último usuario que usa su ID
SELECT users_id,first_name, last_name FROM users
WHERE users_id = 3;

-- Cambia apellido de user con id = 3
UPDATE users 
SET last_name = "Panqueques"
WHERE users_id = 3;

-- Elimina el usuario 2 de la database
DELETE FROM users
WHERE users_id = 2;

-- Obten todos los usuarios ordenados por nombre
SELECT * FROM users
ORDER BY first_name;

-- Obten todos los usuarios ordenados por nombre descendente
SELECT * FROM users
ORDER BY first_name DESC;
