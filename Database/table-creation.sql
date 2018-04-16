
/*This is to use the photoapp database*/
USE pixels;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS votes;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS users;


/*Creates the user table, with 3 columns */
CREATE TABLE users
(
	user_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	mail_id VARCHAR(254) UNIQUE, 
	first_name VARCHAR(20), 
	last_name VARCHAR(20),
	no_of_posts INTEGER DEFAULT 0, 
	is_active BOOLEAN DEFAULT 1
) ENGINE = 'InnoDB';


/*Creates the topic table*/
CREATE TABLE topics
(
	topic_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INTEGER,
	topic_title VARCHAR(100),
	is_active BOOLEAN DEFAULT 1,
	is_current BOOLEAN DEFAULT 1,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(user_id)
) ENGINE = 'InnoDB'; 


/*Creates the post table, which holds all the information about the post.*/
CREATE TABLE posts
(
	post_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	user_id INTEGER,
	topic_id INTEGER, 
	url TEXT, 
	description VARCHAR(100),
	upload_time TIMESTAMP,
	is_active BOOLEAN DEFAULT 1,
	next_topic VARCHAR(100),
	FOREIGN KEY(topic_id) REFERENCES topics(topic_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id)
) ENGINE = 'InnoDB';


/*Creates the votes table*/
CREATE TABLE votes
(
	vote_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	post_id INTEGER,
	user_id INTEGER,
	is_active BOOLEAN DEFAULT 1,
	voted_time TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(post_id) REFERENCES posts(post_id)
) ENGINE = 'InnoDB';



/* This query creates the table comments*/
CREATE TABLE comments
(
	comment_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	post_id INTEGER,
	user_id INTEGER,
	comment_content VARCHAR(100),
	is_active BOOLEAN DEFAULT 1,
	upload_time TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	FOREIGN KEY(post_id) REFERENCES posts(post_id)
) ENGINE = 'InnoDB';


