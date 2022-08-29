-- Consulta 1: Paises que hablan Esloveno, ordenado por porcetnaje descendente
SELECT name, language, percentage FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE language = "Slovene"
ORDER BY percentage DESC;

-- Consulta 2: Mostrar numero total de ciudades por cada país (Me falta idioma)
SELECT countries.name, COUNT(cities.id) as total_cities FROM cities
JOIN countries ON countries.id = cities.country_id
GROUP BY countries.id
ORDER BY total_cities DESC;

-- Consulta 3: Obtener ciudades de México con poblacion mayor a 500000 ordenado descendente
SELECT countries.name AS country_name, cities.name AS city_name, cities.population AS population FROM cities
JOIN countries ON countries.id = cities.country_id
WHERE countries.name = "MEXICO" AND cities.population > 500000
ORDER BY cities.population DESC;

-- Consulta 4: Obtener todos los idiomas de cada país con una porcentaje mayor a 89% ordenado descendente
SELECT name, language, percentage FROM countries
JOIN languages ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY percentage DESC;

-- Consulta 5: Obtener todos los paises con área menor a 501 y poblacion mayor a 100000
SELECT name, surface_area, population FROM countries
WHERE surface_area < 501 AND population > 100000;

-- Consulta 6: Obtener países con monarquía constitucional, capital superior a 200 y esperanza de vida mayor a 75
SELECT name, government_form, capital, life_expectancy FROM countries
WHERE government_form = "Constitutional Monarchy" AND capital > 200 AND life_expectancy > 75;

-- Consulta 7: Obtener todas las ciudades de Argentina  dentro de BsAs con poblacion mayor a 500000
SELECT countries.name AS country_name, cities.name AS city_name, cities.district, cities.population AS population FROM cities
JOIN countries ON countries.id = cities.country_id
WHERE countries.name = "Argentina" AND cities.district = "Buenos Aires" AND cities.population > 500000;

-- Consulta 8: Numero de paises por region ordenado descendente
SELECT region, COUNT(countries.id) AS number_of_countries FROM countries
GROUP BY region
ORDER by number_of_countries DESC;
