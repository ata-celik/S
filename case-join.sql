-- Setting up the home team CTE
WITH home AS (
    SELECT
        m.id,
        t.team_long_name,
        CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
             WHEN m.home_goal < m.away_goal THEN 'MU Loss'
             ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id),
-- Setting up the away team CTE
away AS (
    SELECT
        m.id,
        t.team_long_name,
        CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
             WHEN m.home_goal < m.away_goal THEN 'MU Loss'
             ELSE 'Tie' END AS outcome
    FROM match AS m
    LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id)
-- Selecting team names, the date and goals
SELECT DISTINCT
    date,
    home.team_long_name AS home_team,
    away.team_long_name AS away_team,
    m.home_goal,
    m.away_goal
-- Joining the CTEs onto the match table
FROM match AS m
LEFT JOIN home
ON m.id = home.id
LEFT JOIN away
ON m.id = away.id
WHERE m.season = '2014/2015'
    AND (home.team_long_name = 'Manchester United'
         OR away.team_long_name = 'Manchester United');
