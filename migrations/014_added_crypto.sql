-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE VIEW owners_view AS
SELECT d.id, tp.address
FROM document d
         JOIN traffic_police tp on tp.id = d.traffic_police_id;

GRANT SELECT ON owners_view TO owners;

CREATE VIEW government_view AS
SELECT d.id, o.last_name, o.first_name, o.middle_name, o.address, d.car_number, tp.address AS tp_address
FROM document d
         JOIN traffic_police tp on tp.id = d.traffic_police_id
         JOIN owner o on o.id = d.owner_id
         JOIN vehicle v on v.id = d.vehicle_id;

GRANT SELECT ON government_view TO ministry;
GRANT SELECT ON government_view TO policemen;


-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
REVOKE ALL PRIVILEGES ON owners_view FROM owners;
REVOKE ALL PRIVILEGES ON government_view FROM ministry;
REVOKE ALL PRIVILEGES ON government_view FROM policemen;

DROP VIEW owners_view;
DROP VIEW government_view;
