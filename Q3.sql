-- 2. Viewers Who Watched Shows with All Available Parental Guidelines
-- Question: Find viewers who have watched shows with all available parental guidelines (e.g., 'PG', 'R')

SELECT v.subscription_type, s.title, COUNT(vh.show_id) AS watch_count
FROM Viewers v
JOIN Viewing_History vh ON v.viewer_id = vh.viewer_id
JOIN Shows s ON vh.show_id = s.show_id
GROUP BY v.subscription_type, s.title;

-- Step 2: Find the maximum watch count for each subscription type
SELECT subscription_type, MAX(watch_count) AS max_watch_count
FROM (
    SELECT v.subscription_type, s.title, COUNT(vh.show_id) AS watch_count
    FROM Viewers v
    JOIN Viewing_History vh ON v.viewer_id = vh.viewer_id
    JOIN Shows s ON vh.show_id = s.show_id
    GROUP BY v.subscription_type, s.title
) AS subquery
GROUP BY subscription_type;

-- Step 3: Combine results to get the most frequently watched show for each subscription type
SELECT swc.subscription_type, swc.title, swc.watch_count
FROM (
    SELECT v.subscription_type, s.title, COUNT(vh.show_id) AS watch_count
    FROM Viewers v
    JOIN Viewing_History vh ON v.viewer_id = vh.viewer_id
    JOIN Shows s ON vh.show_id = s.show_id
    GROUP BY v.subscription_type, s.title
) AS swc
JOIN (
    SELECT subscription_type, MAX(watch_count) AS max_watch_count
    FROM (
        SELECT v.subscription_type, s.title, COUNT(vh.show_id) AS watch_count
        FROM Viewers v
        JOIN Viewing_History vh ON v.viewer_id = vh.viewer_id
        JOIN Shows s ON vh.show_id = s.show_id
        GROUP BY v.subscription_type, s.title
    ) AS subquery
    GROUP BY subscription_type
) AS mwc
ON swc.subscription_type = mwc.subscription_type
AND swc.watch_count = mwc.max_watch_count
ORDER BY swc.subscription_type, swc.watch_count DESC;
