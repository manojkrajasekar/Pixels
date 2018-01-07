DROP PROCEDURE IF EXISTS add_post;
/* This stored procedure is executed, when a photo is posted and the details are stored in the database */
/* Have to check whether the user is active, and all other fields must not be null */
DELIMITER //
CREATE PROCEDURE add_post
(
	IN _user_id INTEGER,
	IN _topic_id INTEGER,
	IN _url TEXT,
	IN _description VARCHAR(100),
	IN _next_topic VARCHAR(100),
	OUT _post_id INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO post
	(
		user_id,
		topic_id, 
		url,
		description, 
		next_topic
	)
	VALUES
	(
		_user_id,
		_topic_id, 
		_url,
		_description, 
		_next_topic
	);
	
	SELECT last_insert_id() INTO _post_id;
END;
//
DELIMITER ;


/* This stored procedure when executed, displays all the comments for a particular post */
/* What to do if the topic_id is Null */
DROP PROCEDURE IF EXISTS get_posts_by_topic;
DELIMITER //
CREATE PROCEDURE get_posts_by_topic
(
	IN _topic_id INTEGER 
)
BEGIN
	SELECT  
		p.post_id AS 'POST ID',
		p.url AS 'URL',
		p.description AS 'Post Description',
        u.first_name AS 'Posted by',
        COUNT(v.post_id) AS 'Vote count'
        FROM post p 
        JOIN users u
        	    ON p.user_id = u.user_id
		LEFT JOIN votes v 
                ON p.post_id = v.post_id AND v.is_active = 1
        WHERE p.topic_id = _topic_id
        GROUP BY p.post_id;
END;
//
DELIMITER ;



/* This stored procedure when executed, displays all the comments for a particular post */
/* What to do if the user_id is Null */
DROP PROCEDURE IF EXISTS get_posts_by_user;
DELIMITER //
CREATE PROCEDURE get_posts_by_user
(
	IN _user_id INTEGER
)
BEGIN
	SELECT  
		p.post_id AS 'POST ID',
		p.url AS 'URL',
		p.description AS 'Post Description',
        u.first_name AS 'Posted by',
        COUNT(v.post_id) AS 'Vote count'
        FROM post p 
        JOIN users u
        	    ON p.user_id = u.user_id
		LEFT JOIN votes v 
                ON p.post_id = v.post_id AND v.is_active = 1
        WHERE p.user_id = _user_id
        GROUP BY p.user_id;
END;
//
DELIMITER ;




/* This stored procedure when executed, the description for the post is updated */
/* What to do if any one or all of these: user_id, post_id or description is null  */
DROP PROCEDURE IF EXISTS update_post;
DELIMITER //
CREATE PROCEDURE update_post
(
	IN _post_id INTEGER,
	IN _user_id INTEGER, 
	IN _description VARCHAR(100)
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE post p
		SET description = _description
		WHERE p.post_id = _post_id;
END;
//
DELIMITER ;


/* This stored procedure when executed, deactivates the post */
/* What to do if any one or all of these: user_id or post_id is null  */
DROP PROCEDURE IF EXISTS delete_post;
DELIMITER //
CREATE PROCEDURE delete_post
(
	IN _post_id INTEGER,
	IN _user_id INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE post p
	    SET is_active = 0
		WHERE p.post_id = _post_id;
END;
//
DELIMITER ;
