CREATE INDEX idx_order_history_customer_id ON is_tp_orderHistory(customer_id);

CREATE INDEX idx_order_history_transporter_id ON is_tp_orderHistory(transporter_id);

CREATE INDEX idx_order_history_order_id ON is_tp_orderHistory USING HASH (order_id);

-- CREATE INDEX idx_bet_auction_id ON is_tp_bet USING HASH (auction_id);

CREATE INDEX idx_bet_win ON is_tp_bet USING HASH (win);

CREATE INDEX idx_auction_customer_id ON is_tp_auction(customer_id);

CREATE INDEX idx_order_status ON is_tp_order USING HASH (status);