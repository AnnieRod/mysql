-- Crea 6 usuarios nuevos
INSERT INTO users (first_name, last_name, created_at, updated_at)
VALUES ("Charles", "Leclerc", NOW(), NOW()), ("Carlos", "Sainz", NOW(), NOW()), ("Mick", "Schumacher", NOW(), NOW()), ("Kevin", "Magnussen", NOW(), NOW()), ("Lando", "Norris", NOW(), NOW()), ("Daniel", "Ricciardo", NOW(), NOW());

-- Hacer que usuarios se hagan amigos de otros
INSERT INTO friendships(user_id, friend_id)
VALUES (1,2), (1,4), (1,6), (2,1), (2,3), (2,5), (3,2), (3,5), (4,3), (5,1), (5,6), (6,2), (6,3);

-- Muestra relaciones creadas entre amigos como tabla de guía
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users
JOIN friendships ON friendships.user_id = users.users_id
LEFT JOIN users as user2 ON user2.users_id = friendships.friend_id;

-- Consulta NINJA: Devuelve todos los usuarios amigos del primer usuario (con nombres)
SELECT user2.first_name as friend_first_name, user2.last_name as friend_last_name, users.first_name, users.last_name FROM users
JOIN friendships ON friendships.user_id = users.users_id
LEFT JOIN users as user2 ON user2.users_id = friendships.friend_id 
WHERE users.users_id = 1;

-- Consulta NINJA: Devuelve el recuento de todas las amistades
SELECT COUNT(friendships_id) as count_of_friendships FROM friendships;

-- Consulta NINJA: Quien tiene más amigos y devuelve la cuenta
SELECT users_id, first_name, last_name, COUNT(user_id) as total_friends FROM friendships
JOIN users ON users.users_id = friendships.user_id
GROUP BY user_id
ORDER BY total_friends DESC
LIMIT 2; -- estan empatados dos usuarios en cantidad de amigos

-- Consulta NINJA: Devuelve los amigos del usuario 3 en orden alfabetico
SELECT user2.first_name as friend_first_name, user2.last_name as friend_last_name, users.first_name, users.last_name FROM users
JOIN friendships ON friendships.user_id = users.users_id
LEFT JOIN users as user2 ON user2.users_id = friendships.friend_id 
WHERE users.users_id = 3
ORDER BY friend_first_name;
