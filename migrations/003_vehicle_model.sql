-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TYPE vehicle_model AS ENUM ('kia', 'audi', 'mercedes', 'bmw', 'gaz');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TYPE vehicle_model;