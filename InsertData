INSERT INTO users (username, city, points)
SELECT 
    'user_' || g,
    (ARRAY['Москва', 'Лондон', 'Нью-Йорк'])[1 + random() * 2],
    (random() * 1000000)::INT
FROM generate_series(1, 10000000) AS g;

DO $$
DECLARE
    u RECORD;
    num_friends INTEGER;
    friend_ids INTEGER[];
    friend_id INTEGER;
BEGIN
    FOR u IN SELECT id FROM users LOOP
        num_friends := 1 + (random() * 19)::INT;
        friend_ids := ARRAY(
            SELECT id FROM users 
            WHERE id <> u.id 
            ORDER BY random() 
            LIMIT num_friends
        );
        FOREACH friend_id IN ARRAY friend_ids LOOP
            BEGIN
                INSERT INTO friends (user_id, friend_id) VALUES (u.id, friend_id)
                ON CONFLICT DO NOTHING;
            EXCEPTION WHEN OTHERS THEN CONTINUE;
            END;
        END LOOP;
    END LOOP;
END $$;
