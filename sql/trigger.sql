CREATE OR REPLACE FUNCTION update_transporter_rating() RETURNS TRIGGER AS $$
BEGIN
    UPDATE is_tp_transporter 
    SET rating = (SELECT AVG(grade) 
                  FROM is_tp_orderHistory 
                  WHERE transporter_id = NEW.transporter_id)
    WHERE id = NEW.transporter_id;
    RETURN NEW;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER after_orderHistory_update
AFTER UPDATE ON is_tp_orderHistory
FOR EACH ROW
EXECUTE FUNCTION update_transporter_rating();


CREATE OR REPLACE FUNCTION create_order_after_win() RETURNS TRIGGER AS $$
DECLARE
    new_order_id INT;
BEGIN
    IF NEW.win AND NOT OLD.win THEN
        INSERT INTO is_tp_order (auction_id, finish_data, driver_id, transport_id, status, comments)
        VALUES (
            NEW.auction_id,
            CURRENT_DATE + INTERVAL '7 days',
            (SELECT user_id FROM is_tp_transporter WHERE id = NEW.transporter_id),
            (SELECT transport_id FROM is_tp_transporter WHERE id = NEW.transporter_id),
            'Создан',
            'Создан автоматически после выигрыша ставки'
        )
        RETURNING id INTO new_order_id;

        RAISE NOTICE 'Создан новый заказ с ID: %', new_order_id;
    END IF;

    RETURN NEW;
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER after_bet_update
AFTER UPDATE ON is_tp_bet
FOR EACH ROW
EXECUTE FUNCTION create_order_after_win();


CREATE OR REPLACE FUNCTION add_to_orderHistory() RETURNS TRIGGER AS $$
DECLARE
    new_bet_id INT;
    transporter_id INT;
BEGIN
    IF NEW.status = 'Завершен' AND OLD.status <> 'Завершен' THEN
        SELECT id, transporter_id INTO new_bet_id, transporter_id
        FROM is_tp_bet 
        WHERE auction_id = NEW.auction_id AND win = TRUE
        LIMIT 1;

        INSERT INTO is_tp_orderHistory (order_id, customer_id, transporter_id, grade)
        VALUES (
            NEW.id,
            (SELECT user_id FROM is_tp_customer WHERE id = NEW.customer_id),
            transporter_id,
            NULL
        );

        RAISE NOTICE 'Добавлена запись в OrderHistory для заказа ID: %', NEW.id;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER after_order_update
AFTER UPDATE ON is_tp_order
FOR EACH ROW
EXECUTE FUNCTION add_to_orderHistory();