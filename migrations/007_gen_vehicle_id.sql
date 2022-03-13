-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE SEQUENCE vehicle_seq;
ALTER SEQUENCE vehicle_seq OWNER TO "postgres";

-- +migrate StatementBegin
CREATE FUNCTION gen_vehicle_id()
    RETURNS text AS
$$
DECLARE
    val TEXT = nextval('vehicle_seq')::TEXT;
BEGIN
    RETURN CASE
               WHEN LENGTH(val) < 9 THEN 'VCL' || RIGHT('000000000' || val, 9)
               ELSE 'VCL' || val
        END;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION gen_vehicle_id();
DROP SEQUENCE vehicle_seq;