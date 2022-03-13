-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
CREATE FUNCTION insert_owner(
    owner_first_name text, owner_last_name text, owner_middle_name text, owner_address text,
    owner_owner_type owner_type)
    RETURNS text AS
$$
BEGIN
    INSERT INTO owner(first_name, last_name, middle_name, address, owner_type)
    VALUES (owner_first_name, owner_last_name, owner_middle_name, owner_address, owner_owner_type);
    RAISE NOTICE 'Generated new owner % % % with id %', owner_last_name, owner_first_name, owner_middle_name, currval('owner_seq')::TEXT;
    RETURN currval('owner_seq')::TEXT;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION insert_owner;