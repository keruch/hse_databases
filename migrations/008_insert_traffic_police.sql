-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_traffic_police(
    traffic_police_address text)
    RETURNS int AS
$$
INSERT INTO traffic_police(address)
VALUES (traffic_police_address)
ON CONFLICT(address) DO UPDATE SET address=excluded.address
RETURNING id;
$$ LANGUAGE sql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_traffic_police;