-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE vehicle
(
    id       int GENERATED ALWAYS AS IDENTITY,
    color    text,
    type_id  int,
    model_id int,
    PRIMARY KEY (id),
    CONSTRAINT type_id FOREIGN KEY (type_id) REFERENCES vehicle_type (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT model_id FOREIGN KEY (model_id) REFERENCES vehicle_model (id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE vehicle;