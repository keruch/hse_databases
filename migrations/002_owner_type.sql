-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE TYPE owner_type AS ENUM ('physical', 'entity');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP TYPE owner_type;