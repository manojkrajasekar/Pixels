DROP PROCEDURE IF EXISTS add_comment;
/* This stored procedure when executed, saves the added comment in the comments table */
DELIMITER //
CREATE PROCEDURE add_comment
(
	IN _user_id INTEGER,
	IN _post_id INTEGER, 
	IN _comment_content VARCHAR(100),
	OUT _comment_id INTEGER
)
BEGIN
	INSERT INTO comments(user_id, post_id, comment_content) VALUES(_user_id, _post_id, _comment_content);
	
	SELECT last_insert_id() INTO _comment_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS get_comments;
/* This stored procedure when executed, displays all the comments for a particular post */
DELIMITER //
CREATE PROCEDURE get_comments
(
	IN _post_id INTEGER,
	IN _limit INTEGER
)
BEGIN
	SELECT  
		u.first_name,
		c.comment_content,
		c.upload_time
		FROM USER u JOIN comments c ON c.user_id = u.USER_ID 
		WHERE c.post_id = _post_id AND c.is_active = 1 
		ORDER BY upload_time 
		DESC LIMIT _limit ; 
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS update_comment;
/* This stored procedure when executed, updates the comment */
DELIMITER //
CREATE PROCEDURE update_comment
(
	IN _comment_content VARCHAR(200), 
	IN _comment_id INTEGER, 
	IN _post_id INTEGER,
	IN _user_id INTEGER
)
BEGIN
	UPDATE comments c
		SET comment_content = _comment_content
		WHERE c.comment_id = _comment_id AND c.post_id = _post_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS delete_comment;
/* This stored procedure when executed, Deactivates the comment */
DELIMITER //
CREATE PROCEDURE delete_comment
(
	IN _comment_id INTEGER, 
	IN _user_id INTEGER,
    IN _post_id INTEGER
)
BEGIN
	UPDATE comments c
		SET c.is_active = 0
			WHERE c.comment_id = _comment_id AND c.post_id = _post_id;
END;
//
DELIMITER ;

