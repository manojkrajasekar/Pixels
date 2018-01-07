/* This stored procedure when executed, saves the added comment in the comments table */
/* What to do if ay one or all of these: user_id, post_id or comment_content is null  */
DROP PROCEDURE IF EXISTS add_comment;
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


/* This stored procedure when executed, displays all the comments for a particular post */
/* What to do if any one or all of these: post_id or limit is null */
DROP PROCEDURE IF EXISTS get_comments;
DELIMITER //
CREATE PROCEDURE get_comments
(
	IN _post_id INTEGER,
	IN _limit INTEGER
)
BEGIN
	SELECT  
		u.first_name AS 'Commented by',
		c.comment_content AS 'Comment',
		c.upload_time AS 'Time'
			FROM users u
			JOIN comments c ON c.user_id = u.user_id 
			WHERE c.post_id = _post_id AND c.is_active = 1 
			ORDER BY c.upload_time 
			DESC LIMIT _limit ; 
END;
//
DELIMITER ;


/* This stored procedure when executed, updates the comment */
/* What to do if any one or all of these: comment_id, user_id, post_id or comment_content is null  */
DROP PROCEDURE IF EXISTS update_comment;
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


/* This stored procedure when executed, Deactivates the comment */
/* What to do if any one or all of these: comment_id, user_id, or post_id is null  */
DROP PROCEDURE IF EXISTS delete_comment;
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

