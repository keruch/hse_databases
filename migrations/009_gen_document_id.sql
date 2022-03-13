-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE SEQUENCE document_seq;
ALTER SEQUENCE document_seq OWNER TO "postgres";

-- +migrate StatementBegin
CREATE FUNCTION gen_document_id()
RETURNS text AS $$
DECLARE
    val TEXT = nextval('document_seq')::TEXT;
BEGIN
    RETURN CASE
        WHEN LENGTH(val) < 9 THEN 'DOC' || RIGHT('000000000' || val, 9)
               ELSE 'DOC' || val
        END;
END;
$$ LANGUAGE plpgsql;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION gen_document_id();
DROP SEQUENCE document_seq;