INSERT INTO clients (name, surname, address, postal_code, city, province, phone)
VALUES 
		('Larry', 'Lobster', 'Goo Lagoon', '12345', 'Bikini Bottom', 'Pacific Ocean', '600111222'),
		('Bob', 'Fish', 'Main Street', '67890', 'Bikini Bottom', 'Pacific Ocean', '600899300'),
		('Penelope', 'Puff', 'Boating School', '23456', 'Bikini Bottom', 'Pacific Ocean', '600777888'),
		('Sheldon', 'Plankton', 'Chum Bucket', '66666', 'Rock Bottom', 'Pacific Ocean', '999888777');

----------------------------------

INSERT INTO stores (address, postal_code, city, province)
VALUES 
		('The Krusty Krab', '34567', 'Bikini Bottom', 'Pacific Ocean'),
        ('The Chum Bucket', '66666', 'Rock Bottom', 'Deep-Sea');
-----------------------------------

INSERT INTO employees (name, surname, nif, phone, role, store_id)
VALUES 
		('Spongebob', 'SquarePants', '12345678A', '6003000600', 'cook', 1),
        ('Patrick', 'Star', '12345678B', '600400800', 'delivery', 1),
        ('Squidward', 'Tentacles', '12345678C', 600700200, 'cook', 1),
        ('Mr.Eugene', 'H.Krabs', '12345678$', '600900900', 'cook',  1),
        ('Karen', 'Plankton', '00000000P', '111000111', 'delivery', 2);
-----------------------------------

INSERT INTO categories (name) 
VALUES
		('vegan'),
        ('special recipe');
-----------------------------------
		
INSERT INTO products (name, description, price, type, category_id)
VALUES 
		('Krabby Patty', 'The signature burger!!', 4.99, 'burger', 2),
        ('Chum Burger', 'inedible and unappealing', 3.99, 'burger', null),
        ('Seafoam Soda', 'Yummy foamy drink', 2.79, 'drink', null),
        ('Diet Red Tide', 'Gassy and red', 1.50, 'drink', null), 
        ('Kelp Pizza', 'Green and oily', 6.66, 'pizza', 1);
        
-----------------------------------

INSERT INTO orders (client_id, order_datetime, delivery_or_pickup, total_price, store_id, delivery_employee_id, delivery_datetime)
VALUES
		(1, '2026-02-22', 'pickup', 6.49, 1, null, null),
        (2, '2026-01-20', 'delivery', 10.65, 2, 15, '2026-01-20 15:35:00'),
        (3, '2026-03-05', 'delivery', 1.50, 1, 11, '2026-03-05 19:10:00');
---------------------------------
INSERT INTO order_items (order_id, product_id, quantity)
VALUES 
		(1, 4, 1),
        (1, 1, 1),
        (2, 2, 1),
        (2, 5, 1),
        (3, 4, 1);

---------------------------------

--  I made mistakes so now i have to update :-) --
--  I Will update the categories --

SELECT * FROM categories;

UPDATE categories
SET name = 'Plankton Specials'
WHERE category_id = 2;

INSERT INTO categories (name)
VALUES ('Jelly Fish');

--  Krabby Patty won't have a category since it's not a pizza --

SELECT * FROM products;

SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET category_id = NULL
WHERE name = 'Krabby Patty';

SET SQL_SAFE_UPDATES = 1;

--  Add more pizzas! --

INSERT INTO products (name, description, price, type, category_id)
VALUES 
		('Jellyfish Jam Pizza', 'Might cause allergic reaction', 5.99, 'pizza', 3),
        ('DeepSea Mud Pizza', 'The Chum Bucket Special!', '8.66', 'pizza', 2);
 
-- Add a few more orders  --

INSERT INTO orders (client_id, order_datetime, delivery_or_pickup, total_price, store_id, delivery_employee_id, delivery_datetime)
VALUES
        (4, '2026-04-01', 'delivery', 11.45, 2, 15, '2026-04-01 20:40:00'),
        (1, '2026-01-18', 'delivery', 12.98, 1, 12, '2026-01-18 16:30:00');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES 
		(4, 3, 1),
        (4, 7, 1),
        (5, 2, 1),
        (5, 6, 1),
        (5, 4, 2);

-- DateTime on orders (I forgot :P) --

UPDATE orders
SET order_datetime = '2026-02-22 18:45:00'
WHERE order_id = 1;

UPDATE orders
SET order_datetime = '2026-01-20 15:10:00'
WHERE order_id = 2;

UPDATE orders
SET order_datetime = '2026-03-05 19:00:00'
WHERE order_id = 3;

UPDATE orders
SET order_datetime = '2026-04-01 19:20:00'
WHERE order_id = 4;

UPDATE orders
SET order_datetime = '2026-01-18 20:10:00'
WHERE order_id = 5;

-- delivery_employee_id mistake --

UPDATE orders
SET delivery_employee_id = 12
WHERE order_id = 4;

UPDATE orders
SET delivery_employee_id = 12
WHERE order_id = 3;
