/* Creates a view of just Ozone readings in the US */

CREATE OR REPLACE VIEW v_O3_US AS 
SELECT
  "city"
, "coordinates"."latitude" "latitude"
, "coordinates"."longitude" "longitude"
, CAST("from_iso8601_timestamp"("date"."local") AS timestamp) "timestamp"
, "value"
, "unit"
FROM
  "air_quality"
WHERE (("parameter" = 'o3') AND ("country" = 'US'));