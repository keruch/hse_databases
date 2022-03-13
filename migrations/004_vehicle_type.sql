-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TYPE vehicle_type AS ENUM ('sedan', 'coupe', 'crossover', 'universal', 'bus', 'truck');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TYPE vehicle_type;