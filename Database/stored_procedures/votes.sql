USE photoapp;		
 		
 /* Adds a vote for the post, stores the details of the user_id who voted and post_id for which the vote was casted */		
 /* QUESTION: What to do, if the user_id or post_id is null ? */		
 DROP PROCEDURE IF EXISTS add_vote;		
 DELIMITER //		
 CREATE PROCEDURE add_vote		
 (		
 	IN _post_id INTEGER,		
 	IN _user_id INTEGER,		
 	OUT _vote_id INTEGER		
 )		
 BEGIN		
 	INSERT INTO votes		
 	(		
 		post_id,		
 		user_id		
 	) 		
 	VALUES		
 	(		
 		_post_id,		
 		_user_id		
 	);		
 			
 	SELECT LAST_INSERT_ID() INTO _vote_id;		
 END;		
 //		
 DELIMITER ;		
 		
 /* Toggles the vote for a post, based on the current is_active value */		
 /* QUESTION: What to do if the vote_id is null ? */		
 DROP PROCEDURE IF EXISTS update_vote;		
 		
 DELIMITER //		
 CREATE PROCEDURE update_vote		
 (		
 	IN _vote_id INTEGER		
 )		
 BEGIN		
 			
 	UPDATE votes v		
 		SET v.is_active = NOT v.is_active		
 		WHERE v.vote_id = _vote_id;		
 	END;		
 	//		
 DELIMITER ;


/* Checks whether the vote is valid, if valid it makes it invalid. */
 DROP PROCEDURE IF EXISTS add_vote;		
 		
 DELIMITER //		
 BEGIN 
	DECLARE vote_id INT DEFAULT NULL;
    
    SET vote_id:= (	SELECT v.vote_id from votes v
						WHERE v.post_id = _post_id 
					 	AND v.user_id = _user_id
				  );
    
		IF (vote_id IS NULL) THEN
			INSERT INTO votes		
				(		
					post_id,		
					user_id		
				) 		
				VALUES		
				(		
					_post_id,		
					_user_id		
				);
		END IF;
		
		IF(vote_id IS NOT NULL) THEN
				UPDATE votes v		
					SET v.is_active = NOT v.is_active		
					WHERE v.vote_id = vote_id;	
		END IF;
	END;
	//
DELIMITER;
