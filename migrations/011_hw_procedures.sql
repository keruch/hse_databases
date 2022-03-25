-- +migrate Up
-- SQL in section 'Up' is executed when this migration is applied

-- +migrate StatementBegin
-- 1
CREATE FUNCTION query_1(i_year int)
    RETURNS TABLE
            (
                vehicle_id int
            )
AS
$$
SELECT vehicle_id
FROM document
WHERE extract(year from date) = i_year;
$$ LANGUAGE sql;


-- 2
CREATE FUNCTION query_2(i_model_id int)
    RETURNS TABLE
            (
                owner_id int
            )
AS
$$
SELECT owner_id
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
WHERE model_id = i_model_id;
$$ LANGUAGE sql;


-- 3
CREATE FUNCTION query_3(i_owner_id int)
    RETURNS TABLE
            (
                id int
            )
AS
$$
SELECT id
FROM (SELECT d.id, type_id, color
      FROM document d
               JOIN vehicle v ON d.vehicle_id = v.id) AS a
         CROSS JOIN
     (SELECT color, type_id
      FROM document d
               JOIN vehicle v ON d.vehicle_id = v.id
      WHERE owner_id = i_owner_id) AS b
WHERE a.color = b.color
  AND a.type_id = b.type_id;
$$ LANGUAGE sql;


-- 4
CREATE FUNCTION query_4(i_owner_id int, i_year int)
    RETURNS TABLE
            (
                model_id   int,
                car_number text
            )
AS
$$
SELECT model_id, car_number
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
WHERE owner_id = i_owner_id
  AND extract(year from date) <= i_year;
$$ LANGUAGE sql;

-- 5
CREATE FUNCTION query_5(i_traffic_police_id int, i_year int)
    RETURNS TABLE
            (
                last_name   text,
                first_name  text,
                middle_name text,
                model_id    int,
                car_number  text
            )
AS
$$
SELECT o.last_name, o.first_name, o.middle_name, v.model_id, car_number
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
         JOIN owner o on o.id = d.owner_id
WHERE traffic_police_id = i_traffic_police_id
  AND extract(year from date) > i_year;
$$ LANGUAGE sql;

-- 6
CREATE FUNCTION query_6(i_owner_id int)
    RETURNS TABLE
            (
                address text
            )
AS
$$
SELECT address
FROM (SELECT d.traffic_police_id, date
      FROM document d
               JOIN traffic_police tp on d.traffic_police_id = tp.id
      WHERE d.owner_id = i_owner_id) AS a
         CROSS JOIN
     (SELECT o.address, d.traffic_police_id, date
      FROM document d
               JOIN owner o ON d.vehicle_id = o.id) AS b
WHERE a.traffic_police_id = b.traffic_police_id
  AND extract(year from a.date) = extract(year from b.date);
$$ LANGUAGE sql;

-- 7
CREATE VIEW query_7 AS
SELECT v.type_id, COUNT(v.type_id)
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
GROUP BY v.type_id;

-- 8
CREATE VIEW query_8 AS
SELECT v.type_id, COUNT(v.type_id)
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
WHERE date > 'now'::timestamp - '6 month'::interval
GROUP BY v.type_id
ORDER BY v.type_id DESC;
-- +migrate StatementEnd

-- +migrate Down
-- SQL section 'Down' is executed when this migration is rolled back
DROP FUNCTION query_1;
DROP FUNCTION query_2;
DROP FUNCTION query_3;
DROP FUNCTION query_4;
DROP FUNCTION query_5;
DROP FUNCTION query_6;

DROP VIEW query_7;
DROP VIEW query_8;
