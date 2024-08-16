SELECT * FROM netflix_analysis.viewing_history;
-- Shows Watched by the Most Active Viewer
-- Question: List all shows watched by the viewer who has watched the most shows.
SELECT s.title
FROM Shows s
JOIN Viewing_History vh ON s.show_id = vh.show_id
WHERE vh.viewer_id = (
    SELECT viewer_id
    FROM Viewing_History
    GROUP BY viewer_id
    ORDER BY COUNT(show_id) DESC
    LIMIT 1
);
