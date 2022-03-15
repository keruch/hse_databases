-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- CREATE TYPE owner_type AS ENUM ('physical', 'entity');
-- CREATE TYPE vehicle_model AS ENUM ('kia', 'audi', 'mercedes', 'bmw', 'gaz');
-- CREATE TYPE vehicle_type AS ENUM ('sedan', 'coupe', 'crossover', 'universal', 'bus', 'truck');

INSERT INTO owner_type(type) VALUES ('physical'), ('entity');
INSERT INTO vehicle_model(model) VALUES ('kia'), ('audi'), ('mercedes'), ('bmw'), ('gaz');
INSERT INTO vehicle_type(type) VALUES ('sedan'), ('coupe'), ('crossover'), ('universal'), ('bus'), ('truck');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back