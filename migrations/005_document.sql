-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TABLE document
(
    id                int GENERATED ALWAYS AS IDENTITY,
    traffic_police_id int,
    owner_id          int                     NOT NULL,
    vehicle_id        int UNIQUE              NOT NULL,
    car_number        text UNIQUE             NOT NULL,
    date              timestamp DEFAULT now() NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT traffic_police_id FOREIGN KEY (traffic_police_id) REFERENCES traffic_police (id) ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES owner (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT vehicle_id FOREIGN KEY (vehicle_id) REFERENCES vehicle (id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE document;