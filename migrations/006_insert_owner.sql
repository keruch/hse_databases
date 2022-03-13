-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_owner(
    o_first text, o_last text, o_middle text, o_address text, o_type owner_type)
    RETURNS int AS
$$
INSERT INTO owner(first_name, last_name, middle_name, address, owner_type)
VALUES (o_first, o_last, o_middle, o_address, o_type)
ON CONFLICT ON CONSTRAINT unique_user DO UPDATE SET first_name=excluded.first_name
RETURNING id;
$$ LANGUAGE sql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_owner;