-- 1
SELECT *
FROM query_1(1998);
SELECT *
FROM query_1(2001);
SELECT *
FROM query_1(2018);

-- 2
SELECT *
FROM query_2(6);
SELECT *
FROM query_2(2);
SELECT *
FROM query_2(5);

--3
SELECT *
FROM query_3(10);
SELECT *
FROM query_3(21);
SELECT *
FROM query_3(13);

-- 4
SELECT *
FROM query_4(13, 2001);
SELECT *
FROM query_4(13, 2018);
SELECT *
FROM query_4(13, 2022);

-- 5
SELECT *
FROM query_5(15, 2020);
SELECT *
FROM query_5(15, 2000);
SELECT *
FROM query_5(9, 2001);

-- 6
SELECT *
FROM query_6(10);
SELECT *
FROM query_6(21);
SELECT *
FROM query_6(13);

-- 7
SELECT *
FROM query_7;

-- 8
SELECT *
FROM query_8;

-- roles
SELECT rolname
FROM pg_roles;
SET role owners;
INSERT INTO vehicle_model(model)
VALUES ('new');
SET role policemen;
INSERT INTO vehicle_model(model)
VALUES ('new_model');
SET role postgres;

-- views
SELECT *
FROM owners_view;
SELECT *
FROM government_view;


CREATE EXTENSION IF NOT EXISTS pgcrypto;
SELECT id, first_name, last_name, middle_name, crypt(address, 'passwd')
FROM owner;