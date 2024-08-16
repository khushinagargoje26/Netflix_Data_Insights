-- 5. Average Rating by Show Genre and Subscription Type
-- Question: Calculate the average rating of shows grouped by genre and subscription type.

-- select shows.genre , viewers.subscription_type , avg(viewing_history.rating) as average_ratings from shows join viewers on shows.show_id = viewing_history.show_id
--  join  viewers on viewing_history.viewer_id= viewers.viewer_id group by shows.genre , viewers.subscription_type 
--  order by average_ratings desc ;
SELECT s.genre, v.subscription_type, AVG(vh.rating) AS average_rating
FROM Viewing_History vh
JOIN Shows s ON vh.show_id = s.show_id
JOIN Viewers v ON vh.viewer_id = v.viewer_id
GROUP BY s.genre, v.subscription_type
ORDER BY  genre , subscription_type desc;
