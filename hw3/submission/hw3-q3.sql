/*
    rows returned:  327
    query duration: 11s
    first 20 rows:
    origin_city	percentage
    Guam TT	0
    Pago Pago TT	0
    Aguadilla PR	29.43396
    Anchorage AK	32.14604
    San Juan PR	33.89036
    Charlotte Amalie VI	40
    Ponce PR	41.93548
    Fairbanks AK	50.69125
    Kahului HI	53.665
    Honolulu HI	54.90881
    San Francisco CA	56.30766
    Los Angeles CA	56.60411
    Seattle WA	57.75542
    Long Beach CA	62.45412
    Kona HI	63.28211
    New York NY	63.48152
    Las Vegas NV	65.16301
    Christiansted VI	65.33333
    Newark NJ	67.13735
    Worcester MA	67.74194
*/
SELECT F.origin_city AS origin_city, CAST((SELECT COUNT(PUnder.actual_time)
                                      FROM Flights AS PUnder
                                      WHERE PUnder.origin_city = F.origin_city
                                            AND PUnder.actual_time < 180
                                      ) AS REAL) / COUNT(*) * 100 AS percentage
FROM Flights AS F
GROUP BY F.origin_city
ORDER BY percentage ASC;