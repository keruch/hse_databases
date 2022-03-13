-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE owner
(
    id          int GENERATED ALWAYS AS IDENTITY,
    first_name  text       NOT NULL,
    last_name   text       NOT NULL,
    middle_name text,
    address     text       NOT NULL,
    owner_type  owner_type NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE owner
    ADD CONSTRAINT unique_user UNIQUE (first_name, last_name, middle_name, address, owner_type);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE owner;