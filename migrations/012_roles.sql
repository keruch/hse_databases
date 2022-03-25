-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE ROLE owners WITH PASSWORD 'owners';
CREATE ROLE policemen WITH PASSWORD 'policemen';
CREATE ROLE ministry WITH PASSWORD 'ministry';

GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE ON owner TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE ON document TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE ON traffic_police TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE ON vehicle TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE, TRIGGER ON vehicle_model TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE, TRIGGER ON vehicle_type TO ministry;
GRANT TRUNCATE, SELECT, INSERT, DELETE, UPDATE, TRIGGER ON owner_type TO ministry;

GRANT SELECT, INSERT, DELETE, UPDATE ON owner TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE ON document TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE ON traffic_police TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE ON vehicle TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE, TRIGGER ON vehicle_model TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE, TRIGGER ON vehicle_type TO policemen;
GRANT SELECT, INSERT, DELETE, UPDATE, TRIGGER ON owner_type TO policemen;

GRANT SELECT ON owner TO owners;
GRANT SELECT ON document TO owners;
GRANT SELECT ON traffic_police TO owners;
GRANT SELECT ON vehicle TO owners;
GRANT SELECT ON vehicle_model TO owners;
GRANT SELECT ON vehicle_type TO owners;
GRANT SELECT ON owner_type TO owners;

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
REVOKE ALL PRIVILEGES ON owner FROM ministry;
REVOKE ALL PRIVILEGES ON document FROM ministry;
REVOKE ALL PRIVILEGES ON traffic_police FROM ministry;
REVOKE ALL PRIVILEGES ON vehicle FROM ministry;
REVOKE ALL PRIVILEGES ON vehicle_model FROM ministry;
REVOKE ALL PRIVILEGES ON vehicle_type FROM ministry;
REVOKE ALL PRIVILEGES ON owner_type FROM ministry;

REVOKE ALL PRIVILEGES ON owner FROM policemen;
REVOKE ALL PRIVILEGES ON document FROM policemen;
REVOKE ALL PRIVILEGES ON traffic_police FROM policemen;
REVOKE ALL PRIVILEGES ON vehicle FROM policemen;
REVOKE ALL PRIVILEGES ON vehicle_model FROM policemen;
REVOKE ALL PRIVILEGES ON vehicle_type FROM policemen;
REVOKE ALL PRIVILEGES ON owner_type FROM policemen;

REVOKE ALL PRIVILEGES ON owner FROM owners;
REVOKE ALL PRIVILEGES ON document FROM owners;
REVOKE ALL PRIVILEGES ON traffic_police FROM owners;
REVOKE ALL PRIVILEGES ON vehicle FROM owners;
REVOKE ALL PRIVILEGES ON vehicle_model FROM owners;
REVOKE ALL PRIVILEGES ON vehicle_type FROM owners;
REVOKE ALL PRIVILEGES ON owner_type FROM owners;

DROP ROLE owners;
DROP ROLE policemen;
DROP ROLE ministry;

