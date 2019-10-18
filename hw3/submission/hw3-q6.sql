/*
    rows returned:  4       Hehe did this one after w/out subquery.
    query duration: 0s      Pog- Surprised subquery is still so fast.
    first "20" rows:        Jk there are only 4 >.<
    carrier
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
*/
SELECT DISTINCT C.name AS carrier
FROM Carriers AS C
WHERE EXISTS (SELECT *
              FROM Flights F
              WHERE F.carrier_id = C.cid
              AND F.origin_city = 'Seattle WA'
              AND F.dest_city = 'San Francisco CA'
              )
ORDER BY C.name ASC;