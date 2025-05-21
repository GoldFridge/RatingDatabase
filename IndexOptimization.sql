CREATE INDEX idx_users_points ON users(points DESC);
CREATE INDEX idx_users_city ON users(city);
CREATE INDEX idx_friends_user_id ON friends(user_id);
CREATE INDEX idx_friends_friend_id ON friends(friend_id);
