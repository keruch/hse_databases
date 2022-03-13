-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE SEQUENCE traffic_police_seq;
ALTER SEQUENCE traffic_police_seq OWNER TO "postgres";

-- +migrate StatementBegin
CREATE FUNCTION gen_traffic_police_id()
    RETURNS text AS
$$
DECLARE
    val TEXT = nextval('traffic_police_seq')::TEXT;
BEGIN
    RETURN CASE
               WHEN LENGTH(val) < 9 THEN 'TRP' || RIGHT('000000000' || val, 9)
               ELSE 'TRP' || val
        END;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION gen_traffic_police_id();
DROP SEQUENCE traffic_police_seq;