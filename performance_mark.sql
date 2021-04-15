SELECT
  markname,
  COUNT(*) AS count
FROM
  `httparchive.almanac.summary_response_bodies`,
  UNNEST(REGEXP_EXTRACT_ALL(body, r'performance\.mark\([\'\"]([^\"^\']*)[\'\"]\)')) AS markname
WHERE
  type IN ('html', 'script')
GROUP BY markname
ORDER BY count DESC
