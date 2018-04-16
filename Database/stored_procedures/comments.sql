USE pixels;		
 		
 /* stores the details of an added comment(user id, post id, comment) for a post in the comments table */		
 /*  QUESTION: What to do if any one (or) all of the input parameters are null  */		
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
 	INSERT INTO comments		
 	(		
 		user_id,		
 		post_id, 		
 		comment_content		
 	)		
 	VALUES		
 	(		
 		_user_id,		
 		_post_id, 		
 		_comment_content		
 	);		
 			
 	SELECT LAST_INSERT_ID() INTO _comment_id;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Displays all the comments for a post */		
 /* QUESTION: What to do if any one (or) all of the input parameters are null */		
 DROP PROCEDURE IF EXISTS get_comments;		
 DELIMITER //		
 CREATE PROCEDURE get_comments		
 (		
 	IN _post_id INTEGER,		
 	IN _limit INTEGER		
 )		
 BEGIN		
 
	IF _limit IS NULL THEN
		set _limit = 1;
	END IF;
	
 	SELECT  		
 			u.first_name AS 'commented_by',		
 			c.comment_content AS 'comment',		
 			c.upload_time AS 'time'		
 		FROM comments c 		
 		JOIN users u 		
 			ON u.user_id = c.user_id 		
 				AND c.post_id = _post_id		
 				AND u.is_active = 1 		
 				AND c.is_active = 1		
 		ORDER BY c.upload_time DESC		
 		LIMIT _limit ; 		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Updates the comment */		
 /* QUESTION: What to do if any one (or) all of the input parameters are null  */		
 DROP PROCEDURE IF EXISTS update_comment;		
 DELIMITER //		
 CREATE PROCEDURE update_comment		
 (		
 	IN _comment_content VARCHAR(200), 		
 	IN _comment_id INTEGER		
 )		
 BEGIN		
 	UPDATE comments c		
 		SET		
 			c.comment_content = _comment_content,		
 			c.upload_time = current_timestamp +0		
 		WHERE c.comment_id = _comment_id 		
 			AND c.is_active = 1;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Deactivates the comment, by seting the is_active value to 0 */		
 /* QUESTION: What to do if any one (or) all of the input parameters are null  */		
 DROP PROCEDURE IF EXISTS delete_comment;		
 DELIMITER //		
 CREATE PROCEDURE delete_comment		
 (		
 	IN _comment_id INTEGER 		
 )		
 BEGIN		
 	UPDATE comments 		
 		SET is_active = 0		
 		WHERE comment_id = _comment_id		
 			AND c.is_active = 1;		
 END;		
 //		
 DELIMITER ;
