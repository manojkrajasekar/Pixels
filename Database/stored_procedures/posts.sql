USE pixels;		
 		
 /* This stored procedure is executed, when a picture is posted and the details of that pic are stored in the database */		
 /* TODO: Have to check whether the user is active ? */		
 /* QUESTION: what to do if any one (or) all of the fields are NULL ? */		
 DROP PROCEDURE IF EXISTS add_post;		
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
 	INSERT INTO posts		
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
 			
 	SELECT LAST_INSERT_ID() INTO _post_id;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Based on the given topic id, it displays all the posts */		
 /* QUESTION: What to do if the topic_id is NULL ? */		
 DROP PROCEDURE IF EXISTS get_posts_by_topic;		
 DELIMITER //		
 CREATE PROCEDURE get_posts_by_topic		
 (		
 	IN _topic_id INTEGER,
	IN _logged_in_user_id INTEGER	
 )		
 BEGIN		
 	SELECT  		
 			p.post_id AS 'post_id',		
 			p.url AS 'url',		
 			p.description AS 'post_description',		
 			u.first_name AS 'Posted_by',	
			uv.vote_id AS 'vote_id',
			uv.is_active AS 'is_voted',	
 			COUNT(DISTINCT v.vote_id) AS 'vote_count',		
 			COUNT(DISTINCT c.comment_id) AS 'comments_count'		
 		FROM posts p 		
 		JOIN users u		
 			ON p.user_id = u.user_id		
 				AND p.topic_id = _topic_id 		
 				AND u.is_active = 1		
 				AND p.is_active = 1
		LEFT JOIN votes uv
        	ON p.post_id = uv.post_id
            	AND uv.user_id = _logged_in_user_id	
 		LEFT JOIN votes v 		
 			ON p.post_id = v.post_id 		
 				AND v.is_active = 1		
 		LEFT JOIN comments c 		
 			ON p.post_id = c.post_id		
 				AND c.is_active = 1		
 		GROUP BY p.post_id;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 		
 /* Based on the given user id, it displays all the posts of that particular user */		
 /* QUESTION: What to do if the user_id is NULL ? */		
 DROP PROCEDURE IF EXISTS get_posts_by_user;		
 DELIMITER //		
 CREATE PROCEDURE get_posts_by_user		
 (		
 	IN _user_id INTEGER,
	IN _logged_in_user_id INTEGER
 )		
 BEGIN		
 	SELECT 		
 			p.post_id AS 'post_id',		
 			p.url AS 'url',		
 			p.description AS 'post_description',		
 			u.first_name AS 'posted_by',	
			uv.vote_id AS 'vote_id',
			uv.is_active AS 'is_voted',		
 			COUNT(DISTINCT v.vote_id) AS 'vote_count',		
 			COUNT(DISTINCT c.comment_id) AS 'comment_count'		
 		FROM posts p 		
 		JOIN users u		
 			ON p.user_id = u.user_id		
 				AND p.user_id = _user_id		
 				AND u.is_active = 1		
 				AND p.is_active = 1	
		LEFT JOIN votes uv
        	ON p.post_id = uv.post_id
            	AND uv.user_id = _logged_in_user_id		
 		LEFT JOIN votes v 		
 			ON p.post_id = v.post_id 		
 				AND v.is_active = 1		
 		LEFt JOIN comments c 		
 			ON p.post_id = c.post_id 		
 				AND c.is_active = 1		
 		GROUP BY p.post_id;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Fetches the voter information(First name of the voter) of a particular post, 		
  by passing post_id as the input parameter */		
  /* QUESTION: What to do if the post_id is NULL ? */		
 DROP PROCEDURE IF EXISTS get_voter_info_by_post;		
 DELIMITER //		
 CREATE PROCEDURE get_voter_info_by_post		
 (		
 	IN _post_id INTEGER		
 )		
 BEGIN		
 	SELECT  		
 			u.first_name AS 'voted_by',		
 			u.user_id AS 'user_id'		
         FROM votes v 		
         JOIN users u		
 			ON v.user_id = u.user_id		
 				AND v.post_id = _post_id 		
 				AND u.is_active = 1 		
 				AND v.is_active = 1 ;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 		
 		
 /* This stored procedure when executed, the description for the post is updated */		
 /* QUESTION: What to do if any one (or) all of the input parameters are null  */		
 DROP PROCEDURE IF EXISTS update_post;		
 DELIMITER //		
 CREATE PROCEDURE update_post		
 (		
 	IN _post_id INTEGER,		
 	IN _description VARCHAR(100)		
 )		
 BEGIN		
 	UPDATE posts p		
 		SET description = _description		
 		WHERE post_id = _post_id		
 			AND p.is_active = 1		
 			AND p.user_id = 1;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* Deactivates the post, by setting the is_active value to zero */		
 /* QUESTION: What to do if any one (or) all of the input parameters are null */		
 DROP PROCEDURE IF EXISTS delete_post;		
 DELIMITER //		
 CREATE PROCEDURE delete_post		
 (		
 	IN _post_id INTEGER		
 )		
 BEGIN		
 	UPDATE posts 		
 		SET is_active = 0		
 		WHERE post_id = _post_id 		
 			AND posts.is_active = 1;		
 			
 	UPDATE votes		
 		SET is_active = 0		
 		WHERE votes.post_id = _post_id 		
 			AND votes.is_active = 1;		
 			
 	UPDATE comments		
 		SET is_active = 0		
 		WHERE comments.post_id = _post_id 		
 			AND comments.is_active = 1;		
 END;		
 //		
 DELIMITER ;