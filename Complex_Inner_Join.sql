-- This query retrieves all bookings for facilities containing the name "Tennis Court"
-- on September 21st, sorted by their start time. It joins the facilities and bookings
-- tables on their shared facility ID and uses a case-insensitive search for facility names.
SELECT starttime, name
FROM cd.facilities AS f
INNER JOIN cd.bookings AS b
  ON f.facid = b.facid
WHERE EXTRACT(MONTH FROM starttime) = 9
  AND EXTRACT(DAY FROM starttime) = 21
  AND name ILIKE ('%Tennis Court%')
ORDER BY starttime;