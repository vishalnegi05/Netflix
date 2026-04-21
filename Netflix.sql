-- Convert date_added to proper date:

SELECT STR_TO_DATE(date_added,"%M %d,%Y") AS clean_date 
	FROM netflix;
    
-- 1. Total Titles

SELECT COUNT(*) AS total_titles 
	FROM netflix;
    
-- 2. Movies vs TV Shows

SELECT type,COUNT(*) AS total 
	FROM netflix
    GROUP BY type;

-- 3. Content added per year

SELECT YEAR(STR_TO_DATE(date_added, "%M %d,%Y")) AS year_added,
		COUNT(*) AS total
        FROM netflix
        GROUP BY 1
        ORDER BY 1;
        
-- 4. Top Countries

SELECT country,COUNT(*) AS total
	FROM netflix 
    GROUP BY 1 
    ORDER BY 2 DESC;
    
-- 5. Most common rating
    
SELECT rating,COUNT(*) AS total 
	FROM netflix 
    GROUP BY 1 
    ORDER BY 2 DESC;
    
-- 6. Movies released after 2015
    
SELECT title,release_year
	FROM netflix 
    WHERE release_year > 2015;
    
-- 7. Top Directors
    
SELECT director,COUNT(*) AS Total
	FROM netflix
    GROUP BY 1 
    ORDER BY 2 DESC;
 
--  8. Movies vs TV Shows by country
    
SELECT country,type,COUNT(*) AS total
		FROM netflix
        GROUP BY 1,2
        ORDER BY 2 DESC;
        
-- 9. Top Genres

SELECT listed_in,COUNT(*) AS total
	FROM netflix
    GROUP BY 1 
    ORDER BY 2 DESC;
 
-- 10. Longest Movie
 
SELECT title,duration 
	FROM netflix 
    WHERE type = 'Movie'
ORDER BY CAST(SUBSTRING_INDEX(duration ," ",1) AS UNSIGNED) DESC
LIMIT 1;
