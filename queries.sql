-- write your queries here

SELECT * 
FROM owners o 
FULL JOIN vehicles v 
ON o.id = v.owner_id

SELECT first_name, last_name, COUNT(v.id) AS total_cars
FROM  owners o 
FULL JOIN vehicles v
ON o.id = v.owner_id 
GROUP BY o.id 
ORDER BY total_cars

SELECT o.first_name, o.last_name,ROUND(SUM(v.price)/COUNT(v.id)) AS average_price, COUNT(v.id) AS total_cars
FROM  owners o 
JOIN vehicles v
ON o.id = v.owner_id 
GROUP BY  (o.first_name, o.last_name)
HAVING COUNT(o.id)>1 AND ROUND(AVG(price))>10000
ORDER BY o.first_name DESC
