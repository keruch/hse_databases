-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE owner
(
    id            int GENERATED ALWAYS AS IDENTITY,
    first_name    text NOT NULL,
    last_name     text NOT NULL,
    middle_name   text NOT NULL,
    address       text NOT NULL,
    owner_type_id int  NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_user UNIQUE (first_name, last_name, middle_name, address, owner_type_id),
    CONSTRAINT owner_type_id FOREIGN KEY (owner_type_id) REFERENCES owner_type (id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE owner;