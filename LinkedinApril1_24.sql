select * from driver_ratings

INSERT into driver_ratings(driver_id,avg_rating)VALUES
('100','4'),
('101','5'),
('102','3'),
('103','4.5'),
('104','4.3'),
('105','2');


--write SQL query to categorize drivers equally into three performance tiers--
--Top,Middle,Bottom--Based on average ratings--

SELECT DRIVER_ID,AVG_RATING,(
CASE 
WHEN DIVISION=1 THEN 'Top'
WHEN DIVISION=2 THEN 'Middle'
WHEN DIVISION=3 THEN 'Bottom' 
END) AS performance_tier
FROM
(
SELECT *,
	NTILE(3)OVER (ORDER BY avg_rating DESC)AS DIVISION
	FROM driver_ratings
)
