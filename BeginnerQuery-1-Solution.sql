WITH previous_results AS (
	SELECT TrackId,
		count (TrackId) as 'TOPS'
	FROM playlist_track
	GROUP BY 1
	HAVING count(TrackId) > 1
)
SELECT TrackId, 
	TOPS
FROM previous_results
WHERE TOPS = (SELECT MAX(TOPS) FROM previous_results)