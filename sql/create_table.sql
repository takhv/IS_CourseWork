CREATE TABLE is_tp_company (
    id SERIAL PRIMARY KEY,
    name TEXT not null,
    address TEXT
);

CREATE TABLE is_tp_transport (
    id SERIAL PRIMARY KEY,
    name TEXT not null,
    body_type TEXT not null,
    company_id INT REFERENCES is_tp_company(id) not null
);

CREATE TABLE is_tp_user (
    id SERIAL PRIMARY KEY,
    login TEXT not null,
    password TEXT not null,
    name TEXT not null,
    surname TEXT not null,
    company_id INT REFERENCES is_tp_company(id)
);

CREATE TABLE is_tp_cargo (
    id SERIAL PRIMARY KEY,
    name TEXT,
    weight INT check (weight > 0),
    size INT check (size > 0),
    customer_id INT REFERENCES is_tp_user(id) not null
);

CREATE TABLE is_tp_userCompany (
    user_id INT REFERENCES is_tp_user(id),
    company_id INT REFERENCES is_tp_company(id),
    PRIMARY KEY (user_id, company_id)
);

CREATE TABLE is_tp_way (
    id SERIAL PRIMARY KEY,
    start TEXT not null,
    finish TEXT not null,
    customer_id INT REFERENCES is_tp_user(id)
);

CREATE TABLE is_tp_request (
    id SERIAL PRIMARY KEY,
    cargo_id INT REFERENCES is_tp_cargo(id) not null,
    way_id INT REFERENCES is_tp_way(id) not null,
    comments TEXT,
    requirements TEXT
);

CREATE TABLE is_tp_transporter (
    id SERIAL PRIMARY KEY,
    amount_order INT check (amount_order > 0),
    rating FLOAT check (rating >= 0),
    user_id INT REFERENCES is_tp_user(id) not null
);

CREATE TABLE is_tp_auction (
    id SERIAL PRIMARY KEY,
    starter_cost INT check (starter_cost > 0) Not null,
    customer_id INT REFERENCES is_tp_user(id) not null,
    request_id INT REFERENCES is_tp_request(id) not null
);

CREATE TABLE is_tp_bet (
    id SERIAL PRIMARY KEY,
    transporter_id INT REFERENCES is_tp_transporter(id) not null,
    cost INT check (cost > 0) not null,
    auction_id INT REFERENCES is_tp_auction(id) not null,
    win BOOL Default false
);


CREATE TABLE is_tp_driver (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES is_tp_user(id) not null,
    driving_experience INT check (driving_experience > 0) not null
);

CREATE TABLE is_tp_order (
    id SERIAL PRIMARY KEY,
    auction_id INT REFERENCES is_tp_auction(id) not null,
    finish_data DATE not null,
    driver_id INT REFERENCES is_tp_driver(id),
    transport_id INT REFERENCES is_tp_transport(id),
    status TEXT,
    comments TEXT
);

CREATE TABLE is_tp_customer (
    id SERIAL PRIMARY KEY,
    amount_order INT,
    user_id INT REFERENCES is_tp_user(id) not null
);

CREATE TABLE is_tp_orderHistory (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES is_tp_order(id) not null,
    customer_id INT REFERENCES is_tp_customer(id) not null,
    transporter_id INT REFERENCES is_tp_transporter(id) not null,
    grade INT check (grade > 0)
);