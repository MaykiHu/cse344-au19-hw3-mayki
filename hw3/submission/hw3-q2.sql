/*
    rows returned:  109
    query duration: 10s
    first 20 rows:
    city
    Aberdeen SD
    Abilene TX
    Alpena MI
    Ashland WV
    Augusta GA
    Barrow AK
    Beaumont/Port Arthur TX
    Bemidji MN
    Bethel AK
    Binghamton NY
    Brainerd MN
    Bristol/Johnson City/Kingsport TN
    Butte MT
    Carlsbad CA
    Casper WY
    Cedar City UT
    Chico CA
    College Station/Bryan TX
    Columbia MO
    Columbus GA
*/
SELECT DISTINCT F.origin_city AS city
FROM Flights AS F
GROUP BY F.origin_city
/* req. < 3 hrs, also 180 min = 3 hrs*/
HAVING MAX(F.actual_time) < 180
ORDER BY F.origin_city;