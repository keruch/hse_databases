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
    CONSTRAINT traffic_police_id FOREIGN KEY (id) REFERENCES traffic_police ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT owner_id FOREIGN KEY (id) REFERENCES owner ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT vehicle_id FOREIGN KEY (id) REFERENCES vehicle ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TABLE document;