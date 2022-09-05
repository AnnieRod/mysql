-- 1. Ingresos totales de marzo 2021
SELECT monthname(charged_datetime) as month, SUM(amount) as total  FROM billing
WHERE charged_datetime >='2012/03/1' AND charged_datetime < '2012/04/01';

-- 2. Ingresos totales de cliente id = 2
SELECT clients.client_id, SUM(amount) as total_revenue FROM billing
JOIN clients ON clients.client_id = billing.client_id
WHERE clients.client_id = 2;

-- 3. Todos los sitios que tiene el cliente id = 10
SELECT  client_id, domain_name FROM sites
where client_id = 10;

-- 4. Numero total de sitios creados por mes y año para cliente id 1 y id 20
 SELECT sites.client_id, COUNT(site_id) as total,monthname(created_datetime) as month, year(created_datetime ) as  year FROM sites
 WHERE sites.client_id = 20
 GROUP BY year(created_datetime), month(created_datetime);
 
 -- 5. Numero total de clientes potenciales por cada sitio entre 1 deenero de 2011 y 15 de febrero de 2011
 SELECT COUNT(leads.leads_id) as total_leads, sites.domain_name, leads.registered_datetime FROM leads
 JOIN sites ON leads.site_id = sites.site_id
 WHERE leads.registered_datetime BETWEEN "2011-01-01" and "2011-02-15"
GROUP BY sites.domain_name;

-- 6. Total de clientes potenciales que se han generado para cada cliente entre enero y diciembre
SELECT clients.first_name AS first_name, clients.last_name AS last_name , count(leads.leads_id) AS total FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE year(leads.registered_datetime) = 2011
GROUP BY clients.client_id;

-- 7. Lista de nombres de clientes y numero potencial de leads por client en cada mes para ene y junio 2011
SELECT clients.first_name AS first_name, clients.last_name AS last_name , count(leads.leads_id) AS total, monthname(leads.registered_datetime) AS month FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE year(leads.registered_datetime) = 2011 AND month(leads.registered_datetime) BETWEEN 1 and 6
GROUP BY leads.site_id
order by month(leads.registered_datetime);

-- pendientes ultimas tres consultas
