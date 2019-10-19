/*
    rows returned:  3
    query duration: 11s -> Hope I'm doing this right.. I believe.  Such little time?!
    first "20" rows:       Hehe there are only 3 since dest_city < origin_city by 1
    city
    Devils Lake ND
    Hattiesburg/Laurel MS
    St. Augustine FL
*/
SELECT AllDest.dest_city AS city
FROM (SELECT DISTINCT AllFlights.dest_city /* We'll consider dest_city as ALL cities */
      FROM Flights AS AllFlights
      WHERE AllFlights.dest_city NOT IN
        (SELECT DISTINCT F0.dest_city
         FROM Flights AS F0
         WHERE F0.origin_city = 'Seattle WA')) AS AllDest
WHERE AllDest.dest_city != 'Seattle WA'
    AND AllDest.dest_city NOT IN 
        (SELECT OneStopDest.dest_city
         FROM (SELECT DISTINCT F1.dest_city
               FROM Flights AS F1, (SELECT DISTINCT F0.dest_city
                                    FROM Flights AS F0
                                    WHERE F0.origin_city = 'Seattle WA') AS SeaDest
               WHERE F1.origin_city = SeaDest.dest_city) AS OneStopDest
         WHERE OneStopDest.dest_city NOT IN (SELECT DISTINCT F0.dest_city
                                             FROM Flights AS F0
                                             WHERE F0.origin_city = 'Seattle WA'))
ORDER BY AllDest.dest_city ASC;