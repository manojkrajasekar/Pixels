DROP PROCEDURE IF EXISTS add_post;
/* This stored procedure is executed, when a photo is posted and the details are stored in the database */
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
	
	INSERT INTO post(user_id, topic_id, url, description, next_topic) VALUES(_user_id, _topic_id, _url, _description, _next_topic);
	
	SELECT last_insert_id() INTO _post_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS get_posts;
/* This stored procedure when executed, displays all the comments for a particular post */
DELIMITER //
CREATE PROCEDURE get_posts
(
	IN _post_id INTEGER, 
	IN _user_id INTEGER
)
BEGIN
	SELECT  
		p.post_id,
		p.url,
		p.description,
		(SELECT COUNT(*) FROM votes WHERE v.is_active = 1 AND v.post_id = _post_id) AS total
		FROM post p JOIN votes v ON p.post_id = v.post_id 
		WHERE p.post_id = _post_id AND v.is_active = 1;
END;
//
DELIMITER ;



DROP PROCEDURE IF EXISTS update_post;
/* This stored procedure when executed, the description for the post is updated */
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


DROP PROCEDURE IF EXISTS delete_post;
/* This stored procedure when executed, deactivates the post */
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
