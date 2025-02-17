-- Вставка данных в таблицу is_tp_company
INSERT INTO is_tp_company (name, address) VALUES 
('Транспортная компания А', 'Москва, ул. Ленина, 10'),
('Логистика Б', 'Санкт-Петербург, пр. Невский, 20'),
('Грузоперевозки В', 'Екатеринбург, ул. Мира, 5');

-- Вставка данных в таблицу is_tp_transport
INSERT INTO is_tp_transport (name, body_type, company_id) VALUES 
('Грузовик А', 'Фургон', 1),
('Грузовик Б', 'Бортовой', 2),
('Грузовик В', 'Контейнерный', 3);

-- Вставка данных в таблицу is_tp_user
INSERT INTO is_tp_user (login, password, name, surname, company_id) VALUES 
('user1', 'password1', 'Rayan', 'Gosling', 1),
('user2', 'password2', 'Петр', 'Петров', 2),
('user3', 'password3', 'Сергей', 'Сергеев', 3);

-- Вставка данных в таблицу is_tp_customer
INSERT INTO is_tp_customer (amount_order, user_id) VALUES 
(15, 1), 
(10, 2), 
(20, 3);

-- Вставка данных в таблицу is_tp_cargo
INSERT INTO is_tp_cargo (name, weight, size, customer_id) VALUES 
('Груз А', 1000, 10, 1),
('Груз Б', 2000, 20, 2),
('Груз В', 1500, 15, 3);

-- Вставка данных в таблицу is_tp_userCompany
INSERT INTO is_tp_userCompany (user_id, company_id) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Вставка данных в таблицу is_tp_way
INSERT INTO is_tp_way (start, finish, customer_id) VALUES 
('Москва', 'Санкт-Петербург', 1),
('Санкт-Петербург', 'Екатеринбург', 2),
('Екатеринбург', 'Казань', 3);

-- Вставка данных в таблицу is_tp_request
INSERT INTO is_tp_request (cargo_id, way_id, comments, requirements) VALUES 
(1, 1, 'Доставить в срок!', 'Холодильник'),
(2, 2, 'Беречь от повреждений!', 'Стекло'),
(3, 3, 'Упаковать надежно!', 'Крупногабаритный');

-- Вставка данных в таблицу is_tp_transporter
INSERT INTO is_tp_transporter (amount_order, rating, user_id) VALUES 
(10, 4.5, 1),
(5, 4.0, 2),
(8, 4.7, 3);

-- Вставка данных в таблицу is_tp_auction
INSERT INTO is_tp_auction (starter_cost, customer_id, request_id) VALUES 
(4500, 1, 1),
(5500, 2, 2),
(5000, 3, 3);

-- Вставка данных в таблицу is_tp_bet
INSERT INTO is_tp_bet (transporter_id, cost, auction_id, win) VALUES 
(1, 5000, 1, TRUE),
(2, 6000, 2, FALSE),
(3, 5500, 3, TRUE);

-- Вставка данных в таблицу is_tp_driver
INSERT INTO is_tp_driver (user_id ,driving_experience) VALUES 
(1 ,5),
(2 ,7),
(3 ,4);

-- Вставка данных в таблицу is_tp_order
INSERT INTO is_tp_order (auction_id ,finish_data ,driver_id ,transport_id ,status ,comments) VALUES 
(1,'2024-12-30',1 ,1,'Выполнен','Все прошло гладко'),
(2,'2024-12-31',2 ,2,'В процессе','Необходимо уточнить детали'),
(3,'2025-01-01',3 ,3,'Отменен','Клиент отказался');

-- Вставка данных в таблицу is_tp_orderHistory
INSERT INTO is_tp_orderHistory (order_id ,customer_id ,transporter_id ,grade) VALUES 
(1 ,1 ,1 ,5), 
(2 ,2 ,2 ,4), 
(3 ,3 ,3 ,3);
