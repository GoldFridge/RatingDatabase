SELECT 
    id,
    username,
    points
FROM users
WHERE city = 'Москва'
ORDER BY points DESC
LIMIT 100;
