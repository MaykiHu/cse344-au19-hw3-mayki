/*
    rows returned:  256
    query duration: 6s
    first 20 rows:
    city
    Aberdeen SD
    Abilene TX
    Adak Island AK
    Aguadilla PR
    Akron OH
    Albany GA
    Albany NY
    Alexandria LA
    Allentown/Bethlehem/Easton PA
    Alpena MI
    Amarillo TX
    Appleton WI
    Arcata/Eureka CA
    Asheville NC
    Ashland WV
    Aspen CO
    Atlantic City NJ
    Augusta GA
    Bakersfield CA
    Bangor ME
*/
SELECT AllDest.dest_city AS city
FROM (SELECT DISTINCT F1.dest_city
      FROM Flights AS F1, (SELECT DISTINCT F0.dest_city
                          FROM Flights AS F0
                          WHERE F0.origin_city = 'Seattle WA') AS SeaDest
      WHERE F1.origin_city = SeaDest.dest_city) AS AllDest
WHERE AllDest.dest_city NOT IN 
    (SELECT DISTINCT F0.dest_city
     FROM Flights as F0
     WHERE F0.origin_city = 'Seattle WA')
     AND AllDest.dest_city != 'Seattle WA'
ORDER BY AllDest.dest_city ASC;