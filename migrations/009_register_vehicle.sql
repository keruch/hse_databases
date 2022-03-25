-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE PROCEDURE register_vehicle(
    o_first text, o_last text, o_middle text, o_address text, o_type_id int,
    v_color text, v_model_id int, v_type_id int,
    t_address text,
    reg_number text, reg_date timestamp) AS
$$
INSERT INTO document(traffic_police_id, owner_id, vehicle_id, car_number, date)
VALUES (insert_traffic_police(t_address),
        insert_owner(o_first, o_last, o_middle, o_address, o_type_id),
        insert_vehicle(v_color, v_model_id, v_type_id),
        reg_number, reg_date);
$$ LANGUAGE sql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP PROCEDURE register_vehicle;
