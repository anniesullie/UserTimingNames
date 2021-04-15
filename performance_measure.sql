SELECT
  measurename,
  COUNT(*) AS count
FROM
  `httparchive.almanac.summary_response_bodies`,
  UNNEST(REGEXP_EXTRACT_ALL(body, r'performance\.measure\([\'\"]([^\"^\']*)[\'\"].*\)')) AS measurename
WHERE
  type IN ('html', 'script')
GROUP BY measurename
ORDER BY count DESC
