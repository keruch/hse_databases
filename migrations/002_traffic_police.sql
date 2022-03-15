-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE traffic_police
(
    id      int GENERATED ALWAYS AS IDENTITY,
    address text UNIQUE NOT NULL,
    PRIMARY KEY (id)
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE traffic_police;