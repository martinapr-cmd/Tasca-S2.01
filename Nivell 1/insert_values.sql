INSERT INTO providers (name, street, number, city, postal_code, country, phone, nif)
VALUES
('CoolGlasses', 'Elmo Street', '12', 'Toledo', '09300', 'USA', '666111222', 'K12345678'),
('OjoPiojo', 'Carrer Noseque', '45', 'Barcelona', '08010', 'Espanya', '600333444', 'P87654321');

INSERT INTO glasses (brand, left_graduation, right_graduation, frame_type, frame_color,
                     left_lens_color, right_lens_color, price, provider_id)
VALUES
('RayBan', 1.60, 1.50, 'paste', 'negre', 'transparent', 'transparent', 120.00, 1),
('OKOkOK', -0.75, -1.00, 'metal', 'lila', 'verd', 'verd', 150.00, 2);

INSERT INTO clients (name, postal_address, phone, email, registration_date, recommended_by)
VALUES
('Lola Lolita', 'Carrer Lola 9, Barcelona', '612555111', 'lola@gmailgmail.com', '2025-01-6', NULL),
('Big Craig', 'Carrer bogobogo 5, Barcelona', '613555222', 'craig@gmailgmail.com', '2025-02-22', 1);

INSERT INTO employees (name, phone, email, hire_date)
VALUES
('Patrick Star', '111222333', 'Star@gmailgmail.com', '2025-06-01'),
('Spongebob Squarepants', '444555666', 'Squarepants@gmailgmail.com', '2022-09-15');

INSERT INTO sales (sale_date, employee_id, client_id, glasses_id)
VALUES
('2026-02-01', 1, 1, 1),
('2026-01-10', 2, 1, 2),
('2026-02-05', 1, 2, 2);