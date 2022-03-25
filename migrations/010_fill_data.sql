-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

SELECT insert_owner('Kirill', 'Verendeev', 'Dmitrievish', 'Odintsovo', 1);
SELECT insert_owner('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 1);
SELECT insert_owner('Nikita', 'Vinnikov', 'Pavlovich', 'Rublev', 1);
SELECT insert_owner('Pavel', 'Ivanov', 'Dmitrievish', 'Moscow', 2);
SELECT insert_owner('Marat', 'Nurgaleev', 'Rustamovich', 'Cheboksary', 2);

SELECT insert_vehicle('blue', 1, 6);
SELECT insert_vehicle('red', 2, 5);
SELECT insert_vehicle('black', 3, 3);
SELECT insert_vehicle('white', 4, 1);

SELECT insert_traffic_police('Moscow, Tallinskaya 34');
SELECT insert_traffic_police('Odintsovo, Makovskogo 2');
SELECT insert_traffic_police('Samara, 7 prosek 228');
SELECT insert_traffic_police('Cheboksary, Moscow district 19');


CALL register_vehicle('Kirill', 'Verendeev', 'Dmitrievish', 'Odintsovo', 1,
                      'blue', 5, 6,
                      'Moscow, Tallinskaya 34',
                      'a228og', '15-May-2001');
CALL register_vehicle('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 1,
                      'red', 2, 5,
                      'Samara, 7 prosek 228',
                      'i752ly', '08-Jan-2022');
CALL register_vehicle('Rustam', 'Nurgaleev', 'Ferdousovich', 'Cheboksary', 2,
                      'white', 3, 3,
                      'Cheboksary, Kalinin 45',
                      'o541af', '06-Feb-2017');
CALL register_vehicle('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 1,
                      'blue', 5, 6,
                      'Moscow, Tallinskaya 34',
                      'j632lq', '21-Sep-2018');
CALL register_vehicle('Zhanna', 'Tolmacheva', 'Dmitrievna', 'Samara', 1,
                      'grew', 4, 2,
                      'Moscow, Tallinskaya 34',
                      'a125ot', '21-Sep-2018');

CALL register_vehicle('Vladimir', 'Olyakin', 'Ferdousovich', 'Odintsovo', 2,
                      'yellow', 1, 2,
                      'Samara, 7 prosek 228',
                      'f412eg', '21-Feb-2022');

CALL register_vehicle('Vladimir', 'Olyakin', 'Ferdousovich', 'Odintsovo', 2,
                      'pink', 2, 2,
                      'Samara, 7 prosek 228',
                      'j752pg', '21-Jan-2022');

CALL register_vehicle('Vladimir', 'Olyakin', 'Ferdousovich', 'Odintsovo', 2,
                      'black', 3, 2,
                      'Samara, 7 prosek 228',
                      'l642af', '21-Jan-2022');

CALL register_vehicle('Vladimir', 'Olyakin', 'Ferdousovich', 'Odintsovo', 2,
                      'white', 1, 3,
                      'Samara, 7 prosek 228',
                      'p432as', '18-Jan-2022');

CALL register_vehicle('Vladimir', 'Olyakin', 'Ferdousovich', 'Odintsovo', 2,
                      'white', 2, 3,
                      'Samara, 7 prosek 228',
                      'g983fd', '18-Jan-2022');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
TRUNCATE TABLE document, owner, traffic_police, vehicle CASCADE;
