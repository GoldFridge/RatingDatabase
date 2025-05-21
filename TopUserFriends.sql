SELECT 
    u.id,
    u.username,
    u.points
FROM friends f
JOIN users u ON u.id = f.friend_id
WHERE f.user_id = (SELECT id FROM users WHERE username = 'user123')
ORDER BY u.points DESC
LIMIT 100;
