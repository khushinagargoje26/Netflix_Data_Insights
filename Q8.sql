-- Show with the Highest Number of Unique Viewers Per Genre
-- Question: Identify the show with the highest number of unique viewers for each genre.
SELECT s.genre, s.title, COUNT(DISTINCT vh.viewer_id) AS unique_viewers
FROM Shows s
JOIN Viewing_History vh ON s.show_id = vh.show_id
GROUP BY s.genre, s.title
HAVING COUNT(DISTINCT vh.viewer_id) = (
    SELECT MAX(unique_viewers)
    FROM (
        SELECT s.genre, COUNT(DISTINCT vh.viewer_id) AS unique_viewers
        FROM Shows s
        JOIN Viewing_History vh ON s.show_id = vh.show_id
        GROUP BY s.genre, s.title
    ) AS unique_viewers_per_show
    WHERE unique_viewers_per_show.genre = s.genre
)
ORDER BY s.genre, s.title;
