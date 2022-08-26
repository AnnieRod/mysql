USE twitter;

SELECT * FROM users;

UPDATE twitter.users
SET last_name = "Meyers"
WHERE id = 1;

INSERT INTO twitter.users(first_name, last_name, handle, birthday, created_at, updated_at)
VALUES ("Annie", "Molko", "molkotw", "1990-08-30", NOW(), NOW());

DELETE FROM tweets
WHERE id = 12;

SELECT * FROM tweets

