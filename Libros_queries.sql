-- Crea 5 usuarios diferentes
INSERT INTO users (first_name, last_name, created_at, updated_at)
VALUES ("Jane", "Austen", NOW(), NOW()), ("Emily", "Dickinson", NOW(), NOW()), ("Fyodor", "Dostoevsky", NOW(), NOW()), ("William", "Shakespeare", NOW(), NOW()), ("Lau", "Tzu", NOW(), NOW());

-- Crea 5 libros
INSERT INTO books (title, pages_num, created_at, updated_at)
VALUES ("C Sharp", 300, NOW(), NOW()), ("Java", 287, NOW(), NOW()), ("Python", 540, NOW(), NOW()), ("PHP", 240, NOW(), NOW()), ("Ruby", 400, NOW(), NOW());

-- Cambia nombre de libro C Sharp
UPDATE books
SET title = "C#"
WHERE books_id = 1;

-- Cambia nombre de cuarto usuario
UPDATE users
SET first_name = "Bill"
WHERE users_id = 4;

-- Usuarios marcan como favoritos sus libros
INSERT INTO favorites (user_id, book_id)
VALUE (1,1), (1,2), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3), (3,4), (4,1), (4,2), (4,3), (4,5);

-- Recupera todos los usuarios que marcaron como favorito libro 3
SELECT books_id, title, first_name, last_name FROM books
JOIN favorites ON books.books_id = favorites.book_id
JOIN users ON users.users_id = favorites.user_id
WHERE books_id = 3;

-- Elimina el primer usuario de los favoritos del libro 3
DELETE FROM favorites
WHERE user_id = 2 AND book_id = 3;

-- Quinto usuario marca como favorito el libro 2
INSERT INTO favorites (user_id, book_id)
VALUES (5, 2);

-- Todos los libros que usuario 3 marcó como favoritos
SELECT users_id, first_name, last_name, books_id, title FROM users
JOIN favorites ON users.users_id = favorites.user_id
JOIN books ON books.books_id = favorites.book_id
WHERE users_id = 3;
-- otra forma mas sencilla pero que solo da los ids: 
-- SELECT * FROM favorites 
-- WHERE user_id = 3;

-- Usuarios que marcaron como favorito el libro 5 
SELECT books_id, title, first_name, last_name FROM books
JOIN favorites ON books.books_id = favorites.book_id
JOIN users ON users.users_id = favorites.user_id
WHERE books_id = 5;