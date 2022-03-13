-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

CALL register_vehicle('Kirill', 'Verendeev', 'Dmitrievich','Odintsovo', 'physical',
    'blue', 'gaz', 'coupe',
    'Moscow',
    'f228fd', '08-Jan-2022');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back

