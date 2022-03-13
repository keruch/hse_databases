-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE PROCEDURE register_vehicle(
    owner_first_name text, owner_last_name text, owner_middle_name text, owner_address text, owner_type owner_type,
    vehicle_color text, vehicle_model vehicle_model, vehicle_type vehicle_type,
    traffic_police_address text,
    car_government_number text, registered_date timestamp) AS
$$
DECLARE
    traffic_police_id text = insert_traffic_police(traffic_police_address);
    owner_id          text = insert_owner(owner_first_name, owner_last_name, owner_middle_name, owner_address,
                                          owner_type);
    vehicle_id        text = insert_vehicle(vehicle_color, vehicle_model, vehicle_type);
BEGIN
    INSERT INTO document(traffic_police_id, owner_id, vehicle_id, car_number, date)
    VALUES (traffic_police_id, owner_id, vehicle_id, car_government_number, registered_date);
END;
$$
    LANGUAGE plpgsql;

-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP PROCEDURE register_vehicle;
