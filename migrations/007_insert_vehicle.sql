-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_vehicle(
    vehicle_color text, vehicle_model_id int, vehicle_type_id int)
    RETURNS int AS
$$
INSERT INTO vehicle(color, type_id, model_id)
VALUES (vehicle_color, vehicle_type_id, vehicle_model_id)
RETURNING id;
$$ LANGUAGE sql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_vehicle;