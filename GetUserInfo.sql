WITH ranked_users AS (
    SELECT 
        id,
        username,
        city,
        points,
        RANK() OVER (ORDER BY points DESC) AS global_rank,
        RANK() OVER (PARTITION BY city ORDER BY points DESC) AS city_rank
    FROM users
),
user_data AS (
    SELECT * FROM ranked_users WHERE username = 'username'
),
friends_ranks AS (
    SELECT 
        f.friend_id,
        u.points,
        RANK() OVER (ORDER BY u.points DESC) AS friend_rank
    FROM friends f
    JOIN users u ON f.friend_id = u.id
    WHERE f.user_id = (SELECT id FROM user_data)
)
SELECT 
    u.username,
    u.points,
    u.global_rank,
    u.city_rank,
    (SELECT friend_rank FROM friends_ranks WHERE friend_id = u.id) AS friend_rank
FROM user_data u;
