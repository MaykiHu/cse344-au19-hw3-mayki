/*
    rows returned:  4
    query duration: 0s      Yay!!  :D  So fast.  ^u^
    first "20" rows:        Jk there are only 4
    carrier
    Alaska Airlines Inc.
    SkyWest Airlines Inc.
    United Air Lines Inc.
    Virgin America
*/
SELECT C.name AS carrier
FROM Flights AS F, Carriers AS C
WHERE F.carrier_id = C.cid
      AND F.origin_city = 'Seattle WA'
      AND F.dest_city = 'San Francisco CA'
GROUP BY C.name
ORDER BY C.name ASC;