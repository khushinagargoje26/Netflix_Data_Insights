SELECT * FROM netflix_analysis.show_reviews;
 -- Shows That Were Watched Without Reviews
-- Question: Find shows that have been watched but have no reviews.

SELECT DISTINCT s.title
FROM Shows s
JOIN Viewing_History vh ON s.show_id = vh.show_id
LEFT JOIN Show_Reviews sr ON s.show_id = sr.show_id
WHERE sr.review_id IS NULL;
