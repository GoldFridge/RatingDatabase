SELECT 
    id,
    username,
    city,
    points,
    RANK() OVER (ORDER BY points DESC) AS global_rank
FROM users;
