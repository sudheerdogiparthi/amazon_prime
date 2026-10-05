create database amazon_prime;
use amazon_prime;
SHOW databases;
select count(*) from titles;

select * from titles
limit 10;

select * from credits
limit 10;

-- Check duplicate title IDs
select id,count(*) as duplicate_columns
from titles
group by id
having count(*)>1;

-- Check missing title names
select count(*) as missing_titles
from titles
where title is null or trim(title)= '';

-- Movies vs TV Shows
select type,count(*) as total_titles
from titles
group by type;

-- Average IMDb score
select round(avg(imdb_score),2) as average_imdb_score
from titles;

-- Average Runtime
select round(avg(runtime),2) as average_runtime
from titles;

-- Minimum and maximum IMDb score
select min(imdb_score) as minimum_score,
max(imdb_score) as maximum_score
from titles;

-- Average IMDb by type
select type,count(*) as total_titles,round(avg(imdb_score),2) as average_imdb_score
from titles
group by type;

-- Average runtime by type
select type,count(*) as total_titles,round(avg(runtime),2) as average_runtime
from titles
group by type;

-- Content by year
select release_year,count(*) as total_titles
from titles
group by release_year
order by release_year;

-- Top 10 years by number of titles
select release_year,count(*) as total_titles
from titles
group by release_year
order by total_titles desc
limit 10;

-- Top 10 highest-rated titles
select title,type,release_year,imdb_score,imdb_votes
from titles
where imdb_score is not null
order by imdb_score desc
limit 10;

-- Most Popular Titles
select title,type,tmdb_popularity,tmdb_score
from titles
where tmdb_popularity is not null
order by tmdb_popularity desc
limit 10;

-- Age Certification Analysis
select age_certification,count(*) as total_titles
from titles
group by age_certification
order by total_titles desc;

-- Longest Runtime
select title,type,runtime
from titles
where runtime is not null
order by runtime desc
limit 10;

-- shortest Runtime
select title,type,runtime
from titles
where runtime is not null
order by runtime asc
limit 10;

-- Actors vs Directors
select role,count(*) as total_credits
from credits
group by role
order by total_credits desc;

-- Top 10 Actors
select name,count(*) as total_credits
from credits
where role='ACTOR'
group by name
order by total_credits desc
limit 10;

-- Top 10 Directors
select name,count(*) as total_credits
from credits
where role='DIRECTOR'
group by name
order by total_credits desc
limit 10;

-- Titles with actors/directors
select t.id,t.title,t.type,c.name,c.role
from titles as t
join credits as c
on t.id=c.id
limit 20;

-- Number of credits per title
select t.title,count(c.person_id) as total_credits
from titles as t
join credits as c
on t.id=c.id
group by t.id,t.title
order by total_credits desc
limit 10;

-- Top Actors With Their Titles
SELECT c.name AS actor,COUNT(DISTINCT t.id) AS total_titles
FROM credits AS c
JOIN titles AS t
ON c.id = t.id
WHERE c.role = 'ACTOR'
GROUP BY c.name
ORDER BY total_titles DESC
LIMIT 10;

-- Directors and Their Titles
SELECT c.name AS actor,COUNT(DISTINCT t.id) AS total_titles
FROM credits AS c
JOIN titles AS t
ON c.id = t.id
WHERE c.role = 'DIRECTOR'
GROUP BY c.name
ORDER BY total_titles DESC
LIMIT 10;

-- Average IMDb Score by Director
SELECT c.name AS director,COUNT(DISTINCT t.id) AS total_titles,ROUND(AVG(t.imdb_score), 2) AS average_imdb_score
FROM credits AS c
JOIN titles AS t
ON c.id = t.id
WHERE c.role = 'DIRECTOR'
AND t.imdb_score IS NOT NULL
GROUP BY c.name
HAVING COUNT(DISTINCT t.id) >= 3
ORDER BY average_imdb_score DESC
LIMIT 10;

-- Case Statement
select title,imdb_score,case
when imdb_score>=8 then 'excellent'
when imdb_score>=6 then 'good'
when imdb_score>=4 then 'average'
else 'low'
end as rating_category
from titles
where imdb_score is not null;

SELECT
    CASE
        WHEN imdb_score >= 8 THEN 'Excellent'
        WHEN imdb_score >= 6 THEN 'Good'
        WHEN imdb_score >= 4 THEN 'Average'
        ELSE 'Low'
    END AS rating_category,
    COUNT(*) AS total_titles
FROM titles
WHERE imdb_score IS NOT NULL
GROUP BY rating_category
ORDER BY total_titles DESC;

-- Find titles with an IMDb score above the overall average
SELECT title,type,imdb_score
FROM titles
WHERE imdb_score >(SELECT AVG(imdb_score)FROM titles)
ORDER BY imdb_score DESC;

WITH title_stats AS (
    SELECT
        type,
        COUNT(*) AS total_titles,
        ROUND(AVG(imdb_score), 2) AS avg_score,
        ROUND(AVG(runtime), 2) AS avg_runtime
    FROM titles
    GROUP BY type
)
SELECT *
FROM title_stats;

-- Rank titles by IMDb score
SELECT
    title,
    type,
    imdb_score,
    RANK() OVER (
        ORDER BY imdb_score DESC
    ) AS imdb_rank
FROM titles
WHERE imdb_score IS NOT NULL;

-- Top 10 using the ranking
WITH ranked_titles AS (
    SELECT
        title,
        type,
        imdb_score,
        RANK() OVER (
            ORDER BY imdb_score DESC
        ) AS imdb_rank
    FROM titles
    WHERE imdb_score IS NOT NULL
)
SELECT *
FROM ranked_titles
WHERE imdb_rank <= 10;

-- Rank Within Movie/Show
SELECT
    title,
    type,
    imdb_score,
    RANK() OVER (
        PARTITION BY type
        ORDER BY imdb_score DESC
    ) AS type_rank
FROM titles
WHERE imdb_score IS NOT NULL;

-- Year-over-Year Content Analysis
WITH yearly_content AS (
    SELECT
        release_year,
        COUNT(*) AS total_titles
    FROM titles
    GROUP BY release_year
)
SELECT
    release_year,
    total_titles,
    LAG(total_titles) OVER (
        ORDER BY release_year
    ) AS previous_year
FROM yearly_content
ORDER BY release_year;

SELECT
    c.name AS director,
    COUNT(DISTINCT t.id) AS total_titles,
    ROUND(AVG(t.imdb_score), 2) AS avg_imdb_score
FROM credits c
JOIN titles t
    ON c.id = t.id
WHERE c.role = 'DIRECTOR'
  AND t.imdb_score IS NOT NULL
GROUP BY c.name
HAVING COUNT(DISTINCT t.id) >= 5
   AND AVG(t.imdb_score) > 7
ORDER BY avg_imdb_score DESC;