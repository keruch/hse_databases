-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_vehicle(
    vehicle_color text, vehicle_model vehicle_model, vehicle_type vehicle_type)
    RETURNS int AS
$$
INSERT INTO vehicle(color, type, model)
VALUES (vehicle_color, vehicle_type, vehicle_model)
RETURNING id;
$$ LANGUAGE sql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_vehicle;