SELECT  clients.city AS city_name,
		SUM(order_items.quantity) AS total_drinks_sold
FROM order_items
JOIN products ON order_items.product_id = products.product_id
JOIN orders ON order_items.order_id = orders.order_id
JOIN clients ON orders.client_id = clients.client_id
WHERE products.type = 'drink'
  AND clients.city = 'Bikini Bottom'
  GROUP BY clients.city;

SELECT employees.name,
	   employees.surname,
       COUNT(*) AS total_orders_delivered
FROM orders
JOIN employees ON orders.delivery_employee_id = employees.employee_id
  WHERE employees.employee_id = 12
  GROUP BY employees.employee_id , employees.name , employees.surname;
