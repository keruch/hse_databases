-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TYPE owner_type AS ENUM ('physical', 'entity');
CREATE TYPE vehicle_model AS ENUM ('kia', 'audi', 'mercedes', 'bmw', 'gaz');
CREATE TYPE vehicle_type AS ENUM ('sedan', 'coupe', 'crossover', 'universal', 'bus', 'truck');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TYPE owner_type;
DROP TYPE vehicle_model;
DROP TYPE vehicle_type;