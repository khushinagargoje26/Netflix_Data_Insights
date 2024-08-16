
-- Calculate the average number of hours watched per viewer, broken down by subscription type.
SELECT v.subscription_type, AVG(vh.hours_watched) AS average_hours_watched
FROM Viewers v
JOIN Viewing_History vh ON v.viewer_id = vh.viewer_id
GROUP BY v.subscription_type;
