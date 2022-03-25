-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE owner_type
(
    id   int GENERATED ALWAYS AS IDENTITY,
    type text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_model
(
    id    int GENERATED ALWAYS AS IDENTITY,
    model text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_type
(
    id   int GENERATED ALWAYS AS IDENTITY,
    type text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE dictionary_changes
(
    id         int GENERATED ALWAYS AS IDENTITY,
    dictionary text                           NOT NULL,
    username   text      DEFAULT current_user NOT NULL,
    new_value  text,
    old_value  text,
    time       timestamp DEFAULT now()        NOT NULL,
    operation  text                           NOT NULL,
    PRIMARY KEY (id)
);

-- +migrate StatementBegin
CREATE FUNCTION change_trigger() RETURNS trigger AS
$$
BEGIN
    IF TG_OP = 'INSERT'
    THEN
        INSERT INTO dictionary_changes (dictionary, operation, new_value)
        VALUES (TG_RELNAME, TG_OP, NEW);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE'
    THEN
        INSERT INTO dictionary_changes (dictionary, operation, new_value, old_value)
        VALUES (TG_RELNAME, TG_OP, NEW, OLD);
        RETURN NEW;
    ELSIF TG_OP = 'DELETE'
    THEN
        INSERT INTO dictionary_changes
            (dictionary, operation, old_value)
        VALUES (TG_RELNAME, TG_OP, OLD);
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE 'plpgsql' SECURITY DEFINER;
-- +migrate StatementEnd

CREATE TRIGGER owner_type_update
    BEFORE INSERT OR UPDATE OR DELETE
    ON owner_type
    FOR EACH ROW
EXECUTE PROCEDURE change_trigger();

CREATE TRIGGER vehicle_model_update
    BEFORE INSERT OR UPDATE OR DELETE
    ON vehicle_model
    FOR EACH ROW
EXECUTE PROCEDURE change_trigger();

CREATE TRIGGER vehicle_type_update
    BEFORE INSERT OR UPDATE OR DELETE
    ON vehicle_type
    FOR EACH ROW
EXECUTE PROCEDURE change_trigger();

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TRIGGER owner_type_update ON owner_type;
DROP TRIGGER vehicle_model_update ON vehicle_model;
DROP TRIGGER vehicle_type_update ON vehicle_type;

DROP TABLE owner_type;
DROP TABLE vehicle_model;
DROP TABLE vehicle_type;

DROP TABLE dictionary_changes;

DROP FUNCTION change_trigger;
