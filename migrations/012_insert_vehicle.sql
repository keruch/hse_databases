-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_vehicle(
    vehicle_color text, vehicle_model vehicle_model, vehicle_type vehicle_type)
    RETURNS text AS
$$
BEGIN
    INSERT INTO vehicle(color, type, model)
    VALUES (vehicle_color, vehicle_type, vehicle_model);
    RAISE NOTICE 'Generated new vehicle % % % with id %', vehicle_color, vehicle_model, vehicle_type, currval('vehicle_seq')::TEXT;
    RETURN currval('vehicle_seq')::TEXT;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_vehicle;