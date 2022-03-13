-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE SEQUENCE owner_seq;
ALTER SEQUENCE owner_seq OWNER TO "postgres";

-- +migrate StatementBegin
CREATE FUNCTION gen_owner_id()
    RETURNS text AS
$$
DECLARE
    val TEXT = nextval('owner_seq')::TEXT;
BEGIN
    RETURN CASE
               WHEN LENGTH(val) < 9 THEN 'OWN' || RIGHT('000000000' || val, 9)
               ELSE 'OWN' || val
        END;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION gen_owner_id();
DROP SEQUENCE owner_seq;