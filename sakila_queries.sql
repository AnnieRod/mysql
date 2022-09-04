-- 1. Clientes de ciudad con id = 312
SELECT first_name, last_name, email, customer.address_id FROM customer
JOIN address on customer.address_id = address.address_id
WHERE address.city_id = 312;

-- 2. Obtener todas las peliculas de comedia
SELECT title, description, release_year, rating, special_features, category.name FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

-- 3. Todas las películas con actor id = 5
SELECT film_actor.actor_id, actor.first_name, actor.last_name, title, description, release_year FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.actor_id = 5;

-- 4. CLientes en store id = 1 en ciudades 1, 42, 312 y 459
SELECT first_name, last_name, email, address, city.city_id, store.store_id FROM customer
JOIN store ON store.store_id = customer.store_id
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
WHERE store.store_id = 1 AND city.city_id IN (1, 42, 312, 459);

-- 5. Peliculas con G rating y special_feature "behind scenes" con actor id = 15
SELECT title, description, release_year, rating, special_features, film_actor.actor_id FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 15 AND rating = "G" AND special_features LIKE "%Behind the Scenes%";

-- 6. Actores de film 369 
SELECT film.film_id, film.title, actor.actor_id, actor.first_name, actor.last_name FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id = 369;

-- 7. Peliculas de drama con alquiler de $2,99
SELECT title, description, release_year, rating, special_features, category.name, rental_rate FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = "Drama" AND rental_rate = 2.99;

-- 8. Peliculas de accion con Sandra Kilmer
SELECT title, description, actor.first_name, actor.last_name, release_year, rating, special_features, category.name FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = "Action" AND actor.first_name ='Sandra' AND actor.last_name = 'Kilmer';
