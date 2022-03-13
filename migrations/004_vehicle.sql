-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE vehicle
(
    id    int GENERATED ALWAYS AS IDENTITY,
    color text,
    type  vehicle_type,
    model vehicle_model,
    PRIMARY KEY (id)
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE vehicle;