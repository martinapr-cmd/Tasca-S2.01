SELECT clients.name,
       COUNT(*) AS total_compres
FROM sales
JOIN clients ON sales.client_id = clients.client_id
WHERE clients.client_id = 1
GROUP BY clients.client_id, clients.name;


SELECT employees.name AS employee_name,
       glasses.glasses_id,
       glasses.brand,
       glasses.price
FROM sales
JOIN employees ON sales.employee_id = employees.employee_id
JOIN glasses ON sales.glasses_id = glasses.glasses_id
WHERE employees.employee_id = 1
  AND YEAR(sales.sale_date) = 2026;


SELECT providers.name AS provider_name,
       glasses.brand AS glasses_brand,
       COUNT(*) AS amount_sold
FROM providers
JOIN glasses ON glasses.provider_id = providers.provider_id
JOIN sales ON sales.glasses_id = glasses.glasses_id
GROUP BY providers.provider_id, providers.name, glasses.glasses_id, glasses.brand;