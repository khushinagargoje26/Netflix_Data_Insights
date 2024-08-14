-- List the most popular shows based on the number of unique viewers.
SELECT s.title, COUNT(DISTINCT vh.viewer_id) AS unique_viewers
FROM Shows s
JOIN Viewing_History vh ON s.show_id = vh.show_id
GROUP BY s.show_id, s.title
ORDER BY unique_viewers DESC;
