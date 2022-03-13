-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_traffic_police(
    traffic_police_address text)
    RETURNS text AS
$$
BEGIN
    INSERT INTO traffic_police(address)
    VALUES (traffic_police_address);
    RAISE NOTICE 'Generated new traffic police with address % with id %', traffic_police_address, currval('traffic_police_seq')::TEXT;
    RETURN currval('traffic_police_seq')::TEXT;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_traffic_police;