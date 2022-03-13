-- 1
SELECT vehicle_id
FROM document
WHERE extract(year from date) = 2001;

-- 2
SELECT owner_id
FROM document d
         JOIN vehicle v ON d.vehicle_id = v.id
WHERE model = 'audi';

--3
SELECT id
FROM (SELECT d.id, type, color
      FROM document d
               JOIN vehicle v ON d.vehicle_id = v.id) AS a
         CROSS JOIN
     (SELECT color, type
      FROM document d
               JOIN vehicle v ON d.vehicle_id = v.id
      WHERE owner_id = 46) AS b
WHERE a.color = b.color
  AND a.type = b.type;