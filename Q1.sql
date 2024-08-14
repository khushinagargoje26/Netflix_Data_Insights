SELECT * FROM netflix_analysis.shows;
-- 1. Top 5 Shows with the Highest Average Viewer Rating
-- Question: Identify the top 5 shows based on the highest average rating given by viewers.
-- select title , avg(viewing_history.rating)  as average_rating from shows join viewing_history on shows.show_id=viewing_history.show_id
-- group by title 
-- order by average_rating desc limit 5

or

SELECT s.title, AVG(vh.rating) AS average_rating
FROM Shows s
JOIN Show_Reviews sr ON s.show_id = sr.show_id
JOIN Viewing_History vh ON sr.viewer_id = vh.viewer_id
GROUP BY s.show_id, s.title
ORDER BY average_rating DESC
LIMIT 5;
