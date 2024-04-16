WITH ranked_people AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY visit_date) AS row_num,
           id - ROW_NUMBER() OVER (ORDER BY visit_date) AS id_diff
    FROM visits
    WHERE people >= 100
)
SELECT id, people, visit_date
FROM ranked_people
WHERE people >= 100
GROUP BY id, people, visit_date, id_diff
HAVING COUNT(*) >= 3
ORDER BY visit_date;
