SELECT * FROM netflix_analysis.shows;
-- Viewer Ratings Correlation with Subscription Type
-- Question: Analyze if there is any correlation between the average ratings given by viewers and their subscription type.

SELECT v.subscription_type, AVG(vh.rating) AS average_rating
FROM viewing_history vh
JOIN Viewers v ON vh.viewer_id = v.viewer_id
GROUP BY v.subscription_type
ORDER BY v.subscription_type;
