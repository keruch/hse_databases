-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

SELECT insert_owner('Kirill', 'Verendeev', 'Dmitrievish', 'Odintsovo', 'physical');
SELECT insert_owner('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 'physical');
SELECT insert_owner('Nikita', 'Vinnikov', 'Pavlovich', 'Rublev', 'physical');
SELECT insert_owner('Pavel', 'Ivanov', 'Dmitrievish', 'Moscow', 'entity');
SELECT insert_owner('Marat', 'Nurgaleev', 'Rustamovich', 'Cheboksary', 'entity');

SELECT insert_vehicle('blue', 'kia', 'truck');
SELECT insert_vehicle('red', 'audi', 'bus');
SELECT insert_vehicle('black', 'mercedes', 'crossover');
SELECT insert_vehicle('white', 'bmw', 'sedan');

SELECT insert_traffic_police('Moscow, Tallinskaya 34');
SELECT insert_traffic_police('Odintsovo, Makovskogo 2');
SELECT insert_traffic_police('Samara, 7 prosek 228');
SELECT insert_traffic_police('Cheboksary, Moscow district 19');


CALL register_vehicle('Kirill', 'Verendeev', 'Dmitrievish', 'Odintsovo', 'physical',
                      'blue', 'gaz', 'truck',
                      'Moscow, Tallinskaya 34',
                      'a228og', '15-May-2001');
CALL register_vehicle('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 'physical',
                      'red', 'audi', 'bus',
                      'Samara, 7 prosek 228',
                      'i752ly', '08-Jan-2022');
CALL register_vehicle('Rustam', 'Nurgaleev', 'Ferdousovich', 'Cheboksary', 'entity',
                      'white', 'mercedes', 'crossover',
                      'Cheboksary, Kalinin 45',
                      'o541af', '06-Feb-2017');
CALL register_vehicle('Anna', 'Tolmacheva', 'Vladimirovna', 'Samara', 'physical',
                      'blue', 'gaz', 'truck',
                      'Moscow, Tallinskaya 34',
                      'j632lq', '21-Sep-2018');

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
TRUNCATE TABLE document, owner, traffic_police, vehicle CASCADE;
